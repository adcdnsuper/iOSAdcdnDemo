# 1.概述
尊敬的开发者朋友，欢迎您使用ADCDN广告sdk平台。通过本文档，您可以轻松的在几分钟之内完成广告的集成过程。
###注意：运行demo前，请先执行一下pod，添加依赖库，demo才能加载出广告。
```
platform :ios,'9.0'
target 'YX_AD_demo' do
pod 'GDTMobSDK', '~> 4.11.6'
pod 'Bytedance-UnionAD', '~> 2.9.0.3'
end
```

ADCDN广告sdk支持如下广告功能:

| 广告功能        | 详情 | 
| --------       | -----   |
| 开屏广告        | 开屏广告         |
| 原生广告        | （三小图、左图右文、左文右图、文字浮层、上下图文、上文下浮层）  ~~(纯图片)~~       |
| 横幅广告        | 横幅广告         |
| 插屏广告        | 插屏广告         |
| ~~视频广告~~        | ~~激励视频广告（横屏、竖屏） 非激励视频广告（横屏、竖屏）~~         |
| ~~原生自渲染~~       | ~~原生自渲染广告（大图、组图、单图、视频）~~         |
| 视频广告2.0       | 激励视频广告（横屏、竖屏） 非激励视频广告（横屏、竖屏）         |
| 变现场景广告       |  刮刮卡         |
| 游戏盒子广告       | 消星星等游戏         |


