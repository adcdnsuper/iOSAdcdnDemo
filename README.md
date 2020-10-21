<p align="center">
<img src="https://github.com/pengshuangta/images/blob/master/adcdn_picture.png">
</p>

# <div align='center' ><font size='70'>ADCDN SDK for iOS</font></div>
## 1. 概述
通过本文档，您可以轻松的在几分钟之内完成广告的集成过程。

## *注意事项：*
1、运行demo前，请先在终端cd到工程目录执行pod install，添加依赖库，demo才能加载出广告，为了避免不同平台的依赖库版本可能存在冲突或不同版本可能存在函数被弃用，故建议添加依赖库时请保持跟SDK中添加的版本一致，如：GDTMobSDK添加的是4.11.10版本,如果pod search xxx库，没有找到指定的最新版本，可以执行pod repo update 更新最新的cocoapods；  
2、广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
``` java
platform :ios,'9.0'
target 'YX_AD_demo' do
pod 'GDTMobSDK', '4.11.11'
pod 'Bytedance-UnionAD', '3.2.6.2'
end
```
``` java
pod install时CDN: trunk URL couldn't be downloaded: https://raw.githubusercontent.com/CocoaPods/Specs/master/Specs/
解决方法：
1.不替换cdn源：
步骤：1.终端执行sudo vim /private/etc/hosts
　　　2.在hosts文件中添加199.232.4.133  raw.githubusercontent.com的映射，重新执行pod install
2.用source 'https://github.com/CocoaPods/Specs.git'替换到cdn源
步骤：1.在podfile里面添加source 'https://github.com/CocoaPods/Specs.git'
　　　2.终端下执行 pod repo remove trunk来移除trunk，重新pod install
```

ADCDN广告SDK支持如下广告功能:

| 广告功能        | 详情 | 
| --------       | -----   |
| 开屏广告        | 开屏广告         |
| 原生广告        | （三小图、左图右文、左文右图、文字浮层、上下图文、上文下浮层）        |
| 横幅广告        | 横幅广告         |
| 插屏广告        | 插屏广告         |
| 视频广告2.0       | 激励视频广告（横屏、竖屏） 非激励视频广告（横屏、竖屏）         |
| 营销场景       | 消星星、橘子消成语、幸运转盘、金币抢夺、刮刮乐等游戏         |

