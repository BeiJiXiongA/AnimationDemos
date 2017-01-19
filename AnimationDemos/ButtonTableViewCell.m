//
//  ButtonTableViewCell.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/11/22.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "ButtonTableViewCell.h"

@interface ButtonTableViewCell ()
{
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
}
@end

@implementation ButtonTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *buttonBgView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 180, 0, 160, 50)];
        buttonBgView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:buttonBgView];
        
        button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.backgroundColor = [UIColor greenColor];
        button1.frame =CGRectMake(10, 5, 40, 40);
        [buttonBgView addSubview:button1];
        
        button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.backgroundColor = [UIColor greenColor];
        button2.frame = CGRectMake(10+50, 5, 40, 40);
        [buttonBgView addSubview:button2];
        
        button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        button3.backgroundColor = [UIColor greenColor];
        button3.frame = CGRectMake(10+100, 5, 40, 40);
        [buttonBgView addSubview:button3];
    }
    return self;
}

@end