# 2.兼容和版本号
iOS9.0及以上，版本号：V 6.0.0。
# 3.ADCDN_SDK的接入流程
## 3.1 添加sdk到工程
接入环境：Xcode 可以复制YD_AD_demo中ADCDN_Framework文件目录下的ADCDN.framework到项目中。如果也需要集成demo中的变现场景或者游戏场景，请把ADCDN.bundle资源文件一并拖入。
## 3.2 权限申请
### 3.2.1 SDK不会主动获取应用位置权限，当应用本身有获取位置权限逻辑时，需要在应用的 info.plist 添加相应配置信息，避免 App Store 审核被拒：
```
//应用根据实际情况配置
Privacy - Location When In Use Usage Description
Privacy - Location Always and When In Use Usage Description
Privacy - Location Always Usage Description
Privacy - Location Usage Description
```
### 3.2.2 苹果公司在iOS9中升级了应用网络通信安全策略，默认推荐开发者使用HTTPS协议来进行网络通信，并限制HTTP协议的请求。为了避免出现无法拉取到广告的情况，我们推荐开发者在info.plist文件中增加如下配置来实现广告的网络访问：（信任HTTP请求）
```
<key>NSAppTransportSecurity</key>
    <dict>
         <key>NSAllowsArbitraryLoads</key>
         <true/>
    </dict>
```
## 3.3 配置其他广告平台依赖库，注：为了避免不同平台的依赖库版本可能存在冲突，故添加依赖库时请保持跟SDK中添加的版本一致，如：GDTMobSDK添加的是4.11.6版本,如果pod search xxx库，没有找到指定的最新版本，可以执行pod repo update 更新最新的cocoapods，如果你的app只使用了穿山甲平台的广告来源，就只需要导入穿山甲对应的依赖库就可以了。
```
platform :ios, '9.0'
target '你的项目名' do
# 优量汇广告来源
pod 'GDTMobSDK', '~> 4.11.6'
# 穿山甲广告来源
pod 'Bytedance-UnionAD', '~> 2.9.0.3'
end
```
## 3.4 sdk初始化配置，在AppDelegate.m中导入ADCDN的头文件：#import <ADCDN/ADCDN.h>，在app程序的启动函数didFinishLaunchingWithOptions中初始化sdk
提示：appId、plcId请到ADCDN开发者平台获取
```
// 初始化配置
[ADCDN_ConfigManager shareManagerWithAppId:KappId];
// 日志开关，默认关闭，控制台过滤 ADCDN_Log关键字查看log
[ADCDN_DebugLogTool setLogEnable:YES];
// 查看sdk版本
NSLog(@"ADCDN_version:%@",[[ADCDN_ConfigManager shareManagerWithAppId:KappId] getSDKVersion]);
```
# 4.sdk广告业务功能
## 4.1 开屏广告，在需要实现ADCDN开屏广告的地方导入代理：ADCDN_SplashAdManagerDelegate
### 4.1.1 设置开屏广告示例代码
```
  // 初始化配置
    [ADCDN_ConfigManager shareManagerWithAppId:KappId];
    // 初始化开屏广告
    self.manage = [[ADCDN_SplashAdManager alloc] initWithPlcId:KplcId_Splash];
    self.manage.window = self.window;
    CGRect frame = [UIScreen mainScreen].bounds;
    self.manage.wFrame = frame;
    self.manage.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
```
### 4.1.2 设置开屏广告代理方法
```
/**
 *  开屏广告成功展示
 */
- (void)ADCDN_SplashAdSuccessPresentScreen:(ADCDN_SplashAdManager *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告成功展示");
}
/**
 *  开屏广告展示失败
 */
- (void)ADCDN_SplashAdFailToPresent:(ADCDN_SplashAdManager *_Nullable)splashAd withError:(NSError *_Nullable)error {
    NSLog(@"%s---%@ error:%@",__FUNCTION__,@"开屏广告展示失败",error);
}
/**
 *  开屏广告曝光回调
 */
- (void)ADCDN_SplashAdExposured:(ADCDN_SplashAdManager *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告曝光回调");
}
/**
 *  开屏广告点击回调
 */
- (void)ADCDN_SplashAdClicked:(ADCDN_SplashAdManager *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告点击回调");
}
/**
 *  开屏广告关闭回调
 */
- (void)ADCDN_SplashAdClosed:(ADCDN_SplashAdManager *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告关闭回调");
}
```
### 4.1.3 支持开屏广告底部自定义logo
```
//设置开屏底部自定义LogoView，展示半屏开屏广告
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.width * 0.25)];
    UIImageView *logo = [[UIImageView alloc]initWithFrame:bottomView.frame];
    CGRect logoFrame = logo.frame;
    logoFrame.size.width = bottomView.frame.size.width * 0.5;
    logoFrame.size.height = bottomView.frame.size.height * 0.5;
    logo.frame = logoFrame;
    logo.image = [UIImage imageNamed:@"LOGO"];
    [bottomView addSubview:logo];
    logo.center = bottomView.center;
    bottomView.backgroundColor = [UIColor whiteColor];
    self.manage.bottomView = bottomView;
```
## 4.2 原生广告（三小图、纯图片、左图右文、左文右图、文字浮层、上下图文、上文下浮层，注：不同类型的广告样式在与不同的广告位id），在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>
### 4.2.1 原生广告（三小图、左图右文、左文右图、文字浮层、上下图文、上文下浮层）示例代码
```
self.manager = [[ADCDN_NativeExpressAdManager alloc] initWithPlcId:self.plcId];
self.manager.rootViewController = self;
self.manager.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
// 最多运行一次性拉去3张
self.manager.adCount = 3;
// 广告视图View的尺寸
self.manager.adSize = self.adSize;
[self.manager loadAd];
```
### 4.2.2 设置原生广告（三小图、左图右文、左文右图、文字浮层、上下图文、上文下浮层）代理方法示例代码，设置代理<ADCDN_NativeExpressAdManagerDelegate>
```
#pragma mark - ADCDN_NativeExpressAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_NativeExpressAdSuccessToLoad:(ADCDN_NativeExpressAdManager *)nativeExpressAd views:(NSArray<__kindof UIView *> *)views{
    
    [self.expressAdViews removeAllObjects];
    __weak typeof(self) weakSelf = self;
    if (views.count) {
        [self.expressAdViews addObjectsFromArray:views];
        [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIView *expressView = (UIView *)obj;
            [weakSelf.manager render:expressView];
        }];
    }
    NSLog(@"原生模板广告加载失败");
    [self.adTableView reloadData];
}
/**
 *  加载失败
 */
- (void)ADCDN_NativeExpressAd:(ADCDN_NativeExpressAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"原生模板广告加载失败");
}
/**
 *  渲染广告成功
 */
- (void)ADCDN_NativeExpressAdRenderSuccess:(UIView *)nativeExpressAdView{
    NSLog(@"原生模板广告渲染成功");
    [self.adTableView reloadData];
}
/**
 *  渲染广告失败
 */
- (void)ADCDN_NativeExpressAdRenderFail:(UIView *)nativeExpressAdView error:(NSError *_Nullable)error{
    NSLog(@"原生模板广告渲染失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_NativeExpressAdDidClick:(UIView *)nativeExpressAdView{
    NSLog(@"原生模板广告点击");
}
/**
 *  曝光回调
 */
- (void)ADCDN_NativeExpressAdDidBecomeVisible:(UIView *)nativeExpressAdView{
    NSLog(@"原生模板广告曝光");
}
/**
 *  关闭广告回调
 */
- (void)ADCDN_NativeExpressAdDidClose:(UIView *)nativeExpressAdView{
    NSLog(@"原生模板广告关闭回调");
    
    if (nativeExpressAdView) {
        [self.expressAdViews removeObject:nativeExpressAdView];
        [self.adTableView reloadData];
    }
}
```
~~### 4.2.3 原生广告（纯图片）示例代码~~
```
ADCDN_NativeCustomAdManager *nativeCustomAd = [ADCDN_NativeCustomAdManager shareManagerWithAppId:kAppId plcId:kPlcId];
nativeCustomAd.adView = self.adView;
nativeCustomAd.rootViewController = self;
nativeCustomAd.delegate = self;
[nativeCustomAd loadAd];
```
~~### 4.2.4 设置原生广告（纯图片）广告代理方法示例代码，设置代理<ADCDN_NativeCustomAdManagerDelegate>~~
```
/**
 *  拉取广告成功
 */
- (void)ADCDN_NativeCustomAdSuccessToLoad:(ADCDN_NativeCustomAdManager *)nativeExpressAd views:(UIView *)view{
    NSLog(@"拉取广告成功");
}
/**
 *  拉取广告失败
 */
- (void)ADCDN_NativeCustomAd:(ADCDN_NativeCustomAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"拉取广告失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_NativeCustomAdDidClick:(UIView *)nativeExpressAdView{
     NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_NativeCustomAdDidBecomeVisible:(UIView *)nativeExpressAdView{
     NSLog(@"曝光回调");
}
```
## 4.3 横幅广告，在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>
### 4.3.1 设置横幅广告示例代码
```
self.banner = [[ADCDN_BannerAdManager alloc] initWithPlcId:KplcId_Banner];
UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(0, 100 + 100,ScreenW , ScreenW/600*90)];
[self.view addSubview:adView];
self.banner.customView = adView;// banner加载的位置
self.banner.interval = 29;// 大于30循环
self.banner.rootViewController = self;
self.banner.delegate = self;// banner需要strong持有，否则delegate回调无法执行，影响计费
[self.banner loadNativeAd];
```
### 4.3.2 设置横幅广告代理方法示例代码，设置代理<ADCDN_BannerAdManagerDelegate>
```
/**
 *  ADCDN_BannerAdManagerDelegate 代理协议方法
 */
/// 加载成功
- (void)ADCDN_BannerAdDidLoad:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"加载成功-----%s",__FUNCTION__);
}
/// 加载失败
- (void)ADCDN_BannerAd:(ADCDN_BannerAdManager *)bannerAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"加载失败-----%s",__FUNCTION__);
}
/// 点击广告时
- (void)ADCDN_BannerAdDidClick:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"点击广告时-----%s",__FUNCTION__);
}
/// 曝光回调
- (void)ADCDN_BannerAdDidBecomeVisible:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"曝光回调-----%s",__FUNCTION__);
}
/// 关闭广告
-(void)ADCDN_BannerAdDidClose:(ADCDN_BannerAdManager *)bannerAd{
    NSLog(@"关闭回调-----%s",__FUNCTION__);
}
```
## 4.4 插屏广告，在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>
### 4.4.1 设置插屏广告示例代码
```
self.manager = [[ADCDN_InterstitialAdManager alloc] initWithPlcId:KplcId_Interstitial];
self.manager.rootViewController = self;
self.manager.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
[self.manager loadAd];
```
### 4.4.2 设置插屏广告代理方法示例代码，设置代理<ADCDN_InterstitialAdManagerDelegate>
```
#pragma mark - ADCDN_InterstitialAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_InterstitialAdDidLoad:(ADCDN_InterstitialAdManager *)InterstitialAd{
    NSLog(@"插屏加载成功");
}
/**
 *  加载失败
 */
- (void)ADCDN_InterstitialAd:(ADCDN_InterstitialAdManager *)InterstitialAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"插屏加载失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_InterstitialAdDidClick:(ADCDN_InterstitialAdManager *)InterstitialAd{
    NSLog(@"插屏点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_InterstitialAdDidBecomeVisible:(ADCDN_InterstitialAdManager *)InterstitialAd{
    NSLog(@"插屏曝光回调");
}
/**
 *  关闭广告回调
 */
- (void)ADCDN_InterstitialAdDidClose:(ADCDN_InterstitialAdManager *)InterstitialAd{
    NSLog(@"插屏广告关闭回调");
}
```
## 4.5 视频广告2.0（激励视频、非激励视频），在需要使用到ADCDN广告功能的地方导入#import<ADCDN/ADCDN.h>
### 4.5.1 设置激励视频广告（横屏、竖屏区分在与不同的广告位id）示例代码~~
```
self.manager = [[ADCDN_ExpressRewardVideoAdManager alloc] initWithPlcId:self.plcId];
        //需要 服务器到服务器回调的，请传入rewardVideoAdModel数据模型
    //    ADCDN_RewardVideoAdModel *rewardVideoAdModel = [ADCDN_RewardVideoAdModel new];
    //    rewardVideoAdModel.userId = @"123";
    //    rewardVideoAdModel.rewardName = @"rewardName";
    //    rewardVideoAdModel.rewardAmount = 1;
    //    rewardVideoAdModel.extra = @"extra";
    //    self.manager.rewardVideoAdModel = rewardVideoAdModel;
self.manager.rootViewController = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
self.manager.delegate = self;
[self.manager loadAd];
```

