//
//  ADCDN_InterstitialAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/15.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class ADCDN_InterstitialAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_InterstitialAdManagerDelegate <NSObject>
/**
 *  加载成功
 */
- (void)ADCDN_InterstitialAdDidLoad:(ADCDN_InterstitialAdManager *)InterstitialAd;
/**
 *  加载失败
 */
- (void)ADCDN_InterstitialAd:(ADCDN_InterstitialAdManager *)InterstitialAd didFailWithError:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_InterstitialAdDidClick:(ADCDN_InterstitialAdManager *)InterstitialAd;
/**
 *  曝光回调
 */
- (void)ADCDN_InterstitialAdDidBecomeVisible:(ADCDN_InterstitialAdManager *)InterstitialAd;
/**
 *  关闭广告回调
 */
- (void)ADCDN_InterstitialAdDidClose:(ADCDN_InterstitialAdManager *)InterstitialAd;
@end

@interface ADCDN_InterstitialAdManager : NSObject
/// 控制器
@property (nonatomic, weak)UIViewController *rootViewController;
/// 代理对象
@property (nonatomic, weak, nullable) id<ADCDN_InterstitialAdManagerDelegate> delegate;
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
