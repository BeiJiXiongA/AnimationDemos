//
//  CATransitionViewController.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/22.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "CATransitionViewController.h"
#import "SHCircleView.h"
#import "TuoYuanView.h"
#import "SHNumberView.h"

#import "SHSendingYiXiangView.h"

#import "SHYiXiangSendingStringView.h"

#import "SHTempNotification.h"

#define MAXHEIGHT     750
#define MAXWIDTH      1000

@interface CATransitionViewController ()<TempDelegate>
{
    int numIndex;
    BOOL big;
    SHYiXiangSendingStringView *timeView;
    SHYiXiangSendingStringView *numView;
    
    SHTempNotification *notification;
}
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIWebView *demoWebView;

@property (nonatomic, strong) NSArray *numArrays;
@property (weak, nonatomic) IBOutlet SHCircleView *circleView;

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    big = YES;
    numIndex = 0;
    
    SHSendingYiXiangView *sendingView = [[SHSendingYiXiangView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 115)/2, 100, 115, 129)];
    [self.view addSubview:sendingView];
    
    timeView = [[SHYiXiangSendingStringView alloc] initWithMinute:3 second:0 frame:CGRectMake(100, 330, 200, 50)];
    [self.view addSubview:timeView];
    
    numView = [[SHYiXiangSendingStringView alloc] initWithNum:10 frame:CGRectMake(100, 390, 200, 50)];
    [self.view addSubview:numView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (IBAction)addNumber:(id)sender {
    numIndex ++ ;
    self.numLabel.text = [NSString stringWithFormat:@"%d",numIndex];
    [timeView setMinute:numIndex];
    [timeView setSecond:numIndex];
    [numView setNum:numIndex];
    
    notification = [[SHTempNotification alloc] init];
    notification.delegate = self;
    notification.object = @"hhhhhhhhhhhhhhhhh";
    [notification showNotificationAnimated:NO];
}

-(void)checkClick:(id)object
{
    NSLog(@"%@",object);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchImage:(id)sender {
    
    [UIView transitionWithView:self.numLabel duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations:^{
                        //cycle to next image
                        
                        self.numLabel.text = [NSString stringWithFormat:@"%d",numIndex];
                        numIndex ++ ;
//                        UIImage *currentImage = self.demoImageView.image;
//                        NSUInteger index = [self.images indexOfObject:currentImage];
//                        index = (index + 1) % [self.images count];
//                        self.demoImageView.image = self.images[index];
                    }
                    completion:NULL];
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionFade;
//    [self.demoImageView.layer addAnimation:transition forKey:nil];
//    
//    UIImage *currentImage = self.demoImageView.image;
//    NSUInteger index = [self.images indexOfObject:currentImage];
//    index = (index + 1) % [self.images count];
//    self.demoImageView.image = self.images[index];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