##3、穿山甲开发者升级 iOS 14 checklist
[穿山甲官网说明地址](https://www.pangle.cn/union/media/union/download/detail?id=16&osType=ios)
1、应用编译环境升级至 Xcode 12.0 及以上版本
2、升级穿山甲 iOS SDK 3.2.5.0 及以上版本，提供了 iOS 14 与 SKAdNetwork 支持
3、将穿山甲的 SKAdNetwork ID 添加到 info.plist 中，以保证 SKAdNetwork 的正确运行
``` xml
<key>SKAdNetworkItems</key>
  <array>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>238da6jt44.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>22mmun2rn5.skadnetwork</string>
    </dict>
  </array>
```
4.支持苹果 ATT：从 iOS 14 开始，在应用程序调用 App Tracking Transparency 向用户提跟踪授权请求之前，IDFA 将不可用。 如果应用未提出此请求，应用获取到的 IDFA 将自动清零，可能会导致您的广告收入的降低
要获取 App Tracking Transparency 权限，请更新您的 Info.plist，添加 NSUserTrackingUsageDescription 字段和自定义文案描述。代码示例：
``` xml
<key>NSUserTrackingUsageDescription</key>
<string>该标识符将用于向您投放个性化广告</string>
``` 
要向用户申请权限时，请调用 `requestTrackingAuthorizationWithCompletionHandler:`，我们建议您申请权限后在请求广告，以便获得穿山甲准确获得用户的授权。
```xml
Swift 代码示例

import AppTrackingTransparency
import AdSupport
...
func requestIDFA() {
  ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
    // Tracking authorization completed. Start loading ads here.
    // loadAd()
  })
}
切换主题复制
Objective-C 代码示例

#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>
...
- (void)requestIDFA {
  [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
    // Tracking authorization completed. Start loading ads here.
    // [self loadAd];
  }];
}
```
请注意：
App Tracking Transparency（ATT）适用于请求用户授权，访问与应用相关的数据以跟踪用户或设备。 访问 https://developer.apple.com/documentation/apptrackingtransparency 了解更多信息。
SKAdNetwork（SKAN）是 Apple 的归因解决方案，可帮助广告客户在保持用户隐私的同时衡量广告活动。 使用 Apple 的 SKAdNetwork 后，即使 IDFA 不可用，广告网络也可以正确获得应用安装的归因结果。 访问 https://developer.apple.com/documentation/storekit/skadnetwork 了解更多信息。
## 2. 接入Android请跳转以下链接
[接入Android版ADCDN链接](https://github.com/adcdnsuper/AndroidAdcdnDemo)


## 3. 兼容和历史版本
iOS9.0及以上，最新版本号：V 8.5.2，已经对接过ADCDN的，如需要更新最新版本，直接替换demo中的ADCDN.framework和ADCDN.bundle即可。

| 版本号        | 更新内容 | 更新时间 | 
| --------       | -----   |----- | 
| V8.5.2       |  1、优化SDK；2、适配依赖包版本支持iOS14：GDTMobSDK V4.11.11和Bytedance-UnionAD V3.2.6.2；
| V8.4.3       |  1、优化SDK，提高变现能力；2、适配包版本GDTMobSDK V4.11.10和Bytedance-UnionAD V3.2.0.1；3、请对应更新穿山甲Bytedance-UnionAD V3.2.0.1，因为穿山甲V3.1.0.5版本激励视频存在内存泄漏问题。|2020-09-27
| V8.4.2       |  优化SDK，提高变现能力|2020-09-23
| V8.4.0       |  优化SDK|2020-09-18
| V8.3.0       |  优化SDK，提高变现能力|2020-09-14
| V8.2.1       |  优化SDK|2020-09-04
| V8.2.0       |  优化SDK，提供视频加载速度，适配依赖最新包版本GDTMobSDK V4.11.10和Bytedance-UnionAD V3.1.0.5|2020-08-28
| V8.1.2        |  优化SDK，提高营销场景广告变现能力       ，适配依赖最新包版本GDTMobSDK V4.11.10和Bytedance-UnionAD V3.1.0.5|2020-08-12
| V7.2.0        |  新增营销场景功能增强APP广告变现能力：快捷桌面启动、幸运刮刮乐等       |2020-06-17
| V7.0.4        |  优化营销场景初始化失败重新加载逻辑       |2020-05-27
| V7.0.3        | 1、提供根据版本号关闭营销场景入口的方法；2、优化初始化失败重试方案；3、修复优量汇横幅广告轮播问题        |2020-05-25
| V7.0.2        | 适配了V4.11.8的优量汇版本横幅广告加载crash问题，原因：横幅广告初始化方法V4.11.8之后废弃了之前的初始化方法         |2020-05-19|
| V7.0.1        | 优化营销场景的加载速度         |2020-05-18|
| V7.0.0        |   新增营销场景变现场景      |2020-05-15|
## 4. ADCDN接入流程
### 4.1 添加ADCDN到工程
接入环境：Xcode 可以复制YD_AD_demo中ADCDN_SDK文件目录下的ADCDN.framework到项目中。如果也需要集成demo中的营销场景，请把ADCDN.bundle资源文件一并拖入。
### 4.2 权限申请
苹果公司在iOS9中升级了应用网络通信安全策略，默认推荐开发者使用HTTPS协议来进行网络通信，并限制HTTP协议的请求。为了避免出现无法拉取到广告的情况，我们推荐开发者在info.plist文件中增加如下配置来实现广告的网络访问：（信任HTTP请求）
``` xml
<key>NSAppTransportSecurity</key>
    <dict>
         <key>NSAllowsArbitraryLoads</key>
         <true/>
    </dict>
```
SDK不会主动获取应用位置权限，当应用本身有获取位置权限逻辑时，需要在应用的 info.plist 添加相应配置信息，避免 AppStore审核被拒：
``` xml
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>请允许APP获取您的位置信息</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>请允许APP获取您的位置信息</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>请允许APP获取您的位置信息</string>
<key>NSPhotoLibraryAddUsageDescription</key>
```
相册相关权限(如果有接入营销场景的话，需要提供以下相册相机权限，营销场景内更改用户头像需要访问该权限)。
``` xml
<key>NSCameraUsageDescription</key>
<string>请允许APP访问您的相机功能，以便使用拍照功能上传用户头像</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>请允许APP访问您的相册功能，以便保存图片到系统相册功能</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>请允许APP访问您的相册功能，以便使用拍照存储功能</string>
```
营销场景添加快捷桌面启动需要设置：工程 - info - URL Types - URL Schemes如图所示：
<p align="center">
<img src="https://github.com/pengshuangta/images/blob/master/adcdn_urlscheme.png">
</p>

## 5 接入代码
### 5.1 程序启动初始化ADCDN
ADCDN初始化配置，在AppDelegate.m中导入ADCDN的头文件：*#import ADCDN/ADCDN.h>*，在app程序的启动函数didFinishLaunchingWithOptions中初始化ADCDN
提示：appId、plcId请到ADCDN开发者平台获取
``` Objective-C
// 初始化ADCDN
[ADCDN_ConfigManager shareManagerWithAppId:KappId];
// 日志开关，默认关闭，控制台过滤 ADCDN_Log关键字查看log
[ADCDN_DebugLogTool setLogEnable:YES];
// 查看SDK版本
NSLog(@"ADCDN_version:%@",[[ADCDN_ConfigManager shareManagerWithAppId:KappId] getSDKVersion]);
```
### 5.2 开屏广告
初始化开屏广告
``` Objective-C
#pragma mark - 加载开屏广告
-(void)loadSplashAd{
   CGRect frame = [UIScreen mainScreen].bounds;
   // 防止白屏，给一个兜底图，开发者可以设置一个跟启动图一样的
   UIView *bottomView = [[UIView alloc] initWithFrame:frame];
   // icon
   UIImageView *launchImg = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 62)/2.0, 180, 62, 62)];
   launchImg.image = [UIImage imageNamed:@"launch_icon"];
   launchImg.contentMode = UIViewContentModeScaleAspectFit;
   [bottomView addSubview:launchImg];
   UIImageView *launchNameImg = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 76)/2.0, launchImg.frame.size.height + launchImg.frame.origin.y + 30, 76, 18)];
   launchNameImg.image = [UIImage imageNamed:@"launch_name"];
   launchNameImg.contentMode = UIViewContentModeScaleAspectFit;
   [bottomView addSubview:launchNameImg];
   self.splashAdView.bottomView = bottomView;
   // 设置开屏底部自定义LogoView，展示半屏开屏广告
   UIView *logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.width * 0.25)];
   UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:logoView.frame];
   CGRect logoFrame = logoImageView.frame;
   logoFrame.size.width = 123;
   logoFrame.size.height = 30;
   logoImageView.frame = logoFrame;
   logoImageView.image = [UIImage imageNamed:@"splash_logo"];
   [logoView addSubview:logoImageView];
   logoImageView.center = logoView.center;
   logoView.backgroundColor = [UIColor whiteColor];
   self.splashAdView.logoView = logoView;
   // 加载开屏广告
   [self.splashAdView loadSplashAd];
}
#pragma mark - 开屏页懒加载
-(ADCDN_SplashAdManagerView *)splashAdView{
    if (!_splashAdView) {
        CGRect frame = [UIScreen mainScreen].bounds;
        _splashAdView = [[ADCDN_SplashAdManagerView alloc] initWithFrame:frame plcId:KplcId_Splash];
        _splashAdView.backgroundColor = [UIColor whiteColor];
        _splashAdView.window = self.window;
        _splashAdView.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
        [self.window.rootViewController.view addSubview:_splashAdView];
        _splashAdView.rootViewController = self.window.rootViewController;
    }
    return _splashAdView;
}
// 【可选】设置开屏底部自定义LogoView，展示半屏开屏广告
/*
UIView *logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.width * 0.25)];
UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:logoView.frame];
CGRect logoFrame = logoImageView.frame;
logoFrame.size.width = 123;
logoFrame.size.height = 30;
logoImageView.frame = logoFrame;
logoImageView.image = [UIImage imageNamed:@"splash_logo"];
[logoView addSubview:logoImageView];
logoImageView.center = logoView.center;
logoView.backgroundColor = [UIColor whiteColor];
self.splashAdView.logoView = logoView;
*/
// 加载开屏广告
[self.splashAdView loadSplashAd];
```
实现开屏广告代理方法
``` Objective-C
#pragma mark - ADCDN_SplashAdManagerDelegate 代理协议方法
/**
 *  开屏广告成功展示
 */
- (void)ADCDN_SplashAdSuccessPresentScreen:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告成功展示");
}
/**
 *  开屏广告展示失败
 *  广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
 */
- (void)ADCDN_SplashAdFailToPresent:(ADCDN_SplashAdManagerView *_Nullable)splashAd withError:(NSError *_Nullable)error {
    NSLog(@"%s---%@ error:%@",__FUNCTION__,@"开屏广告展示失败",error);
    // 移除开屏视图
    if (self.splashAdView) {
        [self.splashAdView removeFromSuperview];
        self.splashAdView = nil;
    }
}
/**
 *  开屏广告曝光回调
 */
- (void)ADCDN_SplashAdExposured:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告曝光回调");
}
/**
 *  开屏广告点击回调
 */
- (void)ADCDN_SplashAdClicked:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告点击回调");
}
/**
 *  开屏广告关闭回调
 */
- (void)ADCDN_SplashAdClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告关闭回调");
    // 移除开屏视图
    if (self.splashAdView) {
        [self.splashAdView removeFromSuperview];
        self.splashAdView = nil;
    }
}
/**
 *  开屏广告将要关闭回调
 */
- (void)ADCDN_SplashAdWillClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd{
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告将要关闭回调");
}
/**
 *  开屏详情页关闭回调
 */
- (void)ADCDN_SplashAdDetailClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd{
    NSLog(@"%s---%@",__FUNCTION__,@"开屏详情页关闭回调");
}
```
开屏广告底部自定义logo
``` Objective-C
// 【可选】设置开屏底部自定义LogoView，展示半屏开屏广告
UIView *logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.width * 0.25)];
UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:logoView.frame];
CGRect logoFrame = logoImageView.frame;
logoFrame.size.width = 123;
logoFrame.size.height = 30;
logoImageView.frame = logoFrame;
logoImageView.image = [UIImage imageNamed:@"splash_logo"];
[logoView addSubview:logoImageView];
logoImageView.center = logoView.center;
logoView.backgroundColor = [UIColor whiteColor];
self.splashAdView.logoView = logoView;
```
### 5.3 原生广告
初始化原生广告
``` Objective-C
self.nativeExpressAdManager = [[ADCDN_NativeExpressAdManager alloc] initWithPlcId:self.plcId];
self.nativeExpressAdManager.rootViewController = self;
self.nativeExpressAdManager.delegate = self;// nativeExpressAdManager需要strong持有，否则delegate回调无法执行，影响计费
// 最多运行一次性拉去3张
self.nativeExpressAdManager.adCount = 3;
// 广告视图View的尺寸
self.nativeExpressAdManager.adSize = self.adSize;
[self.nativeExpressAdManager loadAd];
```
实现原生广告代理方法
``` Objective-C
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
            [weakSelf.nativeExpressAdManager render:expressView];
        }];
    }
    [self.adTableView reloadData];
}
/**
 *  加载失败
 *  广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
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
### 5.4 横幅广告
初始化横幅广告
``` Objective-C
self.bannerAdManager = [[ADCDN_BannerAdManager alloc] initWithPlcId:KplcId_Banner];
self.bannerAdManager.customView = self.adView;// banner加载的位置
self.bannerAdManager.interval = 29;// 大于30循环
self.bannerAdManager.rootViewController = self;
self.bannerAdManager.delegate = self;// banner需要strong持有，否则delegate回调无法执行，影响计费
self.bannerAdManager.adSize = CGSizeMake(ScreenW, ScreenW / 6.25);
[self.bannerAdManager loadNativeAd];
```
实现横幅广告代理方法
``` Objective-C
#pragma mark - ADCDN_BannerAdManagerDelegate 代理协议方法
/**
 *  加载成功
 */
- (void)ADCDN_BannerAdDidLoad:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"加载成功-----%s",__FUNCTION__);
}
/**
 *  加载失败
 *  广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
 */
