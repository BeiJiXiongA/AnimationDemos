//
//  TuoYuanView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/24.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "TuoYuanView.h"

@implementation TuoYuanView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context,255.0/0.00f/255.00f,0.00f/255.00f,0.00/255.00f,0.5f);//画笔线的颜色
    CGContextSetRGBFillColor(context, 255.0/0.00f/255.00f,0.00f/255.00f,0.00/255.00f,0.5f);
    CGContextSetLineWidth(context, 2.0);//线的宽度
    CGContextSetLineCap(context, kCGLineCapRound);
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    
    //画椭圆
    CGContextAddEllipseInRect(context, _tuoYuanRect); //椭圆
    CGContextDrawPath(context, kCGPathFillStroke);
    
//    CGContextAddArc(context, 15, 15, 13, 0, M_PI*7/4, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
}


@end
