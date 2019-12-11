//
//  ADCDN_FullscreenExpressVideoAdManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/12/11.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ADCDN_FullscreenExpressVideoAdManager;

/**
 *  代理协议方法
 */
@protocol ADCDN_FullscreenExpressVideoAdManagerDelegate <NSObject>

@optional
/**
 *  加载成功
 */
- (void)ADCDN_FullscreenVideoAdDidLoad:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd;
/**
 *  加载失败
 */
- (void)ADCDN_FullscreenVideoAd:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 *  点击广告
 */
- (void)ADCDN_FullscreenVideoAdDidClick:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd;
/**
 *  曝光回调
 */
- (void)ADCDN_FullscreenVideoAdDidBecomeVisible:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd;
/**
 *  视频播放完成
 */
- (void)ADCDN_FullscreenVideoAdDidPlayFinish:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error;
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_FullscreenVideoAdDidClose:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd;
/**
 * 视频广告点击跳过
 This method is called when the user clicked skip button.
 */
- (void)ADCDN_FullscreenVideoAdDidClickSkip:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd;

@end
@interface ADCDN_FullscreenExpressVideoAdManager : NSObject
/** 代理对象 */
@property (nonatomic, weak, nullable) id<ADCDN_FullscreenExpressVideoAdManagerDelegate>delegate;
/** 控制器(必传) */
@property (nonatomic, weak) UIViewController * rootViewController;
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
