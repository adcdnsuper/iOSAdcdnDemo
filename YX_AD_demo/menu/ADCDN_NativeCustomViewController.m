//
//  ADCDN_NativeCustomViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/23.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_NativeCustomViewController.h"
#import <ADCDN/ADCDN.h>



@interface ADCDN_NativeCustomViewController ()<ADCDN_NativeCustomAdManagerDelegate>
/** 广告view */
@property (nonatomic,strong) UIView *adView;
/* 原生大图广告 */
@property (nonatomic,strong) ADCDN_NativeCustomAdManager *nativeCustomAd;
@end

@implementation ADCDN_NativeCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置view的y值从导航栏以下开始计算为y = 0
    self.navigationController.navigationBar.translucent = NO;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
}
-(void)dealloc{
    NSLog(@"释放了");
}
/**
 *  广告视频图懒加载
 */
-(UIView *)adView{
    if (!_adView) {
        _adView = [[UIView alloc] initWithFrame:CGRectMake(0, 100,ScreenW , ScreenW * (720.0/1280.0))];
        [self.view addSubview:_adView];
    }
    return _adView;
}
#pragma mark - loadAd
-(void)loadAd{
    self.nativeCustomAd = [[ADCDN_NativeCustomAdManager alloc] initWithPlcId:KplcId_Img];
    self.nativeCustomAd.adView = self.adView;
    self.nativeCustomAd.rootViewController = self;
    self.nativeCustomAd.delegate = self;// nativeCustomAd需要strong持有，否则delegate回调无法执行，影响计费
    [self.nativeCustomAd loadAd];
}
/**
 *  拉取广告成功
 */
- (void)ADCDN_NativeCustomAdSuccessToLoad:(ADCDN_NativeCustomAdManager *)nativeExpressAd views:(UIView *)view{
    NSLog(@"拉取广告成功");
}
/**
 *  拉取广告失败
 */
- (void)ADCDN_NativeCustomAd:(ADCDN_NativeCustomAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"拉取广告失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_NativeCustomAdDidClick:(UIView *)nativeExpressAdView{
     NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_NativeCustomAdDidBecomeVisible:(UIView *)nativeExpressAdView{
     NSLog(@"曝光回调");
}

@end