- (void)ADCDN_BannerAd:(ADCDN_BannerAdManager *)bannerAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"加载失败-----%s",__FUNCTION__);
}
/**
 *  点击广告
 */
- (void)ADCDN_BannerAdDidClick:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"点击广告时-----%s",__FUNCTION__);
}
/**
 *  曝光回调
 */
- (void)ADCDN_BannerAdDidBecomeVisible:(ADCDN_BannerAdManager *)bannerAd {
    NSLog(@"曝光回调-----%s",__FUNCTION__);
}
/**
 *  关闭广告
 */
-(void)ADCDN_BannerAdDidClose:(ADCDN_BannerAdManager *)bannerAd{
    NSLog(@"关闭回调-----%s",__FUNCTION__);
}
```
### 5.5 插屏广告
初始化插屏广告
``` Objective-C
self.interstitialAdManager = [[ADCDN_InterstitialAdManager alloc] initWithPlcId:KplcId_Interstitial];
self.interstitialAdManager.rootViewController = self;
self.interstitialAdManager.delegate = self;// interstitialAdManager需要strong持有，否则delegate回调无法执行，影响计费
[self.interstitialAdManager loadAd];
```
实现插屏广告代理方法
``` Objective-C
#pragma mark - ADCDN_InterstitialAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_InterstitialAdDidLoad:(ADCDN_InterstitialAdManager *)InterstitialAd{
    NSLog(@"插屏加载成功");
}
/**
 *  加载失败
 *  广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
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
### 5.6 激励视频广告
初始化激励视频广告
``` Objective-C
self.rewardVideoAdManager = [[ADCDN_ExpressRewardVideoAdManager alloc] initWithPlcId:self.plcId];
// 需要 服务器到服务器回调的，请传入rewardVideoAdModel数据模型
// ADCDN_RewardVideoAdModel *rewardVideoAdModel = [ADCDN_RewardVideoAdModel new];
// rewardVideoAdModel.userId = @"123456789";
// rewardVideoAdModel.rewardName = @"rewardName";
// rewardVideoAdModel.rewardAmount = 1;
// rewardVideoAdModel.extra = @"extra";
// self.rewardVideoAdManager.rewardVideoAdModel = rewardVideoAdModel;
self.rewardVideoAdManager.rootViewController = self;// rewardVideoAdManager需要strong持有，否则delegate回调无法执行，影响计费
self.rewardVideoAdManager.delegate = self;
[self.rewardVideoAdManager loadAd];
```

实现激励视频广告代理方法
``` Objective-C
#pragma mark - ADCDN_ExpressRewardVideoAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd{
    NSLog(@"加载成功");
}
/**
 *  加载失败
 *  广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
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
 服务器核实回调成功(V7.0.0开始不支持)
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidSucceed:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd verify:(BOOL)verify{
    NSLog(@"服务器核实回调成功");
}
/**
 服务器核实回调失败(V7.0.0开始不支持)
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidFail:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"服务器核实回调失败");
}
```
### 5.7 全屏视频广告（非激励视频）
初始化全屏视频广告
``` Objective-C
self.fullscreenVideoAdManager = [[ADCDN_FullscreenExpressVideoAdManager alloc] initWithPlcId:self.plcId];
self.fullscreenVideoAdManager.rootViewController = self;
self.fullscreenVideoAdManager.delegate = self;// fullscreenVideoAdManager需要strong持有，否则delegate回调无法执行，影响计费
[self.fullscreenVideoAdManager loadAd];
```
实现全屏视频广告代理
``` Objective-C
/**
 *  加载成功
 */
