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
#define KplcId @"1010179"

#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height

@interface ADCDN_BannerViewController ()<ADCDN_BannerAdManagerDelegate>
/** 广告view */
@property (nonatomic,strong) UIView *adView;
@end

@implementation ADCDN_BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"横幅广告";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
    
}
/**
 *  广告视频图懒加载
 */
-(UIView *)adView{
    if (!_adView) {
        _adView = [[UIView alloc] initWithFrame:CGRectMake(0, 100,ScreenW , ScreenW/600*90)];
        [self.view addSubview:_adView];
    }
    return _adView;
}
- (void)loadAd {
    ADCDN_BannerAdManager *banner = [ADCDN_BannerAdManager shareManagerWithAppId:KappId plcId:KplcId];
    banner.customView = self.adView;// banner加载的位置
    banner.interval = 29;// 大于30循环
    banner.rootViewController = self;
    banner.delegate = self;
    [banner loadNativeAd];
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
- (void)ADCDN_BannerAdDidLoad:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"加载成功-----%s",__FUNCTION__);
}
/// 加载失败
- (void)ADCDN_BannerAd:(ADCDN_BannerAdManager *)bannerAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"加载失败-----%s",__FUNCTION__);
}
/// 点击广告时
- (void)ADCDN_BannerAdDidClick:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"点击广告时-----%s",__FUNCTION__);
}
/// 曝光回调
- (void)ADCDN_BannerAdDidBecomeVisible:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"曝光回调-----%s",__FUNCTION__);
}


@end
