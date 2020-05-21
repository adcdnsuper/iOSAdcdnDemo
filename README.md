# <div align='center' ><font size='70'>ADCDN SDK for iOS</font></div>
## 1. 概述
通过本文档，您可以轻松的在几分钟之内完成广告的集成过程。

*注意：运行demo前，请先在终端cd到工程目录执行pod install，添加依赖库，demo才能加载出广告。*
``` java
platform :ios,'9.0'
target 'YX_AD_demo' do
pod 'GDTMobSDK', '~> 4.11.8'
pod 'Bytedance-UnionAD', '~> 2.9.5.6'
end
```

ADCDN广告SDK支持如下广告功能:

| 广告功能        | 详情 | 
| --------       | -----   |
| 开屏广告        | 开屏广告         |
| 原生广告        | （三小图、左图右文、左文右图、文字浮层、上下图文、上文下浮层）        |
| 横幅广告        | 横幅广告         |
| 插屏广告        | 插屏广告         |
| 视频广告2.0       | 激励视频广告（横屏、竖屏） 非激励视频广告（横屏、竖屏）         |
| 游戏盒子变现场景       | 消星星、橘子消成语、转盘、抢夺金币等游戏         |

## 2. 接入Android请跳转以下链接
[接入Android版ADCDN链接](https://github.com/adcdnsuper/AndroidAdcdnDemo)


## 3. 兼容和历史版本
iOS9.0及以上，最新版本号：V 7.0.2。

| 版本号        | 更新内容 | 更新时间 | 
| --------       | -----   |----- | 
| V7.0.0        |   新增游戏盒子变现场景      |2020-05-15|
| V7.0.1        | 优化游戏盒子的加载速度         |2020-05-18|
| V7.0.2        | 适配了V4.11.8的优量汇版本横幅广告加载crash问题，原因：横幅广告初始化方法V4.11.8之后废弃了之前的初始化方法         |2020-05-19|
## 4. ADCDN接入流程
### 4.1 添加ADCDN到工程
接入环境：Xcode 可以复制YD_AD_demo中ADCDN_SDK文件目录下的ADCDN.framework到项目中。如果也需要集成demo中的游戏盒子，请把ADCDN.bundle资源文件一并拖入。
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

相册相关权限(如果有接入游戏盒子场景的话，需要提供以下相册相机权限，游戏盒子内更改用户头像需要访问该权限)。
``` xml
<key>NSCameraUsageDescription</key>
<string>请允许APP访问您的相机功能，以便使用拍照功能上传用户头像</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>请允许APP访问您的相册功能，以便保存图片到系统相册功能</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>请允许APP访问您的相册功能，以便使用拍照存储功能</string>
```
### 4.3 配置ADCDN广告平台依赖库
注：为了避免不同平台的依赖库版本可能存在冲突或不同版本可能存在函数被弃用，故建议添加依赖库时请保持跟SDK中添加的版本一致，如：GDTMobSDK添加的是4.11.8版本,如果pod search xxx库，没有找到指定的最新版本，可以执行pod repo update 更新最新的cocoapods。
``` java
platform :ios, '9.0'
target '你的项目名' do
# 优量汇广告来源
pod 'GDTMobSDK', '~> 4.11.8'
# 穿山甲广告来源
pod 'Bytedance-UnionAD', '~> 2.9.5.6'
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
// 初始化开屏广告
CGRect frame = [UIScreen mainScreen].bounds;
self.splashAdManager = [[ADCDN_SplashAdManager alloc] initWithPlcId:KplcId_Splash];
self.splashAdManager.wFrame = frame;
self.splashAdManager.window = [UIApplication sharedApplication].keyWindow;
self.splashAdManager.rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
// splashAdManagerr需要strong持有，否则delegate回调无法执行，影响计费
self.splashAdManager.delegate = self;
// 加载广告
[self.splashAdManager loadSplashAd];
```
实现开屏广告代理方法
``` Objective-C
#pragma mark - ADCDN_SplashAdManagerDelegate 代理协议方法
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
 *  开屏广告将要关闭回调
 */
- (void)ADCDN_SplashAdWillClosed:(ADCDN_SplashAdManager *_Nullable)splashAd{
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告将要关闭");
}
/**
 *  开屏广告关闭回调
 */
- (void)ADCDN_SplashAdClosed:(ADCDN_SplashAdManager *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告关闭回调");
}
/**
*  开屏详情关闭回调
*/
-(void)ADCDN_SplashAdDetailClosed:(ADCDN_SplashAdManager *)splashAd{
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告详情关闭回调");
}
```
开屏广告底部自定义logo
``` Objective-C
// 设置开屏底部自定义LogoView，展示半屏开屏广告
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
self.splashAdManager.bottomView = bottomView;
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
### 5.8 游戏盒子场景广告
初始化游戏盒子场景广告
``` Objective-C
#pragma mark - 游戏盒子view
-(ADCDN_GameBoxView *)gameBoxView{
    if (!_gameBoxView) {
        _gameBoxView = [[ADCDN_GameBoxView alloc] initWithGameBoxViewFrame:self.view.bounds];// 注：如果gameBoxView添加的一级页面底部有tabbar，view的height要扣除掉tabbar的高度
        _gameBoxView.delegate = self;
        [self.view addSubview:_gameBoxView];
        ADCDN_GameBoxModel *gameModel = [ADCDN_GameBoxModel new];
        gameModel.showBackBtn = YES;
        gameModel.showImmersive = YES;
        gameModel.rootViewController = self;
        [_gameBoxView loadGameViewModel:gameModel];
    }
    return _gameBoxView;
}

```
实现游戏场景广告代理方法
``` Objective-C
#pragma mark - ADCDN_GameBoxViewDelegate
/**
 *  退出游戏盒子
 */
-(void)ADCDN_gameBoxViewBack{
    [self dismissViewControllerAnimated:YES completion:^{ 
    }];
}
```
游戏盒子获取游戏开关状态示例代码
``` Objective-C
/**
 * 获取游戏开关状态 1 开启 否则关闭
 */
-(NSString *)getScenesSwitch;
```