//
//  TableViewDemoViewController.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/11/19.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "TableViewDemoViewController.h"
#import "UpglideAnimationView.h"
#import "ButtonTableViewCell.h"


@interface TableViewDemoViewController ()<UITableViewDataSource,UITableViewDelegate,UpglideAnimationViewDelegate>
{
    UpglideAnimationView *upglideView;
    UIView *navigationView;
    
    NSMutableArray *demoArray;
    
    CGFloat endScrollOffsetY;
    
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
}


@end

@implementation TableViewDemoViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    demoArray = [[NSMutableArray alloc] init];
    [demoArray insertObject:@"2" atIndex:0];
    for (int i = 0; i < demoArray.count; i++) {
        NSLog(@"+++++%@",demoArray[i]);
    }
    
    self.demoTableView.backgroundColor = [UIColor yellowColor];
    
//    navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//    navigationView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:navigationView];
    
//    upglideView = [[UpglideAnimationView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 180, 10, 160, 285)];
//    upglideView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
//    upglideView.delegate = self;
//    [self.view insertSubview:upglideView aboveSubview:navigationView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)dealloc
{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 5) {
        return 50;
    }
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == 5) {
//        ButtonTableViewCell *cell = [[ButtonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"buttoncell"];
//        return cell;
//    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableviewcell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableviewcell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zi",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    rotation.m34 = 1.0/ -600;
//    
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.8];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
    
    //设置cell的显示动画为3D缩放//xy方向缩放的初始值为0.1
    cell.layer.transform= CATransform3DMakeScale(0.1,0.1,1);
    //设置动画时间为0.25秒,xy方向缩放的最终值为1
    [UIView animateWithDuration:0.5 animations:^{
        cell.layer.transform= CATransform3DMakeScale(1,1,1);
    }completion:^(BOOL finish){
    
    }];
    

    
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    [upglideView down];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [upglideView up];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y >= 0) {
        //上去
        [upglideView up];
    }else if(scrollView.contentOffset.y <= 150){
        //下去
        [upglideView down];
    }
    NSLog(@"scrollview content offset %@",NSStringFromCGPoint(scrollView.contentOffset));
}

-(void)buttonClick
{
    [self showHideView];
}

-(void)showHideView
{
}

@end
