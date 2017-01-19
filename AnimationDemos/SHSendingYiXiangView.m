//
//  SHSendingYiXiangView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/28.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "SHSendingYiXiangView.h"

#define DURATION  .3f
#define DELAY     .3f

#define OPACITYEND  0.1f
#define OPACITYMID   0.5f
#define OPACITYSTART  1.0f

#define  SCALEEND   0.5f
#define SCALEMID    1.0f
#define SCALESTART  1.5f

@interface SHSendingYiXiangView ()
{
    CALayer *layer1;
    CALayer *layer2;
    CALayer *layer3;
}
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) UIImageView *demoImageView;
@end

@implementation SHSendingYiXiangView

-(id)init
{
    self = [super init];
    if (self) {
        [self setUpSUbViews];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSUbViews];
    }
    return self;
}

-(void)setUpSUbViews
{
    _images = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 37; i++) {
        NSString *imageName = [NSString stringWithFormat:@"_00%d_w%d.png",i,i+1];
        if(i<10){
            imageName = [NSString stringWithFormat:@"_000%d_w%d.png",i,i+1];
        }
        [_images addObject:[UIImage imageNamed:imageName]];
    }
    _demoImageView = [[UIImageView alloc] init];
    _demoImageView.frame = CGRectMake(0, 0, 115, 129);
    _demoImageView.image = [_images firstObject];
    _demoImageView.animationImages = _images;
    _demoImageView.animationDuration = _images.count * 0.06f;
    _demoImageView.animationRepeatCount = 0;
    [_demoImageView startAnimating];
    [self addSubview:_demoImageView];
    
    CGRect originRect = CGRectMake((self.frame.size.width - 270)/2, 85, 270, 83);
    
    layer3 = [CALayer layer];
    layer3.backgroundColor = [UIColor clearColor].CGColor;
    layer3.frame = originRect;
    layer3.opacity = 0;
    layer3.contents = (id)[UIImage imageNamed:@"s3"].CGImage;
    [self.layer addSublayer:layer3];
    
    layer2 = [CALayer layer];
    layer2.backgroundColor = [UIColor clearColor].CGColor;
    layer2.frame = originRect;
    layer2.opacity = 0;
    layer2.contents = (id)[UIImage imageNamed:@"s2"].CGImage;
    [self.layer addSublayer:layer2];
    
    layer1 = [CALayer layer];
    layer1.backgroundColor = [UIColor clearColor].CGColor;
    layer1.frame = originRect;
    layer1.contents = (id)[UIImage imageNamed:@"s1"].CGImage;
    [self.layer addSublayer:layer1];
    
    [self smallBig];
}

-(void)smallBig
{
    [layer1 addAnimation:[self fangDaChuXianAnimation] forKey:nil];
    [self performSelector:@selector(midBig) withObject:nil afterDelay:DELAY];
}

-(void)midBig
{
    [layer2 addAnimation:[self fangDaChuXianAnimation] forKey:nil];
    [self performSelector:@selector(bigBig) withObject:nil afterDelay:DELAY];
}

-(void)bigBig
{
    [layer3 addAnimation:[self fangDaChuXianAnimation] forKey:nil];
    [self performSelector:@selector(allClear) withObject:nil afterDelay:DELAY];
}

-(void)allClear
{
    [layer3 addAnimation:[self jiXuFangDaXiaoShiAnimation] forKey:nil];
    [layer2 addAnimation:[self jiXuFangDaXiaoShiAnimation] forKey:nil];
    [layer1 addAnimation:[self jiXuFangDaXiaoShiAnimation] forKey:nil];
    [self performSelector:@selector(smallBig) withObject:nil afterDelay:DELAY];
}

-(void)bigClear
{
    [layer3 addAnimation:[self jiXuFangDaXiaoShiAnimation] forKey:nil];
    [self performSelector:@selector(midClear) withObject:nil afterDelay:DELAY];
}

-(void)midClear
{
    [layer2 addAnimation:[self jiXuFangDaXiaoShiAnimation] forKey:nil];
    [self performSelector:@selector(smallClear) withObject:nil afterDelay:DELAY];
}

-(void)smallClear
{
    [layer1 addAnimation:[self jiXuFangDaXiaoShiAnimation] forKey:nil];
    [self performSelector:@selector(smallBig) withObject:nil afterDelay:DELAY];
}

-(void)bigSmall
{
    [layer3 addAnimation:[self suoXiaoXiaoShiAnimation] forKey:nil];
    [self performSelector:@selector(midSmall) withObject:nil afterDelay:DELAY];
}

-(void)midSmall
{
    [layer2 addAnimation:[self suoXiaoXiaoShiAnimation] forKey:nil];
    [self performSelector:@selector(smallSmall) withObject:nil afterDelay:DELAY];
}

-(void)smallSmall
{
    [layer1 addAnimation:[self suoXiaoXiaoShiAnimation] forKey:nil];
    [self performSelector:@selector(smallBig) withObject:nil afterDelay:DELAY];
}

#pragma mark - 放大消失
-(CAAnimationGroup *)fangDaXiaoShiAnimation
{
    CABasicAnimation *fangDaAnimation = [self fangDaAnimation];
    CABasicAnimation *xiaoShiAnimation = [self xiaoShiAnimation];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[fangDaAnimation,xiaoShiAnimation];
    group.duration = DURATION;
    group.autoreverses = NO;
    group.removedOnCompletion = NO;
    group.repeatCount = 1;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.fillMode=kCAFillModeBoth;
    return group;
}

