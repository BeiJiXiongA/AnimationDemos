//
//  SHNumberView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/29.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "SHNumberView.h"

@interface SHNumberView ()
{
    UILabel *label1;
    UILabel *label2;
    int currentIndex;
}
@end

@implementation SHNumberView

-(id)init
{
    self = [super init];
    if (self) {
        [self setUpViews];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
    }
    return self;
}

-(void)setUpViews
{
    currentIndex = 1;
    
    label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(0, 0, 50, CGRectGetHeight(self.frame));
    label1.font = [UIFont systemFontOfSize:25];
    label1.text = @"";
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label1];
    
    label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(0, CGRectGetHeight(self.frame), 50, CGRectGetHeight(self.frame));
    label2.font = [UIFont systemFontOfSize:25];
    label2.text = @"";
    label2.backgroundColor = [UIColor clearColor];
    label2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label2];
    
//    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
}

-(void)setNumber:(NSInteger)num
{
    NSLog(@"1--%@\n2--%@",NSStringFromCGRect(label1.frame),NSStringFromCGRect(label2.frame));
    if (currentIndex == 1) {
        label2.text = [NSString stringWithFormat:@"%zi",num];
        if (num < 10) {
            label2.text = [NSString stringWithFormat:@"0%zi",num];
        }
        [UIView animateWithDuration:0.2f animations:^{
            label1.alpha = 0;
            label2.alpha = 1;
            label1.frame = CGRectMake(0, -CGRectGetHeight(self.frame), 50, CGRectGetHeight(self.frame));
            label2.frame = CGRectMake(0, 0, 50, CGRectGetHeight(self.frame));
        } completion:^(BOOL finished) {
            label1.frame = CGRectMake(0, CGRectGetHeight(self.frame), 50, CGRectGetHeight(self.frame));
        }];
        currentIndex = 2;
    }else if(currentIndex == 2){
        label1.text = [NSString stringWithFormat:@"%zi",num];
        if (num < 10) {
            label1.text = [NSString stringWithFormat:@"0%zi",num];
        }
        [UIView animateWithDuration:0.2f animations:^{
            label1.alpha = 1;
            label2.alpha = 0;
            label2.frame = CGRectMake(0, -CGRectGetHeight(self.frame), 50, CGRectGetHeight(self.frame));
            label1.frame = CGRectMake(0, 0, 50, CGRectGetHeight(self.frame));
        } completion:^(BOOL finished) {
            label2.frame = CGRectMake(0, CGRectGetHeight(self.frame), 50, CGRectGetHeight(self.frame));
        }];
        currentIndex = 1;
    }
    NSLog(@"1--%@\n2--%@",NSStringFromCGRect(label1.frame),NSStringFromCGRect(label2.frame));
}

-(void)setNum:(NSInteger)num
{
    label1.text = [NSString stringWithFormat:@"%zi",num];
    if (num < 10) {
        label1.text = [NSString stringWithFormat:@"0%zi",num];
    }
}

-(void)setLabelColor:(UIColor *)labelColor
{
    label1.textColor = labelColor;
    label2.textColor = labelColor;
}

-(void)setLabelFont:(UIFont *)labelFont
{
    label1.font = labelFont;
    label2.font = labelFont;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
