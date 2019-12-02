//
//  ADCDN_NativeCustomRenderAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/30.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ADCDN_NativeCustomRenderModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ADCDN_NativeCustomRenderAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_NativeCustomRenderAdManagerDelegate <NSObject>
/**
* 拉取广告成功
*/
-(void)ADCDN_NativeCustomRenderAdSuccessToLoad:(ADCDN_NativeCustomRenderAdManager *)adsManager nativeAds:(NSArray<ADCDN_NativeCustomRenderModel *> *)nativeAdDataArray;
/**
 *  拉取广告失败
 */
- (void)ADCDN_NativeCustomRenderAd:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_NativeCustomRenderAdDidClick:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd;
/**
 *  曝光回调
 */
- (void)ADCDN_NativeCustomRenderAdDidBecomeVisible:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd;


@end

@interface ADCDN_NativeCustomRenderAdManager : NSObject
/** 代理对象 */
@property (nonatomic, weak, nullable) id<ADCDN_NativeCustomRenderAdManagerDelegate>delegate;
/** 控制器(必传) */
@property (nonatomic, weak) UIViewController * rootViewController;
/* The maximum is 3 */
@property (nonatomic,assign) NSInteger adCount;
/**
*  plcId - 广告位 ID
*/
-(instancetype _Nullable)initWithPlcId:(NSString *_Nullable)plcId;

/**
 *  加载广告
 */
-(void)loadAd;
/**
 * 注册视图否则不会曝光
 */

- (void)registerContainer:(__kindof UIView *)containerView
       withClickableViews:(ADCDN_NativeCustomRenderModel *)model;
@end

NS_ASSUME_NONNULL_END
