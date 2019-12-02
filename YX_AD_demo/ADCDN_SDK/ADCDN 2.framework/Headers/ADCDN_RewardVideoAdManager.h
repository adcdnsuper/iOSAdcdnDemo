//
//  ADCDN_RewardVideoAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/15.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADCDN_RewardVideoAdModel.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class ADCDN_RewardVideoAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_RewardVideoAdManagerDelegate <NSObject>
/**
 *  加载成功
 */
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_RewardVideoAdManager *)rewardVideoAd;
/**
 *  加载失败
 */
- (void)ADCDN_RewardVideoAd:(ADCDN_RewardVideoAdManager *)rewardVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_RewardVideoAdDidClick:(ADCDN_RewardVideoAdManager *)rewardVideoAd;
/**
 *  曝光回调
 */
- (void)ADCDN_RewardVideoAdDidBecomeVisible:(ADCDN_RewardVideoAdManager *)rewardVideoAd;
/**
 *  视频播放完成
 */
- (void)ADCDN_RewardVideoAdDidPlayFinish:(ADCDN_RewardVideoAdManager *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_RewardVideoAdDidClose:(ADCDN_RewardVideoAdManager *)rewardedVideoAd;
/**
 服务器核实回调成功
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidSucceed:(ADCDN_RewardVideoAdManager *)rewardedVideoAd verify:(BOOL)verify;

/**
 服务器核实回调失败
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidFail:(ADCDN_RewardVideoAdManager *)rewardedVideoAd;

@end

@interface ADCDN_RewardVideoAdManager : NSObject
// 控制器
@property (nonatomic, weak)UIViewController *rootViewController;
// 代理对象
@property (nonatomic, weak, nullable) id<ADCDN_RewardVideoAdManagerDelegate> delegate;
// 如果需要：服务器到服务器回调，则需要传递此数据模型
@property (nonatomic,strong) ADCDN_RewardVideoAdModel *rewardVideoAdModel;
/**
 *  提供单例类方法
 *  详解：appId - 媒体 ID
 *       plcId - 广告位 ID
 */
+(instancetype _Nullable)shareManagerWithAppId:(NSString *_Nullable)appId plcId:(NSString *_Nullable)plcId;
/**
 *  加载广告
 */
-(void)loadAd;
@end

NS_ASSUME_NONNULL_END
