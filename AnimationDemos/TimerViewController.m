//
//  TimerViewController.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/22.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "TimerViewController.h"
#import "LoopLabelView.h"

@interface TimerViewController ()

{
    NSInteger startDealedNum;
    NSInteger endDealedNum;
    LoopLabelView *loopLabelView;
}
@property (weak, nonatomic) IBOutlet UIImageView *hourImageView;
@property (weak, nonatomic) IBOutlet UIImageView *minuteImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;

@property (nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.hourImageView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.secondImageView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteImageView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    loopLabelView = [[LoopLabelView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 49 - 80, self.view.frame.size.width, 40)];
    [self.view addSubview:loopLabelView];
    
    [loopLabelView showString:@"空间家已帮助89897家企业找到空间"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setLabelText)];
    self.timeLabel.userInteractionEnabled = YES;
    [self.timeLabel addGestureRecognizer:tap];
}

-(void)setLabelText
{
    [loopLabelView showString:[NSString stringWithFormat:@"%@",[NSDate date]]];
}

-(void)tick
{
    [self updateHandsAnimated:YES];
}

-(void)updateHandsAnimated:(BOOL)animated
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    CGFloat hourAngle = (components.hour / 12.0) * M_PI * 2.0;
    
    CGFloat minuteAngle = (components.minute / 60.0) * M_PI * 2.0;
    
    CGFloat secondAngle = (components.second / 60.0) *M_PI * 2.0;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld:%ld:%ld",(long)components.hour,(long)components.minute,(long)components.second];
    
    [self setAngle:hourAngle forHand:self.hourImageView animated:animated];
    [self setAngle:minuteAngle forHand:self.minuteImageView animated:animated];
    [self setAngle:secondAngle forHand:self.secondImageView animated:animated];
    
    CABasicAnimation *animation1 =
    [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    // 终点设定
    animation1.removedOnCompletion = YES;
    animation1.toValue = [NSNumber numberWithFloat:-30];; // 終点
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    /* 动画2（绕Z轴中心旋转） */
    CABasicAnimation *animation2 =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    // 设定旋转角度
    animation2.fromValue = [NSNumber numberWithFloat:0.0]; // 开始时的角度
    animation2.toValue = [NSNumber numberWithFloat:44 * M_PI]; // 结束时的角度
    
    
    /* 动画组 */
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    // 动画选项设定
    group.duration = 3.0;
    group.repeatCount = 1;
    
    // 添加动画
    group.animations = [NSArray arrayWithObjects:animation1, animation2, nil];
//    [self.timeLabel.layer addAnimation:animation1 forKey:@"move-rotate-layer"];
//    self.timeLabel.clipsToBounds = YES;
}

-(void)setAngle:(CGFloat)angle forHand:(UIView *)handView animated:(BOOL)animated
{
    CATransform3D transform = CATransform3DMakeRotation(angle, 0, 0, 1);
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animation];
        [self updateHandsAnimated:NO];
        animation.keyPath = @"transform";
        animation.toValue = [NSValue valueWithCATransform3D:transform];
        animation.duration = 0.5f;
        animation.delegate = self;
        [animation setValue:handView forKey:@"handView"];
        [handView.layer addAnimation:animation forKey:nil];
    }else{
        handView.layer.transform = transform;
    }
}

-(void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag
{
    UIView *handView = [anim valueForKey:@"handView"];
    handView.layer.transform = [anim.toValue CATransform3DValue];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
