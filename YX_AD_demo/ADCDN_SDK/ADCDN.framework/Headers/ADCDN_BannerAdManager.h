//
//  ADCDN_BannerAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/8.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ADCDN_BannerAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_BannerAdManagerDelegate <NSObject>
/**
 *  加载成功
 */
- (void)ADCDN_BannerAdDidLoad:(ADCDN_BannerAdManager *)bannerAd;
/**
 *  加载失败
 */
- (void)ADCDN_BannerAd:(ADCDN_BannerAdManager *)bannerAd didFailWithError:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_BannerAdDidClick:(ADCDN_BannerAdManager *)bannerAd;
/**
 *  曝光回调
 */
- (void)ADCDN_BannerAdDidBecomeVisible:(ADCDN_BannerAdManager *)bannerAd;
/**
 *  关闭回调
 */
- (void)ADCDN_BannerAdDidClose:(ADCDN_BannerAdManager *)bannerAd;
@end

@interface ADCDN_BannerAdManager : NSObject
/// 加载广告位视图 （必传）
@property (nonatomic, weak) UIView *customView;
/// 控制器
@property (nonatomic, weak)UIViewController *rootViewController;
/// 是否轮循 大于 30 为轮循  默认为不轮循
@property (nonatomic, assign) NSInteger interval;
/// 代理对象
@property (nonatomic, weak, nullable) id<ADCDN_BannerAdManagerDelegate> delegate;
/**
 *  提供单例类方法
 *  详解：appId - 媒体 ID
 *       plcId - 广告位 ID
 */
+(instancetype _Nullable)shareManagerWithAppId:(NSString *_Nullable)appId plcId:(NSString *_Nullable)plcId;
/**
 *  加载banner广告
 */
- (void)loadNativeAd;
@end


NS_ASSUME_NONNULL_END
