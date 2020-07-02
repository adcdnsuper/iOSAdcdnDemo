//
//  ADCDN_ExpressRewardVideoViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/12/11.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_ExpressRewardVideoViewController.h"
#import <ADCDN/ADCDN.h>
@interface ADCDN_ExpressRewardVideoViewController ()<ADCDN_ExpressRewardVideoAdManagerDelegate>
/* 模版激励视频广告 */
@property (nonatomic,strong)ADCDN_ExpressRewardVideoAdManager  *rewardVideoAdManager;
@end

@implementation ADCDN_ExpressRewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
}
#pragma mark - loadAd
-(void)loadAd{
    self.rewardVideoAdManager = [[ADCDN_ExpressRewardVideoAdManager alloc] initWithPlcId:self.plcId];
    //需要 服务器到服务器回调的，请传入rewardVideoAdModel数据模型
//    ADCDN_RewardVideoAdModel *rewardVideoAdModel = [ADCDN_RewardVideoAdModel new];
//    rewardVideoAdModel.userId = @"123456789";
//    rewardVideoAdModel.rewardName = @"rewardName";
//    rewardVideoAdModel.rewardAmount = 1;
//    rewardVideoAdModel.extra = @"extra";
//    self.rewardVideoAdManager.rewardVideoAdModel = rewardVideoAdModel;
    self.rewardVideoAdManager.rootViewController = self;// rewardVideoAdManager需要strong持有，否则delegate回调无法执行，影响计费
    self.rewardVideoAdManager.delegate = self;
    [self.rewardVideoAdManager loadAd];
}
#pragma mark - ADCDN_ExpressRewardVideoAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd{
    NSLog(@"加载成功");
}
/**
 *  加载失败
 *  广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
 */
- (void)ADCDN_RewardVideoAd:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"加载失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_RewardVideoAdDidClick:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd{
    NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_RewardVideoAdDidBecomeVisible:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd{
    NSLog(@"曝光回调");
}
/**
 *  视频播放完成
 */
- (void)ADCDN_RewardVideoAdDidPlayFinish:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"视频播放完成");
}
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_RewardVideoAdDidClose:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"播放完成点击关闭");
}
/**
 服务器核实回调成功
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidSucceed:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd verify:(BOOL)verify{
    NSLog(@"服务器核实回调成功");
}

/**
 服务器核实回调失败
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidFail:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"服务器核实回调失败");
}
@end
