# 1.概述
尊敬的开发者朋友，欢迎您使用ADCDN广告sdk平台。通过本文档，您可以轻松的在几分钟之内完成广告的集成过程。
# 2.兼容和版本号
iOS9.0及以上，版本号：1.0.0。
注：ADCDN.framework是真机包，请在真机下做测试。
# 3.ADCDN_SDK的接入流程
## 3.1 添加sdk到工程
接入环境：Xcode 可以复制YD_AD_demo中ADCDN_Framework文件目录下的ADCDN.framework到项目中。
(1)如图：Xcode11最新版本需要在 项目->General->Frameworks,Libraries,and Embedded Content->点击➕，添加 ADCDN.framework->选择右边的Embed & Sign
![如图](https://github.com/pengshuangta/images/blob/master/ADCDN01.png)
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
## 3.3 配置其他广告平台依赖库，注：为了避免不同平台的依赖库版本可能存在冲突，故添加依赖库时请保持跟SDK中添加的版本一致，如：GDTMobSDK添加的是4.10.13版本,如果pod search xxx库，没有找到指定的最新版本，可以执行pod repo update 更新最新的cocoapods。
```
platform :ios, '9.0'
target '你的项目名' do
pod 'GDTMobSDK', '~> 4.10.13'
pod 'Bytedance-UnionAD', '~> 2.4.6.7'
end
```
## 3.4 sdk初始化配置，在AppDelegate.m中导入ADCDN的头文件：#import <ADCDN/ADCDN.h>，在需要实现ADCDN开屏广告的地方导入代理：ADCDN_SplashAdManagerDelegate
提示：appId、plcId请到ADCDN开发者平台获取
```
 // 初始化开屏广告
    ADCDN_SplashAdManager *manage = [ADCDN_SplashAdManager shareManagerWithAppId:KappId plcId:KplcId];
    manage.window = self.window;
    CGRect frame = [UIScreen mainScreen].bounds;
    manage.wFrame = frame;
    manage.delegate = self;
```
# 4.sdk广告业务功能
## 4.1 开屏广告
### 4.1.1 设置开屏广告示例代码
```
 // 初始化开屏广告
    ADCDN_SplashAdManager *manage = [ADCDN_SplashAdManager shareManagerWithAppId:KappId plcId:KplcId];
    manage.window = self.window;
    CGRect frame = [UIScreen mainScreen].bounds;
    manage.wFrame = frame;
    manage.delegate = self;
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
    manage.bottomView = bottomView;
```
## 4.2 横幅广告，在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>
### 4.2.1 设置横幅广告示例代码
```
ADCDN_BannerAdManager *banner = [ADCDN_BannerAdManager shareManagerWithAppId:KappId plcId:KplcId];
banner.customView = view;// banner加载的位置
banner.interval = 29;// 大于等于30循环
banner.rootViewController = self;
banner.delegate = self;
[banner loadNativeAd];
```
### 4.2.2 设置横幅广告代理方法示例代码，设置代理<ADCDN_BannerAdManagerDelegate>
```
/**
 *  ADCDN_BannerAdManagerDelegate 代理协议方法
 */
/// 加载成功
- (void)ADCDN_BannerAdDidLoad:(ADCDN_BannerAdManager *)nativeAd {
    NSLog(@"加载成功-----%s",__FUNCTION__);
}
/// 加载失败
- (void)ADCDN_BannerAd:(ADCDN_BannerAdManager *)nativeAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"加载失败-----%s",__FUNCTION__);
}
/// 点击广告时
- (void)ADCDN_BannerAdDidClick:(ADCDN_BannerAdManager *)nativeAd {
    NSLog(@"点击广告时-----%s",__FUNCTION__);
}
/// 曝光回调
- (void)ADCDN_BannerAdDidBecomeVisible:(ADCDN_BannerAdManager *)nativeAd {
    NSLog(@"曝光回调-----%s",__FUNCTION__);
}
```
## 4.3 激励视频广告，在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>
### 4.3.1 设置激励视频广告示例代码
```
ADCDN_RewardVideoAdManager *manager = [ADCDN_RewardVideoAdManager shareManagerWithAppId:KappId plcId:KplcId];
/*
//需要 服务器到服务器回调的，请传入rewardVideoAdModel数据模型
ADCDN_RewardVideoAdModel *rewardVideoAdModel = [ADCDN_RewardVideoAdModel new];
rewardVideoAdModel.userId = @"123";//用户id
rewardVideoAdModel.rewardName = @"rewardName";//奖励名称
rewardVideoAdModel.rewardAmount = 1;//奖励数量
rewardVideoAdModel.extra = @"extra";// 额外可扩展参数，如无需要则为空
manager.rewardVideoAdModel = rewardVideoAdModel;
*/
manager.rootViewController = self;
manager.delegate = self;
[manager loadAd];
```
### 4.3.2 设置激励视频广告代理方法示例代码，设置代理<ADCDN_RewardVideoAdManagerDelegate>
```
#pragma mark - ADCDN_RewardVideoAdManagerDelegate
/**
 *  加载成功
 */
- (void)ADCDN_RewardVideoAdDidLoad:(ADCDN_RewardVideoAdManager *)rewardVideoAd{
    NSLog(@"激励视频加载成功");
}
/**
 *  加载失败
 */
- (void)ADCDN_RewardVideoAd:(ADCDN_RewardVideoAdManager *)rewardVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"激励视频加载失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_RewardVideoAdDidClick:(ADCDN_RewardVideoAdManager *)rewardVideoAd{
    NSLog(@"激励视频点击");
}
/**
 *  曝光回调
 */
- (void)ADCDN_RewardVideoAdDidBecomeVisible:(ADCDN_RewardVideoAdManager *)rewardVideoAd{
    NSLog(@"激励视频曝光");
}
/**
 *  视频播放完成
 */
- (void)ADCDN_RewardVideoAdDidPlayFinish:(ADCDN_RewardVideoAdManager *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"视频播放完成");
}
/**
 * 播放完成点击关闭
 */
- (void)ADCDN_RewardVideoAdDidClose:(ADCDN_RewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"视频播放完成，点击关闭");
}
/**
 服务器核实回调成功
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidSucceed:(ADCDN_RewardVideoAdManager *)rewardedVideoAd verify:(BOOL)verify{
    NSLog(@"服务器核实回调成功");
    // 如果用户需要获取userId等信息
    NSString *userId = rewardedVideoAd.rewardVideoAdModel.userId;
    NSString *rewardName = rewardedVideoAd.rewardVideoAdModel.rewardName;
    NSLog(@"用户id:%@,奖品名:%@",userId,rewardName);
}

/**
 服务器核实回调失败
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidFail:(ADCDN_RewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"服务器核实回调失败");
}
```
### 4.3.3 注：服务器到服务器的回调(可选)
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
## 4.4 插屏广告，在需要使用到ADCDN广告功能的地方导入#import <ADCDN/ADCDN.h>
### 4.4.1 设置插屏广告示例代码
```
ADCDN_InterstitialAdManager *manager = [ADCDN_InterstitialAdManager shareManagerWithAppId:KappId plcId:KplcId];
manager.rootViewController = self;
manager.delegate = self;
[manager loadAd];
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
```
