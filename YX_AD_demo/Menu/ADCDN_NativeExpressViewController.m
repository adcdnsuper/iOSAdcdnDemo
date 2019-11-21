//
//  ADCDN_NativeExpressViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/17.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_NativeExpressViewController.h"
#import <ADCDN/ADCDN.h>
#define KappId @"1030013"


#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height

@interface ADCDN_NativeExpressViewController ()<ADCDN_NativeExpressAdManagerDelegate,UITableViewDelegate,UITableViewDataSource>
/** 广告列表 */
@property (nonatomic,strong) UITableView *adTableView;
/** 拉取的广告数组 */
@property (nonatomic, strong) NSMutableArray *expressAdViews;

@end

@implementation ADCDN_NativeExpressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置view的y值从导航栏以下开始计算为y = 0
    self.navigationController.navigationBar.translucent = NO;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
    
    [self adTableView];
}
-(UITableView *)adTableView{
    if (!_adTableView) {
        _adTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) style:UITableViewStylePlain];
        _adTableView.delegate = self;
        _adTableView.dataSource = self;
        _adTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [_adTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"nativeexpresscell"];
        [_adTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:@"splitnativeexpresscell"];
        [self.view addSubview:_adTableView];
    }
    return _adTableView;
}
#pragma mark - loadAd
-(void)loadAd{
    ADCDN_NativeExpressAdManager *manager = [ADCDN_NativeExpressAdManager shareManagerWithAppId:KappId plcId:self.plcId];
    manager.rootViewController = self;
    manager.delegate = self;
    // 最多运行一次性拉去3张
    manager.adCount = 3;
    // 广告视图View的尺寸
    manager.adSize = self.adSize;
    [manager loadAd];
}
#pragma mark - ADCDN_NativeExpressAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_NativeExpressAdSuccessToLoad:(ADCDN_NativeExpressAdManager *)nativeExpressAd views:(NSArray<__kindof UIView *> *)views{
    self.expressAdViews = [NSMutableArray arrayWithArray:views];
    NSLog(@"原生纯图加载成功");
    [self.adTableView reloadData];
}
/**
 *  加载失败
 */
- (void)ADCDN_NativeExpressAd:(ADCDN_NativeExpressAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"原生纯图加载失败");
}
/**
 *  渲染广告成功
 */
- (void)ADCDN_NativeExpressAdRenderSuccess:(UIView *)nativeExpressAdView{
    NSLog(@"原生纯图渲染成功");
    [self.adTableView reloadData];
}
/**
 *  渲染广告失败
 */
- (void)ADCDN_NativeExpressAdRenderFail:(UIView *)nativeExpressAdView error:(NSError *_Nullable)error{
    NSLog(@"原生纯图渲染失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_NativeExpressAdDidClick:(UIView *)nativeExpressAdView{
    NSLog(@"原生纯图点击");
}
/**
 *  曝光回调
 */
- (void)ADCDN_NativeExpressAdDidBecomeVisible:(UIView *)nativeExpressAdView{
    NSLog(@"原生纯图曝光");
}
/**
 *  关闭广告回调
 */
- (void)ADCDN_NativeExpressAdDidClose:(UIView *)nativeExpressAdView{
    NSLog(@"原生广告关闭回调");
    
    if (nativeExpressAdView) {
        [self.expressAdViews removeObject:nativeExpressAdView];
        [self.adTableView reloadData];
    }
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0) {
        UIView *view = [self.expressAdViews objectAtIndex:indexPath.row / 2];
        return view.bounds.size.height;
    }
    else {
        return 44;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.expressAdViews.count * 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row % 2 == 0) {
        cell = [self.adTableView dequeueReusableCellWithIdentifier:@"nativeexpresscell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *subView = (UIView *)[cell.contentView viewWithTag:1000];
        if ([subView superview]) {
            [subView removeFromSuperview];
        }
        UIView *view = [self.expressAdViews objectAtIndex:indexPath.row / 2];
        view.tag = 1000;
        [cell.contentView addSubview:view];
        cell.accessibilityIdentifier = @"nativeTemp_ad";
    } else {
        cell = [self.adTableView dequeueReusableCellWithIdentifier:@"splitnativeexpresscell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor grayColor];
    }
    return cell;
}
@end
