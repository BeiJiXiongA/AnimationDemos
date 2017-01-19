//
//  SHTempNotification.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/30.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

#import "SHTempNotification.h"

@interface SHTempNotification ()
{
    UIImageView *iconImageView;
    UILabel *titleLabel;
    UIButton *checkButton;
}
@end

@implementation SHTempNotification
-(id)init
{
    self = [super init];
    if (self) {
        [self setUpSubViews];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubViews];
    }
    return self;
}

-(void)setUpSubViews
{
    self.frame = CGRectMake(0, -80, [[UIScreen mainScreen] bounds].size.width, 80);
    self.backgroundColor = [UIColor blackColor];
    
    UIVisualEffect *visualEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:visualEffect];
    blurView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
    [self addSubview:blurView];
    
    iconImageView = [[UIImageView alloc] init];
    iconImageView.frame = CGRectMake(10, 25, 40, 40);
    iconImageView.backgroundColor = [UIColor whiteColor];
    iconImageView.image = [UIImage imageNamed:@"Icon-Small"];
    iconImageView.layer.cornerRadius = 5;
    iconImageView.clipsToBounds = YES;
    [self addSubview:iconImageView];
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(60, 25, SCREEN_WIDTH - 130, 25);
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.text = @"标题标题标题标题标题标题标题";
    [self addSubview:titleLabel];
    
    checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    checkButton.frame = CGRectMake(SCREEN_WIDTH - 80, 26, 60, 30);
    [checkButton setTitle:@"查看" forState:UIControlStateNormal];
    checkButton.layer.borderColor = [UIColor whiteColor].CGColor;
    checkButton.layer.borderWidth = .8;
    checkButton.layer.cornerRadius = 5;
    [checkButton addTarget:self action:@selector(checkClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:checkButton];
    
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [[[UIApplication sharedApplication] keyWindow] bringSubviewToFront:self];
}

-(void)checkClick
{
    if ([self.delegate respondsToSelector:@selector(checkClick:)]) {
        [self.delegate checkClick:_object];
    }
    [self dismiss];
}

-(void)showNotificationAnimated:(BOOL)animated
{
//    if (animated) {
//        
//    }else{
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 80);
        } completion:^(BOOL finished) {
            [self performSelector:@selector(dismiss) withObject:nil afterDelay:1];
        }];
//    }
}

-(void)setObject:(id)object
{
    _object = object;
}

-(void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, -80, SCREEN_WIDTH, 80);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
