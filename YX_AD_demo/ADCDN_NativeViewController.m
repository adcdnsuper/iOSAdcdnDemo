//
//  ADCDN_NativeViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/18.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_NativeViewController.h"
#import "ADCDN_NativeExpressViewController.h"

#import "ADCDN_NativeCustomViewController.h"


#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height

@interface ADCDN_NativeViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView */
@property (nonatomic,strong) UITableView *menuTB;
/** titleArr */
@property(copy,nonatomic)NSArray *menuTitleArr;
@end

@implementation ADCDN_NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"原生广告";
    
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
        _menuTitleArr = @[@"三小图",@"纯图片",@"左图右文",@"左文右图",@"文字浮层",@"上图下文",@"上文下浮层"];
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
    // @"三小图",@"纯图片",@"左图右文",@"左文右图",@"文字浮层",@"上图下文",@"上文下浮层"
    // 三小图
    if (indexPath.row == 0) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_NativeExpressViewController *vc = [ADCDN_NativeExpressViewController new];
        vc.navigationItem.title = @"三小图";
        vc.plcId = @"1010144";
        vc.adSize = CGSizeMake(ScreenW, ScreenW/1.56);
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 纯图片
    if (indexPath.row == 1) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_NativeCustomViewController *vc = [ADCDN_NativeCustomViewController new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 左图右文
    if (indexPath.row == 2) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_NativeExpressViewController *vc = [ADCDN_NativeExpressViewController new];
        vc.navigationItem.title = @"左图右文";
        vc.plcId = @"1010142";
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 左文右图
    if (indexPath.row == 3) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_NativeExpressViewController *vc = [ADCDN_NativeExpressViewController new];
        vc.navigationItem.title = @"左文右图";
        vc.plcId = @"1010143";
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 文字浮层
    if (indexPath.row == 4) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_NativeExpressViewController *vc = [ADCDN_NativeExpressViewController new];
        vc.navigationItem.title = @"文字浮层";
        vc.plcId = @"1010140";
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 上图下文
    if (indexPath.row == 5) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_NativeExpressViewController *vc = [ADCDN_NativeExpressViewController new];
        vc.navigationItem.title = @"上图下文";
        vc.plcId = @"1010145";
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 上文下浮层
    if (indexPath.row == 6) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        ADCDN_NativeExpressViewController *vc = [ADCDN_NativeExpressViewController new];
        vc.navigationItem.title = @"上文下浮层";
        vc.plcId = @"1010141";
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