### 4.5.2 设置激励视频广告代理方法示例代码，设置代理<ADCDN_ExpressRewardVideoAdManagerDelegate>
```
#pragma mark - ADCDN_ExpressRewardVideoAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd{
    NSLog(@"加载成功");
}
/**
 *  加载失败
 */
- (void)ADCDN_RewardVideoAd:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"加载失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_RewardVideoAdDidClick:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd{
    NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_RewardVideoAdDidBecomeVisible:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd{
    NSLog(@"曝光回调");
}
/**
 *  视频播放完成
 */
- (void)ADCDN_RewardVideoAdDidPlayFinish:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"视频播放完成");
}
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_RewardVideoAdDidClose:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"播放完成点击关闭");
}
/**
 服务器核实回调成功
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidSucceed:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd verify:(BOOL)verify{
    NSLog(@"服务器核实回调成功");
}

/**
 服务器核实回调失败
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidFail:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"服务器核实回调失败");
}
```
### 4.5.3 注：服务器到服务器的回调(可选)
服务器到服务器回调让您判定是否提供奖励给观看广告的用户。当用户成功看完广告时，您可以在ADCDN平台配置从ADCDN服务器到您自己的服务器的回调链接，以通知您用户完成了操作。

回调方式说明

ADCDN服务器会以 GET 方式请求第三方服务的回调链接，并拼接以下参数回传：
```
user_id=%s&trans_id=%s&reward_name=%s&reward_amount=%d&extra=%s&sign=%s
```
| 字段定义        | 字段名称 |  字段类型  | 备注 |
| --------       | -----   | ----     |---- |
| sign           | 签名         |string    |签名 |
| user_id        | 用户id       |string    |调用SDK透传，应用对用户的唯一标识 |
| trans_id       | 交易id       |string    |完成观看的唯一交易ID |
| reward_amount  | 奖励数量      |int       |媒体平台配置或调用SDK传入|
| reward_name    | 奖励名称      |string    |媒体平台配置或调用SDK传入|
| extra          | Extra        |string    |调用SDK传入并透传，如无需要则为空|

