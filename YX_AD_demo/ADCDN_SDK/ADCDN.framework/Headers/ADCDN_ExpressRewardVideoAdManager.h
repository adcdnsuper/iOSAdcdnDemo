//
//  ADCDN_ExpressRewardVideoAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/12/11.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADCDN_RewardVideoAdModel.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@class ADCDN_ExpressRewardVideoAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_ExpressRewardVideoAdManagerDelegate <NSObject>
/**
 *  加载成功
 */
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd;
/**
 *  加载失败
 */
- (void)ADCDN_RewardVideoAd:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_RewardVideoAdDidClick:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd;
/**
 *  曝光回调
 */
- (void)ADCDN_RewardVideoAdDidBecomeVisible:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd;
/**
 *  视频播放完成
 */
- (void)ADCDN_RewardVideoAdDidPlayFinish:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_RewardVideoAdDidClose:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd;
/**
 服务器核实回调成功
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidSucceed:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd verify:(BOOL)verify;

/**
 服务器核实回调失败
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidFail:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd;

@end
@interface ADCDN_ExpressRewardVideoAdManager : NSObject
// 控制器
@property (nonatomic, weak)UIViewController *rootViewController;
// 代理对象
@property (nonatomic, weak, nullable) id<ADCDN_ExpressRewardVideoAdManagerDelegate> delegate;
// 如果需要：服务器到服务器回调，则需要传递此数据模型
@property (nonatomic,strong) ADCDN_RewardVideoAdModel *rewardVideoAdModel;
/**
*  plcId - 广告位 ID
*/
-(instancetype _Nullable)initWithPlcId:(NSString *_Nullable)plcId;
/**
 *  加载广告
 */
-(void)loadAd;
@end

NS_ASSUME_NONNULL_END
