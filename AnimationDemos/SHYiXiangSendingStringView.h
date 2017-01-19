//
//  SHYiXiangSendingStringView.h
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/29.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHNumberView.h"
@interface SHYiXiangSendingStringView : UIView
-(id)initWithMinute:(NSInteger)minute
             second:(NSInteger)second
              frame:(CGRect)frame;
-(void)setMinute:(NSInteger)minute;
-(void)setSecond:(NSInteger)second;


-(id)initWithNum:(NSInteger)num
           frame:(CGRect)frame;
-(void)setNum:(NSInteger)num;
@end