签名生成方式

appSecurityKey: 您在ADCDN媒体平台新建奖励视频代码位获取到的密钥 transId：交易id sign = sha256(appSecurityKey:transId)

返回约定

返回 json 数据，字段如下：

|字段定义	|字段名称|	字段类型|	备注|
| --------       | -----   | ----     |---- |
|isValid|	校验结果|	bool|	判定结果，是否发放奖励|

示例：

{
    "isValid": true
}

### 4.5.4 设置非激励视频广告（横屏、竖屏区分在与不同的广告位id）示例代码
```
self.manager = [[ADCDN_FullscreenExpressVideoAdManager alloc] initWithPlcId:self.plcId];
self.manager.rootViewController = self;
self.manager.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
[self.manager loadAd];
```
### 4.5.5 设置非激励视频广告代理方法示例代码，设置代理<ADCDN_FullscreenExpressVideoAdManagerDelegate>
```
#pragma mark - ADCDN_FullscreenExpressVideoAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_FullscreenVideoAdDidLoad:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"加载成功");
}
/**
 *  加载失败
 */
- (void)ADCDN_FullscreenVideoAd:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"加载失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_FullscreenVideoAdDidClick:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_FullscreenVideoAdDidBecomeVisible:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"曝光回调");
}
/**
 *  视频播放完成
 */
- (void)ADCDN_FullscreenVideoAdDidPlayFinish:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    
    NSLog(@"视频播放完成");
}
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_FullscreenVideoAdDidClose:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"播放完成点击关闭");
}
/**
 * 视频广告点击跳过
 */
- (void)ADCDN_FullscreenVideoAdDidClickSkip:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"视频广告点击跳过");
}
```
~~## 4.6 原生自渲染广告，在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>~~
~~### 4.6.1 设置原生自渲染示例代码~~
```
// 原生自渲染
ADCDN_NativeCustomRenderAdManager *nativeCustomAd = [ADCDN_NativeCustomRenderAdManager shareManagerWithAppId:kAppId plcId:self.plcId];
nativeCustomAd.rootViewController = self;
nativeCustomAd.delegate = self;
nativeCustomAd.customView = self.customView;
[nativeCustomAd loadAd];
```
~~### 4.6.2 设置原生自渲染广告代理方法示例代码，设置代理<ADCDN_NativeCustomRenderAdManagerDelegate>~~
```
#pragma mark - ADCDN_NativeCustomRenderAdManagerDelegate

/**
 *  拉取广告成功
 */
- (void)ADCDN_NativeCustomRenderAdSuccessToLoad:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd withAdDataModel:(ADCDN_NativeCustomRenderModel *)adDataModel{
    NSLog(@"拉取广告成功");
    // 渲染视图
//    [self buildupCustomView:adDataModel];
    
    // 大图
    if (adDataModel.imageMode == ADCDNFeedADModeLargeImage) {
        [self setUILargeModel:adDataModel];
    }
    // 组图
    if (adDataModel.imageMode == ADCDNFeedADModeGroupImage) {
        [self setUIGroupModel:adDataModel];
    }
    // 单图
    if (adDataModel.imageMode == ADCDNFeedADModeSmallImage) {
        [self setUISmallModel:adDataModel];
    }
    // 视频
    if (adDataModel.imageMode == ADCDNFeedVideoAdModeImage) {
        [self setUIVideoModel:adDataModel];
        
    }
    /**
     *   测试自渲染信息
     */
    NSLog(@"广告标题：%@",adDataModel.adTitle);
    NSLog(@"广告副标题：%@",adDataModel.adDesc);
    NSLog(@"广告来源：%@",adDataModel.source);
    NSLog(@"广告icon：%@",adDataModel.adIcon);
    NSLog(@"广告图：%@",[adDataModel.adImageAry firstObject].imageURL);
}
/**
 *  拉取广告失败
 */
- (void)ADCDN_NativeCustomRenderAd:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"拉取广告失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_NativeCustomRenderAdDidClick:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd{
    NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_NativeCustomRenderAdDidBecomeVisible:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd{
    NSLog(@"曝光回调");
}
```
## 4.7 变现场景广告，在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>
### 4.7.1  变现场景广告示例代码
```
#pragma mark - 游戏视图
-(ADCDN_GameView *)gameView{
    if (!_gameView) {
        ADCDN_GameModel *model = [ADCDN_GameModel new];
        model.appId = @"10001";// 应用id（注：与广告的appid相同）
        model.gameId = KGame_GameId;// 游戏id
        model.textPlcId = KplcId_Text;// 原生广告-文字浮层
        model.topTextPlcId = KplcId_TopText;// 原生广告-上文下图
        model.rewardVideoPlcId = KplcId_RewardVideoVertical;// 原生广告-激励视频
        model.rootViewController = self;
        model.uuid = @"123123123";// 用户id，不传入为游客模式
        model.nickName = @"";// 用户昵称
        model.avatarUrl = @"";// 用户头像地址urlString
        _gameView = [[ADCDN_GameView alloc] initWithGameViewFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
        [_gameView loadGameViewModel:model withIsTest:YES];
        _gameView.delegate = self;
        [self.view addSubview:_gameView];
    }
    return _gameView;
}
```
### 4.7.2  变现场景广告示例代码设置代理<ADCDN_GameViewDelegate>
```
/**
 * ADCDN_GameViewDelegate
 */
#pragma mark - 分享第三方app/邀请好友
-(void)ADCDN_GameViewShareModel:(ADCDN_ShareModel *)model{
    NSLog(@"分享第三方app/邀请好友");
}
#pragma mark - 去登录，跳转app登录页面
-(void)ADCDN_GameViewGotoLogin{
    NSLog(@"跳装到app登录页");
}
```
## 4.8 游戏盒子场景广告，在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>
### 4.8.1  游戏盒子广告示例代码
```
#pragma mark - 初始化游戏大厅页面
-(ADCDN_GameBoxView *)gameBoxView{
    if (!_gameBoxView) {
        ADCDN_GameBoxModel *model = [ADCDN_GameBoxModel new];
        model.userSystem = 1;
        model.userId = @"123456";
        model.nickname = @"我的昵称";
        model.avatar = @"https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2131257963,3457119996&fm=58";
        model.existNav = 1;
        model.rootViewController = self;
        
        _gameBoxView = [[ADCDN_GameBoxView alloc] initWithGameBoxViewFrame:self.view.bounds];
        _gameBoxView.delegate = self;
        [self.view addSubview:_gameBoxView];
        [_gameBoxView loadGameViewModel:model];
    }
    return _gameBoxView;
}
```
### 4.8.2  游戏盒子广告示例代码<ADCDN_GameBoxViewDelegate>
```
#pragma mark - ADCDN_GameBoxViewDelegate

/**
 *  当app有用户体系时，还未登录，去登录，跳转app登录页面
 */
-(void)ADCDN_GameBoxViewGotoLogin{
    NSLog(@"去登录");
}
/**
 *  当游戏盒子处在app的二级页面，需要返回上一个页面时，导航栏的返回事件
 */
-(void)ADCDN_gameBoxViewNavBack{
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"返回");
}
```
### 4.8.3  游戏盒子广告获取游戏列表数据示例代码
```
#pragma mark - 获取游戏列表数据
-(void)requestGameList{
    ADCDN_GameBoxModel *model = [ADCDN_GameBoxModel new];
    model.userSystem = 1;
    model.userId = @"123456";
    model.nickname = @"我的昵称";
    model.avatar = @"https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2131257963,3457119996&fm=58";
    model.existNav = 1;
    model.rootViewController = self;
    __weak typeof(self) weakSelf = self;
    ADCDN_GameBoxGamesTool *gameTool = [ADCDN_GameBoxGamesTool new];
    [gameTool getWithModel:model gameBoxBlock:^(NSMutableArray<ADCDN_GameBoxGamesModel *> *modelArr) {
        NSLog(@"%@",modelArr);
        weakSelf.modelArr = modelArr;
        [weakSelf.listCV reloadData];
    }];
}
```
### 4.8.4  游戏盒子广告点击某个游戏示例代码
```
 ADCDN_GameBoxGamesModel *model =self.modelArr[indexPath.row];
ADCDN_GameBoxGamesTool *gameTool = [ADCDN_GameBoxGamesTool new];
[gameTool didGameWithModel:model withViewController:self];
```
### 4.8.5  游戏盒子广告获取游戏开关状态示例代码
```
/**
 * 获取游戏开关 1 开启 否则关闭
 */
-(NSString *)getScenesSwitch;
```