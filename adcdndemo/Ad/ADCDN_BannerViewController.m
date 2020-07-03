//
//  ADCDN_BannerViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/8.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_BannerViewController.h"
#import <ADCDN/ADCDN.h>

@interface ADCDN_BannerViewController ()<ADCDN_BannerAdManagerDelegate>
/** 广告view */
@property (nonatomic,strong) UIView *adView;
/* 横幅广告 */
@property (nonatomic,strong) ADCDN_BannerAdManager *bannerAdManager;
@end

@implementation ADCDN_BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"横幅广告";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
}
#pragma mark - adView
-(UIView *)adView{
    if (!_adView) {
        _adView = [[UIView alloc] initWithFrame:CGRectMake(0, 100,ScreenW , ScreenW / 6.25)];
        [self.view addSubview:_adView];
    }
    return _adView;
}
#pragma mark - bannerAdManager
-(ADCDN_BannerAdManager *)bannerAdManager{
    if (!_bannerAdManager) {
        _bannerAdManager = [[ADCDN_BannerAdManager alloc] initWithPlcId:KplcId_Banner];
        _bannerAdManager.customView = self.adView;// banner加载的位置
        _bannerAdManager.interval = 30;// 大于等于30s循环展示
        _bannerAdManager.rootViewController = self;
        _bannerAdManager.delegate = self;// banner需要strong持有，否则delegate回调无法执行，影响计费
        _bannerAdManager.adSize = CGSizeMake(ScreenW, ScreenW / 6.25);
    }
    return _bannerAdManager;
}
#pragma mark - loadAd
-(void)loadAd{
    [self.bannerAdManager loadNativeAd];
}
-(void)dealloc{
    NSLog(@"释放了");
}
#pragma mark - ADCDN_BannerAdManagerDelegate 代理协议方法
/**
 * 加载成功
 */
- (void)ADCDN_BannerAdDidLoad:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"加载成功-----%s",__FUNCTION__);
}
/**
 * 加载失败
 * 广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
 */
- (void)ADCDN_BannerAd:(ADCDN_BannerAdManager *)bannerAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"加载失败-----%s",__FUNCTION__);
}
/**
 * 点击广告
 */
- (void)ADCDN_BannerAdDidClick:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"点击广告时-----%s",__FUNCTION__);
}
/**
 * 曝光回调
 */
- (void)ADCDN_BannerAdDidBecomeVisible:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"曝光回调-----%s",__FUNCTION__);
}
/**
 * 关闭广告
 */
-(void)ADCDN_BannerAdDidClose:(ADCDN_BannerAdManager *)bannerAd{
    NSLog(@"关闭回调-----%s",__FUNCTION__);
}

@end
