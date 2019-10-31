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
 *  拉取广告成功
 */
- (void)ADCDN_NativeCustomRenderAdSuccessToLoad:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd withAdDataModel:(ADCDN_NativeCustomRenderModel *)adDataModel;
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
@property (nonatomic, strong) UIViewController * rootViewController;
/** 自定义控件的父视图(必传) ，否则曝光回调不走，影响计费*/
@property (nonatomic, strong) UIView * customView;
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
