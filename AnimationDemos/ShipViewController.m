//
//  ShipViewController.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/22.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "ShipViewController.h"
#import "SHTouBiaoView.h"
#import "SHXiaoHongRenView.h"

@interface ShipViewController ()
{
    CALayer *bigCircleLayer;
    CAShapeLayer *pathLayer;
    CALayer *shipLayer;
}
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) UIImageView *demoImageView;
@property (nonatomic, strong) NSMutableArray *images;
@end

@implementation ShipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _images = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 1; i <= 42; i++) {
        NSString *imageName = [NSString stringWithFormat:@"_00%d_m%d.png",42-i+1,i];
        if(42-i+1 < 10 ){
            imageName = [NSString stringWithFormat:@"_000%d_m%d.png",42-i+1,i];
        }
        NSLog(@"name %@",imageName);
        [_images addObject:[UIImage imageNamed:imageName]];
    }
    
}
- (IBAction)clearAnimationView:(id)sender {
//    for(UIView *v in _containerView.subviews){
//        [v removeFromSuperview];
//    }
}

- (IBAction)tapContainerView:(UITapGestureRecognizer *)tap
{
    CGPoint centerPoint = [tap locationInView:self.containerView];
    NSLog(@"center point %@",NSStringFromCGPoint(centerPoint));
    
//    [[SHXiaoHongRenView sharedXiaoHongRen] addXiaoHongRenToPoint:centerPoint inView:self.containerView];
    

    
//    [UIView animateWithDuration:0.6f animations:^{
//        _demoImageView.frame = CGRectMake(centerPoint.x-35, centerPoint.y-92, 70, 92);
//    } completion:^(BOOL finished) {
//        _demoImageView.image = [_images firstObject];
//        _demoImageView.animationImages = _images;
//        _demoImageView.animationDuration = _images.count * 0.02f;
//        _demoImageView.animationRepeatCount = 1;
//        [_demoImageView startAnimating];
//    }];
    
//    [UIView animateWithDuration:0.35f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        _demoImageView.frame = CGRectMake(centerPoint.x-23, centerPoint.y-60, 46, 60);
//        _demoImageView.alpha = 1;
//    } completion:^(BOOL finished) {
//        _demoImageView.image = [_images firstObject];
//        _demoImageView.animationImages = _images;
//        _demoImageView.animationDuration = _images.count * 0.02f;
//        _demoImageView.animationRepeatCount = 1;
//        [_demoImageView startAnimating];
//    }];
    
    SHTouBiaoView *toubiaoView = [[SHTouBiaoView alloc] init];
    [toubiaoView addAnimationToPoint:centerPoint inView:self.containerView];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"%s",__func__);
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%s",__func__);
    [shipLayer removeFromSuperlayer];
    [pathLayer removeFromSuperlayer];
    [bigCircleLayer removeFromSuperlayer];
    [shipLayer removeAnimationForKey:@"toubiao"];
}

- (IBAction)start
{
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"transform.rotation";
//    animation.duration = 2.0;
//    animation.byValue = @(M_PI * 2);
//    animation.delegate = self;
//    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
}
- (IBAction)stop
{
//    [self.shipLayer removeAnimationForKey:@"rotateAnimation"];
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
