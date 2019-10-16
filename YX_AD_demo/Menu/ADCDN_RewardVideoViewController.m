//
//  ADCDN_RewardVideoViewController.m
//  YX_AD_demo
//
//  Created by 彭双塔 on 2019/10/16.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_RewardVideoViewController.h"
#import <ADCDN/ADCDN.h>
#define KappId @"1030013"
#define KplcId @"1010101"
@interface ADCDN_RewardVideoViewController ()<ADCDN_RewardVideoAdManagerDelegate>

@end

@implementation ADCDN_RewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"激励视频广告";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
}
#pragma mark - loadAd
-(void)loadAd{
    ADCDN_RewardVideoAdManager *manager = [ADCDN_RewardVideoAdManager shareManagerWithAppId:KappId plcId:KplcId];
    manager.rootViewController = self;
    manager.delegate = self;
    [manager loadAd];
}
#pragma mark - ADCDN_RewardVideoAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_RewardVideoAdManager *)InterstitialAd{
    NSLog(@"激励视频加载成功");
}
/**
 *  加载失败
 */
- (void)ADCDN_RewardVideoAd:(ADCDN_RewardVideoAdManager *)InterstitialAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"激励视频加载失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_RewardVideoAdDidClick:(ADCDN_RewardVideoAdManager *)InterstitialAd{
    NSLog(@"激励视频点击");
}
/**
 *  曝光回调
 */
- (void)ADCDN_RewardVideoAdDidBecomeVisible:(ADCDN_RewardVideoAdManager *)InterstitialAd{
    NSLog(@"激励视频曝光");
}
@end
