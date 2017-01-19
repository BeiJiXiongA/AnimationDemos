//
//  SHYiXiangSendingStringView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/29.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "SHYiXiangSendingStringView.h"

@interface SHYiXiangSendingStringView ()
{
    UILabel *textLabel;
    SHNumberView *minuteView;
    SHNumberView *secondView;
    
    SHNumberView *numView;
}
@end

@implementation SHYiXiangSendingStringView


-(id)initWithMinute:(NSInteger)minute
             second:(NSInteger)second
              frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSString *text = @"      分        秒";
        textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        textLabel.text = text;
        textLabel.textColor = [UIColor grayColor];
        textLabel.font = [UIFont systemFontOfSize:20];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:textLabel];
        
        minuteView = [[SHNumberView alloc] initWithFrame:CGRectMake(30, 0, 50, 50)];
        minuteView.num = 3;
        minuteView.labelColor = [UIColor orangeColor];
        minuteView.labelFont = [UIFont systemFontOfSize:25];
        [self addSubview:minuteView];
        
        secondView = [[SHNumberView alloc] initWithFrame:CGRectMake(93, 0, 50, 50)];
        secondView.num = 0;
        secondView.labelColor = [UIColor orangeColor];
        secondView.labelFont = [UIFont systemFontOfSize:25];
        [self addSubview:secondView];
        
        self.clipsToBounds = YES;
    }
    return self;
}

-(void)setMinute:(NSInteger)minute
{
    [minuteView setNumber:minute];
}

-(void)setSecond:(NSInteger)second
{
    [secondView setNumber:second];
}

-(id)initWithNum:(NSInteger)num
           frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSString *text = @"已经通知        位经纪人";
        textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        textLabel.text = text;
        textLabel.textColor = [UIColor grayColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:textLabel];
        
        numView = [[SHNumberView alloc] initWithFrame:CGRectMake(75, 0, 40, 50)];
        numView.num = num;
        numView.labelColor = [UIColor orangeColor];
        numView.labelFont = [UIFont systemFontOfSize:25];
        [self addSubview:numView];
        
        self.clipsToBounds = YES;
    }
    return self;
}

-(void)setNum:(NSInteger)num
{
    [numView setNumber:num];
}

-(CGSize)getSizeFromString:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    CGSize size = [label sizeThatFits:CGSizeMake(100, CGRectGetHeight(self.frame))];
    return size;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
