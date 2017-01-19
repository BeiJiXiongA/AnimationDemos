//
//  LoopLabelView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 16/3/9.
//  Copyright © 2016年 zhangwei. All rights reserved.
//

#import "LoopLabelView.h"
#import "NSString+stringSize.h"

@interface LoopLabelView ()
{
    UILabel *textLabel;
    UIImageView *leftIcon;
    NSTimer *timer;
}
@end

@implementation LoopLabelView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor greenColor];
        
        [self addSubview:[self textLabel]];
        
        leftIcon = [[UIImageView alloc] init];
        leftIcon.backgroundColor = [UIColor blueColor];
        leftIcon.frame = CGRectMake(0, 0, 40, frame.size.height);
        [self addSubview:leftIcon];
        
        UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideTextLabel)];
        leftIcon.userInteractionEnabled = YES;
        [leftIcon addGestureRecognizer:leftTap];
        
        UIImageView *rightIcon = [[UIImageView alloc] init];
        rightIcon.backgroundColor = [UIColor blueColor];
        rightIcon.frame = CGRectMake(frame.size.width - 40, 0, 40, frame.size.height);
        [self addSubview:rightIcon];
    }
    return self;
}

-(void)showString:(NSString *)text
{
    [UIView setAnimationsEnabled:YES];
    if (self.frame.origin.x > 0) {
        [UIView animateWithDuration:1 animations:^{
            self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        }];
    }
    
    if (!textLabel) {
        [self insertSubview:[self textLabel] belowSubview:leftIcon];
        
    }
    CGSize size = [NSString getSizeWithString:text andHeight:textLabel.frame.size.height andFont:textLabel.font];
    CGRect textFrame = textLabel.frame;
    textFrame.origin.x = (self.frame.size.width - size.width)/2;
    textFrame.size.width = size.width;
    textLabel.frame = textFrame;
    textLabel.text = text;
    [self labelTap];
}

-(void)labelTap
{
    [UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        textLabel.frame = CGRectMake(-textLabel.frame.size.width, 0, textLabel.frame.size.width, textLabel.frame.size.height);
    } completion:^(BOOL finished) {
        textLabel.frame = CGRectMake(self.frame.size.width-40, 0, textLabel.frame.size.width, textLabel.frame.size.height);
        [UIView animateWithDuration:8 delay:0 options:UIViewAnimationOptionRepeat animations:^{
            textLabel.frame = CGRectMake(-textLabel.frame.size.width+40, 0, textLabel.frame.size.width, textLabel.frame.size.height);
        } completion:nil];
    }];
    
//    [UIView  beginAnimations:<#(nullable NSString *)#> context:<#(nullable void *)#>
//    + (void)setAnimationsEnabled:(BOOL)enabled;                         // ignore any attribute changes while set.
//    + (BOOL)areAnimationsEnabled;

}

-(void)hideTextLabel
{
    [UIView  setAnimationsEnabled:NO];
//    [CATransaction begin];
//    [textLabel.layer ];
//    [CATransaction commit];
}

-(void)hideTextLabel1
{
    [textLabel removeFromSuperview];
    textLabel = nil;
    [UIView animateWithDuration:1 animations:^{
        self.frame = CGRectMake(self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    }];
}

-(UILabel *)textLabel
{
    if (!textLabel) {
        textLabel = [[UILabel alloc] init];
        textLabel.frame = CGRectMake(40, 0, self.frame.size.width - 80, self.frame.size.height);
        textLabel.backgroundColor = [UIColor orangeColor];
        textLabel.font = [UIFont systemFontOfSize:16];
        textLabel.textColor = [UIColor lightGrayColor];
        textLabel.textAlignment = NSTextAlignmentCenter;

    }
    return textLabel;
}
@end
