//
//  ADCDN_FullscreenVideoAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/25.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ADCDN_FullscreenVideoAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_FullscreenVideoAdManagerDelegate <NSObject>

@optional
/**
 *  加载成功
 */
- (void)ADCDN_FullscreenVideoAdDidLoad:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd;
/**
 *  加载失败
 */
- (void)ADCDN_FullscreenVideoAd:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 * 视频广告缓存成功
 */
- (void)ADCDN_FullscreenVideoAdVideoDataDidLoad:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd;
/**
 *  点击广告
 */
- (void)ADCDN_FullscreenVideoAdDidClick:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd;
/**
 *  曝光回调
 */
- (void)ADCDN_FullscreenVideoAdDidBecomeVisible:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd;
/**
 *  视频播放完成
 */
- (void)ADCDN_FullscreenVideoAdDidPlayFinish:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_FullscreenVideoAdDidClose:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd;
/**
 * 视频广告点击跳过
 This method is called when the user clicked skip button.
 */
- (void)ADCDN_FullscreenVideoAdDidClickSkip:(ADCDN_FullscreenVideoAdManager *)fullscreenVideoAd;

@end

@interface ADCDN_FullscreenVideoAdManager : NSObject
/** 代理对象 */
@property (nonatomic, weak, nullable) id<ADCDN_FullscreenVideoAdManagerDelegate>delegate;
/** 控制器(必传) */
@property (nonatomic, strong) UIViewController * rootViewController;
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
