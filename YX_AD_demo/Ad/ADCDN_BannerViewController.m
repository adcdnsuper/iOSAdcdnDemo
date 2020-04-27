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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(UIView *)adView{
    if (!_adView) {
        _adView = [[UIView alloc] initWithFrame:CGRectMake(0, 100,ScreenW , ScreenW / 6.25)];
        [self.view addSubview:_adView];
    }
    return _adView;
}
/**
 *  广告视频图懒加载
 */
- (void)loadAd {
    self.bannerAdManager = [[ADCDN_BannerAdManager alloc] initWithPlcId:KplcId_Banner];
    self.bannerAdManager.customView = self.adView;// banner加载的位置
    self.bannerAdManager.interval = 29;// 大于30循环
    self.bannerAdManager.rootViewController = self;
    self.bannerAdManager.delegate = self;// banner需要strong持有，否则delegate回调无法执行，影响计费
    self.bannerAdManager.adSize = CGSizeMake(ScreenW, ScreenW / 6.25);
    [self.bannerAdManager loadNativeAd];
}
-(void)dealloc{
    NSLog(@"释放了");
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
/// 关闭广告
-(void)ADCDN_BannerAdDidClose:(ADCDN_BannerAdManager *)bannerAd{
    NSLog(@"关闭回调-----%s",__FUNCTION__);
}

@end
