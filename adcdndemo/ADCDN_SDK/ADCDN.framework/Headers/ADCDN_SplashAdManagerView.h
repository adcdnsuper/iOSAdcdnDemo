//
//  ADCDN_SplashAdManagerView.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/6/10.
//  Copyright © 2020 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADCDN_SplashAdManagerView;
/**
 *  代理协议方法
 */
@protocol ADCDN_SplashAdManagerViewDelegate <NSObject>
@optional
/**
 *  开屏广告成功展示
 */
- (void)ADCDN_SplashAdSuccessPresentScreen:(ADCDN_SplashAdManagerView *_Nullable)splashAd;
/**
 *  开屏广告展示失败
 */
- (void)ADCDN_SplashAdFailToPresent:(ADCDN_SplashAdManagerView *_Nullable)splashAd withError:(NSError *_Nullable)error;
/**
 *  开屏广告曝光回调
 */
- (void)ADCDN_SplashAdExposured:(ADCDN_SplashAdManagerView *_Nullable)splashAd;
/**
 *  开屏广告点击回调
 */
- (void)ADCDN_SplashAdClicked:(ADCDN_SplashAdManagerView *_Nullable)splashAd;
/**
 *  开屏广告关闭回调
 */
- (void)ADCDN_SplashAdClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd;
/**
 *  开屏广告将要关闭回调
 */
- (void)ADCDN_SplashAdWillClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd;
/**
 *  开屏详情页关闭回调
 */
- (void)ADCDN_SplashAdDetailClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd;
@end

@interface ADCDN_SplashAdManagerView : UIView
// keyWindow
@property (nonatomic, weak)UIWindow * _Nullable window;
// 代理对象
@property (nonatomic, weak) id <ADCDN_SplashAdManagerViewDelegate> _Nullable delegate;
// 控制器
@property (nonatomic, weak)UIViewController * _Nullable rootViewController;
@property (nonatomic,assign) CGRect viewframe;
/**
 * [可选]，兜底图，防止开屏广告材料还没拉取到，会有白屏展示，建议：兜底可以设置为启动图。
 */
@property (nonatomic, strong)UIView * _Nullable bottomView;
/**
 * 广告发起请求并展示在Window中, 同时在屏幕底部设置应用自身的Logo页面或是自定义View
 * 详解：[可选]，发起拉取广告请求,并将获取的广告以半屏形式展示在传入的Window的上半部，剩余部分展示传入的logoView
 * 请注意:1.logoView需设置好宽高，所占的空间不能过大，并保证高度不超过屏幕高度的 25%。2.Splash广告只支持竖屏
 * logoView 自定义底部View，可以在此View中设置应用Logo
 */
@property (nonatomic, strong)UIView * _Nullable logoView;
/**
 *  plcId - 广告位 ID
 */
-(instancetype _Nullable)initWithFrame:(CGRect)frame plcId:(NSString *_Nullable)plcId;
/**
 *  加载开屏广告
 */
-(void)loadSplashAd;
@end


