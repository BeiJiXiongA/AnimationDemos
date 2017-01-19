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
    
    navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    navigationView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:navigationView];
    
    upglideView = [[UpglideAnimationView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 180, 10, 160, 285)];
    upglideView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    upglideView.delegate = self;
    [self.view insertSubview:upglideView aboveSubview:navigationView];
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
