//
//  ADCDN_RewardVideoAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/15.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
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
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_RewardVideoAdManager *)InterstitialAd;
/**
 *  加载失败
 */
- (void)ADCDN_RewardVideoAd:(ADCDN_RewardVideoAdManager *)InterstitialAd didFailWithError:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_RewardVideoAdDidClick:(ADCDN_RewardVideoAdManager *)InterstitialAd;
/**
 *  曝光回调
 */
- (void)ADCDN_RewardVideoAdDidBecomeVisible:(ADCDN_RewardVideoAdManager *)InterstitialAd;

@end

@interface ADCDN_RewardVideoAdManager : NSObject
/// 控制器
@property (nonatomic, strong)UIViewController *rootViewController;
/// 代理对象
@property (nonatomic, weak, nullable) id<ADCDN_RewardVideoAdManagerDelegate> delegate;
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
