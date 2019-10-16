//
//  ADCDN_ViewController.m
//  YX_AD_demo
//
//  Created by 彭双塔 on 2019/9/29.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_ViewController.h"
#import "ADCDN_SplashViewController.h"
#import "ADCDN_BannerViewController.h"
#import "ADCDN_RewardVideoViewController.h"
#import "ADCDN_InterstitialViewController.h"
#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height
@interface ADCDN_ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView */
@property (nonatomic,strong) UITableView *menuTB;
/** titleArr */
@property(copy,nonatomic)NSArray *menuTitleArr;

@end

@implementation ADCDN_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"ADCDN_demo";
    
    [self menuTB];
}
-(UITableView *)menuTB{
    if (!_menuTB) {
        _menuTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH - [self getStatusBarHeight] - [self getNavigationBarHeight]) style:UITableViewStylePlain];
        _menuTB.delegate = self;
        _menuTB.dataSource = self;
        _menuTB.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_menuTB];
    }
    return _menuTB;
}
-(NSArray *)menuTitleArr{
    if (!_menuTitleArr) {
        /**
         *  插屏广告放最后
         */
        _menuTitleArr = @[@"横幅广告",@"开屏广告",@"激励视频广告",@"插屏广告"];
    }
    return _menuTitleArr;
}
/**
 *  获取状态栏高度
 */
-(CGFloat)getStatusBarHeight{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}
/**
 *  获取导航栏高度
 */
-(CGFloat)getNavigationBarHeight{
    return self.navigationController.navigationBar.frame.size.height;
}
/**
 *  UITableViewDelegate,UITableViewDataSource
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menuTitleArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.menuTitleArr[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //@"横幅广告",@"开屏广告",@"插屏广告",@"原生模板广告",@"原生模板纯图广告",@"开屏广告",@"激励视频广告"
    
    // 横幅广告 代码里面的 banner
    if (indexPath.row == 0) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_BannerViewController *vc = [ADCDN_BannerViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 开屏广告
    if (indexPath.row == 1) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_SplashViewController *vc = [ADCDN_SplashViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 激励视频广告
    if (indexPath.row == 2) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_RewardVideoViewController *vc = [ADCDN_RewardVideoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 插屏广告
    if (indexPath.row == 3) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_InterstitialViewController *vc = [ADCDN_InterstitialViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