#pragma mark - 继续放大消失
-(CAAnimationGroup *)jiXuFangDaXiaoShiAnimation
{
    CABasicAnimation *fangDaAnimation = [self jiXuFangDaAnimation];
    CABasicAnimation *xiaoShiAnimation = [self xiaoShiAnimation];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[fangDaAnimation,xiaoShiAnimation];
    group.duration = DURATION;
    group.autoreverses = NO;
    group.removedOnCompletion = NO;
    group.repeatCount = 1;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.fillMode=kCAFillModeBoth;
    return group;
}

#pragma mark - 放大出现
-(CAAnimationGroup *)fangDaChuXianAnimation
{
    CABasicAnimation *fangDaAnimation = [self fangDaAnimation];
    CABasicAnimation *chuXianAnimation = [self chuXianAnimation];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[fangDaAnimation,chuXianAnimation];
    group.duration = DURATION;
    group.autoreverses = NO;
    group.removedOnCompletion = NO;
    group.repeatCount = 1;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.fillMode=kCAFillModeBoth;
    return group;
}

#pragma mark - 缩小消失
-(CAAnimationGroup *)suoXiaoXiaoShiAnimation
{
    CABasicAnimation *suoXiaoAnimation = [self suoXiaoAnimation];
    CABasicAnimation *xiaoShiAnimation = [self xiaoShiAnimation];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[suoXiaoAnimation,xiaoShiAnimation];
    group.duration = DURATION;
    group.autoreverses = NO;
    group.removedOnCompletion = NO;
    group.repeatCount = 1;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.fillMode=kCAFillModeBoth;
    return group;
}

#pragma mark - 缩小出现

-(CAAnimationGroup *)suoXiaoChuXianAnimation
{
    CABasicAnimation *suoXiaoAnimation = [self suoXiaoAnimation];
    CABasicAnimation *chuXianAnimation = [self chuXianAnimation];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[suoXiaoAnimation,chuXianAnimation];
    group.duration = DURATION;
    group.autoreverses = NO;
    group.removedOnCompletion = NO;
    group.repeatCount = 1;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.fillMode=kCAFillModeBoth;
    return group;
}


-(CABasicAnimation *)fangDaAnimation
{
    CABasicAnimation *circleScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    circleScaleAnimation.fromValue = [NSNumber numberWithFloat:SCALEEND];
    circleScaleAnimation.toValue = [NSNumber numberWithFloat:SCALEMID];
    circleScaleAnimation.duration = DURATION;
    circleScaleAnimation.autoreverses = NO;
    circleScaleAnimation.removedOnCompletion = NO;
    circleScaleAnimation.repeatCount = 1;
    circleScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    circleScaleAnimation.fillMode=kCAFillModeBoth;
    return circleScaleAnimation;
}

-(CABasicAnimation *)jiXuFangDaAnimation
{
    CABasicAnimation *circleScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    circleScaleAnimation.fromValue = [NSNumber numberWithFloat:SCALEMID];
    circleScaleAnimation.toValue = [NSNumber numberWithFloat:SCALESTART];
    circleScaleAnimation.duration = DURATION;
    circleScaleAnimation.autoreverses = NO;
    circleScaleAnimation.removedOnCompletion = NO;
    circleScaleAnimation.repeatCount = 1;
    circleScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    circleScaleAnimation.fillMode=kCAFillModeBoth;
    return circleScaleAnimation;
}

-(CABasicAnimation *)suoXiaoAnimation
{
    CABasicAnimation *circleScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    circleScaleAnimation.fromValue = [NSNumber numberWithFloat:SCALESTART];
    circleScaleAnimation.toValue = [NSNumber numberWithFloat:SCALEEND];
    circleScaleAnimation.duration = DURATION;
    circleScaleAnimation.autoreverses = NO;
    circleScaleAnimation.removedOnCompletion = NO;
    circleScaleAnimation.repeatCount = 1;
    circleScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    circleScaleAnimation.fillMode=kCAFillModeBoth ;
    return circleScaleAnimation;
    
}

-(CABasicAnimation *)xiaoShiAnimation
{
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = [NSNumber numberWithFloat:OPACITYSTART];
    alphaAnimation.toValue = [NSNumber numberWithFloat:OPACITYEND];
    alphaAnimation.duration = DURATION;
    alphaAnimation.autoreverses = NO;
    alphaAnimation.removedOnCompletion = NO;
    alphaAnimation.repeatCount = 1;
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    alphaAnimation.fillMode=kCAFillModeBoth ;
    return alphaAnimation;
}

-(CABasicAnimation *)chuXianAnimation
{
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = [NSNumber numberWithFloat:OPACITYEND];
    alphaAnimation.toValue = [NSNumber numberWithFloat:OPACITYSTART];
    alphaAnimation.duration = DURATION;
    alphaAnimation.autoreverses = NO;
    alphaAnimation.removedOnCompletion = NO;
    alphaAnimation.repeatCount = 1;
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    alphaAnimation.fillMode=kCAFillModeBoth ;
    return alphaAnimation;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
