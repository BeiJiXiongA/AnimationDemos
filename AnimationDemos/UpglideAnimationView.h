//
//  UpglideAnimationView.h
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/11/19.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UpglideAnimationViewDelegate  <NSObject>

-(void)buttonClick;

@end

@interface UpglideAnimationView : UIView

@property (nonatomic, assign) id<UpglideAnimationViewDelegate> delegate;

@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;

-(void)up;
-(void)down;

@end
