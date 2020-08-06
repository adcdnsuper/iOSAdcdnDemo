//
//  ADCDN_UnRewardExpressFullscreenVideoViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/12/11.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_UnRewardExpressFullscreenVideoViewController.h"
#import <ADCDN/ADCDN.h>
#import "UIView+ADCDN_APPView.h"
@interface ADCDN_UnRewardExpressFullscreenVideoViewController ()<ADCDN_FullscreenExpressVideoAdManagerDelegate>

/* 非激励视频广告 */
@property (nonatomic,strong) ADCDN_FullscreenExpressVideoAdManager *fullscreenVideoAdManager;

@end

@implementation ADCDN_UnRewardExpressFullscreenVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
}
#pragma mark - 展示loading
-(void)showLoading{
    [self.view adcdn_showLoading];
    self.view.userInteractionEnabled = NO;
}
#pragma mark - 移除loading
-(void)removeLoading{
    [self.view adcdn_removeLoading];
    self.view.userInteractionEnabled = YES;
}

#pragma mark - fullscreenVideoAdManager
-(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAdManager{
    if (!_fullscreenVideoAdManager) {
        _fullscreenVideoAdManager = [[ADCDN_FullscreenExpressVideoAdManager alloc] initWithPlcId:self.plcId];
        _fullscreenVideoAdManager.rootViewController = self;
        _fullscreenVideoAdManager.delegate = self;// fullscreenVideoAdManager需要strong持有，否则delegate回调无法执行，影响计费
    }
    return _fullscreenVideoAdManager;
}
#pragma mark - loadAd
-(void)loadAd{
    [self.fullscreenVideoAdManager loadAd];
    
    // 展示loading
    [self showLoading];
}
/**
 *  加载成功
 */
- (void)ADCDN_FullscreenVideoAdDidLoad:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"加载成功");
}
/**
 *  加载失败
 *  广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
 */
- (void)ADCDN_FullscreenVideoAd:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"加载失败");
    
    // 移除loading
    [self removeLoading];
}
/**
 *  点击广告
 */
- (void)ADCDN_FullscreenVideoAdDidClick:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_FullscreenVideoAdDidBecomeVisible:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"曝光回调");
    // 移除loading
    [self removeLoading];
}
/**
 *  视频播放完成
 */
- (void)ADCDN_FullscreenVideoAdDidPlayFinish:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    
    NSLog(@"视频播放完成");
}
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_FullscreenVideoAdDidClose:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"播放完成点击关闭");
}
/**
 * 视频广告点击跳过
 */
- (void)ADCDN_FullscreenVideoAdDidClickSkip:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"视频广告点击跳过");
}
@end
