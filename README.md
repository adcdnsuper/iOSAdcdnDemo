# 1.概述
尊敬的开发者朋友，欢迎您使用ADCDN广告sdk平台。通过本文档，您可以轻松的在几分钟之内完成广告的集成过程。
# 2.兼容和版本号
iOS9.0及以上，版本号：1.0.0。
# 3.ADCDN_SDK的接入流程
## 3.1 添加sdk到工程
接入环境：Xcode 可以复制ADCDN_demo中ADCDN_Framework文件目录下的ADCDN.framework到项目中。
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
## 3.3 配置其他广告平台依赖库
```
platform :ios, '9.0'
target '你的项目名' do
pod 'GDTMobSDK', '~> 4.8.10'
pod 'Bytedance-UnionAD', '~> 1.9.8.5'
end
```
## 3.4 sdk初始化配置
提示：appid请联系商务获取，并在AppDelegate的didFinishLaunchingWithOptions方法中进行SDK初始化
```
// 初始化ADCDN_SDK的appid
[ADCDN_ConfigManager shareManagerWithAppID:KappId];
```
# 4.sdk广告业务功能
## 4.1 开屏广告
### 4.1.1 设置开屏广告示例代码
```
CGRect frame = [UIScreen mainScreen].bounds;
ADCDN_SplashAdManager *manage = [ADCDN_SplashAdManager shareManager];
manage.window = self.window;
manage.wFrame = frame;
manage.delegate = self;
[manage loadSplashAd];
```
### 4.1.2 设置开屏广告示例代码
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
 *  开屏广告将要关闭回调
 */
- (void)ADCDN_SplashAdWillClosed:(ADCDN_SplashAdManager *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告将要关闭回调");
}
/**
 *  开屏广告关闭回调
 */
- (void)ADCDN_SplashAdClosed:(ADCDN_SplashAdManager *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告关闭回调");
}
```
