//
//  ADCDN_NativeRenderViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/30.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_NativeRenderViewController.h"
#import "ADCDN_NativeCustomRenderViewController.h"


@interface ADCDN_NativeRenderViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView */
@property (nonatomic,strong) UITableView *menuTB;
/** titleArr */
@property(copy,nonatomic)NSArray *menuTitleArr;
@end

@implementation ADCDN_NativeRenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"原生自渲染广告";
    
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
        _menuTitleArr = @[@"大图",@"组图",@"单图",@"视频",];
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

    // 大图
    ADCDN_NativeCustomRenderViewController *vc = [ADCDN_NativeCustomRenderViewController new];
    if (indexPath.row == 0) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        vc.plcId = KplcId_RenderBigImg;
        vc.navigationItem.title = @"大图";
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 组图
    if (indexPath.row == 1) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        vc.plcId = KplcId_RenderGroupImg;
        vc.navigationItem.title = @"组图";
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 单图
    if (indexPath.row == 2) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        vc.plcId = KplcId_RenderSingleImg;
        vc.navigationItem.title = @"单图";
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 视频
    if (indexPath.row == 3) {
        NSLog(@"点击%@",self.menuTitleArr[indexPath.row]);
        vc.plcId = KplcId_RenderVideo;
        vc.navigationItem.title = @"视频";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
