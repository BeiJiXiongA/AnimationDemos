//
//  SHTempNotification.h
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/30.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TempDelegate <NSObject>

-(void)checkClick:(id)object;

@end

@interface SHTempNotification : UIView

@property (nonatomic, strong) id object;
@property (nonatomic, assign) id<TempDelegate> delegate;

-(void)showNotificationAnimated:(BOOL)animated;

@end
