//
//  ADCDN_BannerViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/8.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_BannerViewController.h"
#import <ADCDN/ADCDN.h>
#define KappId @"1030013"
#define KplcId @"1010023"
@interface ADCDN_BannerViewController ()<ADCDN_BannerAdManagerDelegate>

@end

@implementation ADCDN_BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"横幅广告";
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, [self getStatusBarHeight] + [self getNavigationBarHeight], screenRect.size.width, screenRect.size.height)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    ADCDN_BannerAdManager *banner = [ADCDN_BannerAdManager shareManagerWithAppId:KappId plcId:KplcId];
    banner.customView = view;// banner加载的位置
    banner.interval = 29;// 大于等于30循环
    banner.rootViewController = self;
    banner.delegate = self;
    [banner loadNativeAd];
    
    
    
    
    //refresh Button
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIButton *_refreshbutton = [[UIButton alloc] initWithFrame:CGRectMake(size.width/2 - 150/2, size.height *0.8, 150, 50)];
    [_refreshbutton setTitle:@"刷新广告" forState:UIControlStateNormal];
    [_refreshbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_refreshbutton addTarget:self action:@selector(refreshBanner) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_refreshbutton];
}
- (void)refreshBanner {
    [[ADCDN_BannerAdManager shareManagerWithAppId:KappId plcId:KplcId] loadNativeAd];
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
 *  ADCDN_BannerAdManagerDelegate 代理协议方法
 */
/// 加载成功
- (void)ADCDN_BannerAdDidLoad:(ADCDN_BannerAdManager *)nativeAd {
    NSLog(@"加载成功-----%s",__FUNCTION__);
}
/// 加载失败
- (void)ADCDN_BannerAd:(ADCDN_BannerAdManager *)nativeAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"加载失败-----%s",__FUNCTION__);
}
/// 点击广告时
- (void)ADCDN_BannerAdDidClick:(ADCDN_BannerAdManager *)nativeAd {
    NSLog(@"点击广告时-----%s",__FUNCTION__);
}
/// 曝光回调
- (void)ADCDN_BannerAdDidBecomeVisible:(ADCDN_BannerAdManager *)nativeAd {
    NSLog(@"曝光回调-----%s",__FUNCTION__);
}


@end
