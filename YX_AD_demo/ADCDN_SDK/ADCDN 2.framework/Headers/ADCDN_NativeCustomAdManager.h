//
//  ADCDN_NativeCustomAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/24.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ADCDN_NativeCustomAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_NativeCustomAdManagerDelegate <NSObject>
/**
 *  拉取广告成功
 */
- (void)ADCDN_NativeCustomAdSuccessToLoad:(ADCDN_NativeCustomAdManager *)nativeExpressAd views:(UIView *)view;
/**
 *  拉取广告失败
 */
- (void)ADCDN_NativeCustomAd:(ADCDN_NativeCustomAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_NativeCustomAdDidClick:(UIView *)nativeExpressAdView;
/**
 *  曝光回调
 */
- (void)ADCDN_NativeCustomAdDidBecomeVisible:(UIView *)nativeExpressAdView;

@end

@interface ADCDN_NativeCustomAdManager : NSObject
// 控制器(必传) 
@property (nonatomic, weak)UIViewController *rootViewController;
// 代理对象
@property (nonatomic, weak, nullable) id<ADCDN_NativeCustomAdManagerDelegate> delegate;
/** 广告view(必传) */
@property (nonatomic, weak) UIView * adView;
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
