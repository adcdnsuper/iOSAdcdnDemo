//
//  ADCDN_NativeExpressAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/17.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class ADCDN_NativeExpressAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_NativeExpressAdManagerDelegate <NSObject>
/**
 *  拉取广告成功
 */
- (void)ADCDN_NativeExpressAdSuccessToLoad:(ADCDN_NativeExpressAdManager *)nativeExpressAd views:(NSArray<__kindof UIView *> *)views;
/**
 *  拉取广告失败
 */
- (void)ADCDN_NativeExpressAd:(ADCDN_NativeExpressAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error;
/**
 *  渲染广告成功
 */
- (void)ADCDN_NativeExpressAdRenderSuccess:(UIView *)nativeExpressAdView;
/**
 *  渲染广告失败
 */
- (void)ADCDN_NativeExpressAdRenderFail:(UIView *)nativeExpressAdView error:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_NativeExpressAdDidClick:(UIView *)nativeExpressAdView;
/**
 *  曝光回调
 */
- (void)ADCDN_NativeExpressAdDidBecomeVisible:(UIView *)nativeExpressAdView;
/**
 *  关闭广告回调
 */
- (void)ADCDN_NativeExpressAdDidClose:(UIView *)nativeExpressAdView;
@end

@interface ADCDN_NativeExpressAdManager : NSObject
// 控制器
@property (nonatomic, strong)UIViewController *rootViewController;
// 代理对象
@property (nonatomic, weak, nullable) id<ADCDN_NativeExpressAdManagerDelegate> delegate;
// 广告尺寸大小，建议尺寸：1280 * 720
@property (nonatomic,assign) CGSize adSize;
// 请求广告的数量，一次性请求的最大值为max = 3
@property (nonatomic,assign) NSInteger adCount;
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

/**
 * 渲染
 */
-(void)render:(UIView *)nativeExpressAdview;
@end

NS_ASSUME_NONNULL_END
