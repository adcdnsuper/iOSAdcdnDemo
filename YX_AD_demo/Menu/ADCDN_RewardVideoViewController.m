//
//  ADCDN_RewardVideoViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/15.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_RewardVideoViewController.h"
#import <ADCDN/ADCDN.h>
#define KappId @"1030013"


@interface ADCDN_RewardVideoViewController ()<ADCDN_RewardVideoAdManagerDelegate>

@end

@implementation ADCDN_RewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
}
#pragma mark - loadAd
-(void)loadAd{
    ADCDN_RewardVideoAdManager *manager = [ADCDN_RewardVideoAdManager shareManagerWithAppId:KappId plcId:self.plcId];
    //需要 服务器到服务器回调的，请传入rewardVideoAdModel数据模型
    ADCDN_RewardVideoAdModel *rewardVideoAdModel = [ADCDN_RewardVideoAdModel new];
    rewardVideoAdModel.userId = @"123";
    rewardVideoAdModel.rewardName = @"rewardName";
    rewardVideoAdModel.rewardAmount = 1;
    rewardVideoAdModel.extra = @"extra";
    manager.rewardVideoAdModel = rewardVideoAdModel;
    manager.rootViewController = self;
    manager.delegate = self;
    [manager loadAd];
}
/**
 *  加载成功
 */
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_RewardVideoAdManager *)rewardVideoAd{
    NSLog(@"激励视频加载成功");
}
/**
 *  加载失败
 */
- (void)ADCDN_RewardVideoAd:(ADCDN_RewardVideoAdManager *)rewardVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"激励视频加载失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_RewardVideoAdDidClick:(ADCDN_RewardVideoAdManager *)rewardVideoAd{
    NSLog(@"激励视频点击");
}
/**
 *  曝光回调
 */
- (void)ADCDN_RewardVideoAdDidBecomeVisible:(ADCDN_RewardVideoAdManager *)rewardVideoAd{
    NSLog(@"激励视频曝光");
}
/**
 *  视频播放完成
 */
- (void)ADCDN_RewardVideoAdDidPlayFinish:(ADCDN_RewardVideoAdManager *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"视频播放完成");
}
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_RewardVideoAdDidClose:(ADCDN_RewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"视频播放完成，点击关闭");
}
/**
 服务器核实回调成功
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidSucceed:(ADCDN_RewardVideoAdManager *)rewardedVideoAd verify:(BOOL)verify{
    NSLog(@"服务器核实回调成功");
    // 如果用户需要获取userId等信息
    NSString *userId = rewardedVideoAd.rewardVideoAdModel.userId;
    NSString *rewardName = rewardedVideoAd.rewardVideoAdModel.rewardName;
    NSLog(@"用户id:%@,奖品名:%@",userId,rewardName);
}

/**
 服务器核实回调失败
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidFail:(ADCDN_RewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"服务器核实回调失败");
}
@end
