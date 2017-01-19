//
//  SHCircleView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/23.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "SHCircleView.h"

@implementation SHCircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor redColor];
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,106.00f/255.00f,209.00f/255.00f,254.00/255.00f,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 2.0);//线的宽度
    CGContextSetLineCap(context, kCGLineCapRound);
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(context, 15, 15, 13, 0, M_PI*7/4, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:(M_PI) * 2]; // 3 is the number of 360 degree rotations
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    //    rotationAnimation.duration = 1.0f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotationAnimation.duration = 2;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.removedOnCompletion = NO;
    [self.layer addAnimation:rotationAnimation forKey:nil];
}


@end
