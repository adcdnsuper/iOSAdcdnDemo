//
//  ADCDN_UnRewardFullscreenVideoViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/25.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_UnRewardFullscreenVideoViewController.h"
#import <ADCDN/ADCDN.h>


@interface ADCDN_UnRewardFullscreenVideoViewController ()<ADCDN_FullscreenVideoAdManagerDelegate>
/** 每一次请求数据需用新的BUFullscreenVideoAd对象 */
/* 非激励视频广告 */
@property (nonatomic,strong) ADCDN_FullscreenVideoAdManager *manager;
@end

@implementation ADCDN_UnRewardFullscreenVideoViewController

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
#pragma mark - loadAd
-(void)loadAd{
    self.manager = [[ADCDN_FullscreenVideoAdManager alloc] initWithPlcId:self.plcId];
    self.manager.rootViewController = self;
    self.manager.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
    [self.manager loadAd];
}

#pragma mark ADCDN_FullscreenVideoAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_FullscreenVideoAdDidLoad:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd{
    NSLog(@"加载成功");
}
/**
 *  加载失败
 */
- (void)ADCDN_FullscreenVideoAd:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"加载失败");
}
/**
 * 视频广告缓存成功
 */
- (void)ADCDN_FullscreenVideoAdVideoDataDidLoad:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd{
    NSLog(@"视频广告缓存成功");
}
/**
 *  点击广告
 */
- (void)ADCDN_FullscreenVideoAdDidClick:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd{
    NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_FullscreenVideoAdDidBecomeVisible:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd{
    NSLog(@"曝光回调");
}
/**
 *  视频播放完成
 */
- (void)ADCDN_FullscreenVideoAdDidPlayFinish:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"视频播放完成");
}
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_FullscreenVideoAdDidClose:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd{
    NSLog(@"播放完成点击关闭");
}
/**
 * 视频广告点击跳过
 This method is called when the user clicked skip button.
 */
- (void)ADCDN_FullscreenVideoAdDidClickSkip:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd{
    NSLog(@"视频广告点击跳过");
}
@end
