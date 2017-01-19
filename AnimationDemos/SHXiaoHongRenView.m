//
//  SHXiaoHongRenView.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/28.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "SHXiaoHongRenView.h"

@interface SHXiaoHongRenView ()
{
    UIImageView *xiaoHongRenImageView;
    NSMutableArray *images;
}
@end

@implementation SHXiaoHongRenView

static SHXiaoHongRenView *xiaoHoneRen = nil;

+(id)sharedXiaoHongRen
{
    if (!xiaoHoneRen) {
        xiaoHoneRen = [[SHXiaoHongRenView alloc] init];
    }
    return xiaoHoneRen;
}

-(id)init
{
    self = [super init];
    if (self) {
        images = [[NSMutableArray alloc] initWithCapacity:0];
        
        for (int i = 1; i <= 42; i++) {
            NSString *imageName = [NSString stringWithFormat:@"_00%d_m%d.png",42-i+1,i];
            if(42-i+1 < 10 ){
                imageName = [NSString stringWithFormat:@"_000%d_m%d.png",42-i+1,i];
            }
            NSLog(@"name %@",imageName);
            [images addObject:[UIImage imageNamed:imageName]];
        }
    }
    return self;
}

-(void)addXiaoHongRenToPoint:(CGPoint)centerPoint inView:(UIView *)fatherView
{
    xiaoHongRenImageView = [[UIImageView alloc] init];
    xiaoHongRenImageView.frame = CGRectMake(centerPoint.x-23, centerPoint.y-170, 46, 60);
    xiaoHongRenImageView.alpha = 1;
    xiaoHongRenImageView.image = [UIImage imageNamed:@"_0000_m静态图-正常状态.png"];
    [fatherView addSubview:xiaoHongRenImageView];
    
    [UIView animateWithDuration:0.35f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        xiaoHongRenImageView.frame = CGRectMake(centerPoint.x-23, centerPoint.y-60, 46, 60);
        xiaoHongRenImageView.alpha = 1;
    } completion:^(BOOL finished) {
        xiaoHongRenImageView.image = [images firstObject];
        xiaoHongRenImageView.animationImages = images;
        xiaoHongRenImageView.animationDuration = images.count * 0.02f;
        xiaoHongRenImageView.animationRepeatCount = 1;
        [xiaoHongRenImageView startAnimating];
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
