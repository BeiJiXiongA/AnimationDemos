//
//  SHTouBiaoView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/22.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "SHTouBiaoView.h"
@interface SHTouBiaoView ()
{
    CALayer *bigCircleLayer;
    CALayer *smallCircleLayer;
    CAShapeLayer *pathLayer;
    CALayer *shipLayer;
}
@end
@implementation SHTouBiaoView

-(void)addAnimationToPoint:(CGPoint)centerPoint inView:(UIView *)superView
{
    self.layer.anchorPoint = CGPointMake(0, 1);
    self.frame = CGRectMake(centerPoint.x, centerPoint.y-100, 100, 100);
    self.backgroundColor = [UIColor clearColor];
    [superView addSubview:self];
    
    CGPoint startPoint = CGPointMake(100,  50);
    CGPoint controlPoint = CGPointMake( 50,   20);
    
    bigCircleLayer = [CALayer layer];
    bigCircleLayer.frame = CGRectMake(-20, 80, 40, 40);
    bigCircleLayer.cornerRadius = 20;
    bigCircleLayer.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3].CGColor;
    [self.layer addSublayer:bigCircleLayer];
    
    smallCircleLayer = [CALayer layer];
    smallCircleLayer.frame = CGRectMake(-10, 90, 20, 20);
    smallCircleLayer.cornerRadius = 10;
    smallCircleLayer.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3].CGColor;
    [self.layer addSublayer:smallCircleLayer];
    
    CABasicAnimation *circleScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    circleScaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    circleScaleAnimation.toValue = [NSNumber numberWithFloat:0.3];
    circleScaleAnimation.duration = 0.5f;
    circleScaleAnimation.repeatCount =  HUGE_VALF;
    circleScaleAnimation.autoreverses = YES;
    circleScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [bigCircleLayer addAnimation:circleScaleAnimation forKey:nil];
    [smallCircleLayer addAnimation:circleScaleAnimation forKey:nil];
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:startPoint];
    [bezierPath addCurveToPoint:CGPointMake(0, 100) controlPoint1:controlPoint controlPoint2:controlPoint];
    
    pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor clearColor].CGColor;
    pathLayer.lineWidth = 2.0f;
    [self.layer addSublayer:pathLayer];
    
    shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(startPoint.x, startPoint.y, 50, 80);
    shipLayer.position = centerPoint;
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@""].CGImage;
    shipLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.layer addSublayer:shipLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    //    animation.duration = 1.0f;
    animation.path = bezierPath.CGPath;
    //    animation.rotationMode = kCAAnimationRotateAuto; //没有这句图片方向不会变化
    
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:(-M_PI) * 2]; // 3 is the number of 360 degree rotations
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    //    rotationAnimation.duration = 1.0f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.1];
    //    scaleAnimation.duration = 2.0f;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,scaleAnimation,rotationAnimation];
    group.duration = 1.5f;
    group.delegate = self;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [shipLayer addAnimation:group forKey:@"toubiao"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
