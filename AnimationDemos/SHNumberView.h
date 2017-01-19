//
//  SHNumberView.h
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/29.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHNumberView : UIView
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, assign) UIFont *labelFont;
@property (nonatomic, assign) UIColor *labelColor;
-(void)setNumber:(NSInteger)num;
@end
