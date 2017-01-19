//
//  SHXiaoHongRenView.h
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/28.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHXiaoHongRenView : UIView

+(id)sharedXiaoHongRen;

-(void)addXiaoHongRenToPoint:(CGPoint)centerPoint inView:(UIView *)fatherView;

@end