- (void)ADCDN_FullscreenVideoAdDidLoad:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"加载成功");
}
/**
 *  加载失败
 *  广告拉取失败，禁止多次重试请求广告，避免请求量消耗过大，导致填充率过低，影响系统对您流量的评价从而影响变现效果，得不到广告收益。
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
### 5.8 营销场景广告
初始化营销场景广告
``` Objective-C
#pragma mark - 启动营销场景
ADCDN_GameBoxVCModel *model = [ADCDN_GameBoxVCModel new];
// 必传 app的标识urlScheme，添加快捷桌面图标使用（在工程 - info - URL Types中填写）
model.urlScheme = @"bookkeepingDesktop";
// 必传 presentViewController营销场景的控制器
model.rootViewController = self;
// userId可选，绑定第三方app的userId，打通金币体系
// model.userId = @"app自身账户体系的userId";
[[ADCDN_GameBoxManager defaultManager] openGameBoxWithModel:model];
```
``` Objective-C
#pragma mark - 快捷桌面启动执行的appdelegate方法
-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
BOOL resault = NO;
// adcdnGameBox为营销场景的唯一标识
if ([url.absoluteString containsString:@"adcdnGameBox"]) {
    // 方式一：跳转到营销场景首页
       resault = [[ADCDN_GameBoxManager defaultManager] handleOpenURL:url options:options];
    // 方式二：跳转到营销场景首页，绑定第三方用户id，如果游客模式userId可为空
//  resault = [[ADCDN_GameBoxManager defaultManager] handleOpenURL:url options:options userId:@"第三方userId"];
}
return resault;
}
```
营销场景获取开关状态示例代码
``` Objective-C
/**
 * 当前APP的版本是否关闭了营销场景
 * YES 关闭
 * NO 打开
 */
-(void)getGameBoxSwitchStatus:(ADCDN_GameBoxSwitchStatusBlock _Nullable )gameBoxSwitchStatusBlock;
// 代码调用
[[ADCDN_ConfigManager shareManagerWithAppId:KappId] getGameBoxSwitchStatus:^(BOOL isClose) {
    if (isClose) {
        NSLog(@"关闭营销场景入口");
    }
    else{
        NSLog(@"开启营销场景入口");
    }
}];
```
