//
//  UpglideAnimationView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/11/19.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "UpglideAnimationView.h"

@interface UpglideAnimationView ()
{
    BOOL isAtBottom;
}
@end

@implementation UpglideAnimationView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button1.frame = CGRectMake(10, CGRectGetHeight(frame)-30, 40, 40);
        [_button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _button1.backgroundColor = [UIColor greenColor];
        [self addSubview:_button1];
        
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button2.frame = CGRectMake(10 + 50, CGRectGetHeight(frame)-30, 40, 40);
        [_button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _button2.backgroundColor = [UIColor greenColor];
        [self addSubview:_button2];
        
        _button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button3.frame = CGRectMake(10 + 100, CGRectGetHeight(frame)-30, 40, 40);
        [_button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _button3.backgroundColor = [UIColor greenColor];
        [self addSubview:_button3];
        
    }
    return self;
}

-(void)buttonClick:(UIButton *)button
{
    if (isAtBottom) {
        [self up];
    }else{
        [self down];
    }
    isAtBottom = !isAtBottom;
    if ([self.delegate respondsToSelector:@selector(buttonClick)]) {
        [self.delegate buttonClick];
    }
}

-(void)down
{
    if (isAtBottom) {
        return;
    }
    CGFloat duration = .3f;
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _button1.center = CGPointMake(_button1.center.x ,CGRectGetHeight(self.frame) - CGRectGetHeight(_button1.frame)/2-0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _button1.center = CGPointMake(_button1.center.x ,CGRectGetHeight(self.frame) - CGRectGetHeight(_button1.frame)/2-10);
        } completion:nil];
    }];
    
    [UIView animateWithDuration:duration delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _button2.center = CGPointMake(_button2.center.x ,CGRectGetHeight(self.frame) - CGRectGetHeight(_button2.frame)/2-0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _button2.center = CGPointMake(_button2.center.x ,CGRectGetHeight(self.frame) - CGRectGetHeight(_button2.frame)/2-10);
        } completion:nil];
    }];
    
    [UIView animateWithDuration:duration delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _button3.center = CGPointMake(_button3.center.x ,CGRectGetHeight(self.frame) - CGRectGetHeight(_button3.frame)/2-0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _button3.center = CGPointMake(_button3.center.x ,CGRectGetHeight(self.frame) - CGRectGetHeight(_button3.frame)/2-10);
        } completion:^(BOOL finished) {
            isAtBottom = YES;
        }];
    }];
}

-(void)up
{
    if (!isAtBottom) {
        return;
    }
    CGFloat duration = .3f;
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _button1.center = CGPointMake(CGRectGetMidX(_button1.frame), CGRectGetHeight(_button1.frame)/2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _button1.center = CGPointMake(CGRectGetMidX(_button1.frame), CGRectGetHeight(_button1.frame)/2 + 10);
        } completion:nil];
    }];
    
    [UIView animateWithDuration:duration delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _button2.center = CGPointMake(CGRectGetMidX(_button2.frame), CGRectGetHeight(_button2.frame)/2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _button2.center = CGPointMake(CGRectGetMidX(_button2.frame), CGRectGetHeight(_button2.frame)/2 + 10);
        } completion:nil];
    }];
    
    [UIView animateWithDuration:duration delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _button3.center = CGPointMake(CGRectGetMidX(_button3.frame), CGRectGetHeight(_button3.frame)/2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _button3.center = CGPointMake(CGRectGetMidX(_button3.frame), CGRectGetHeight(_button3.frame)/2 + 10);
        } completion:^(BOOL finished) {
            isAtBottom = NO;
        }];
    }];
}

@end
