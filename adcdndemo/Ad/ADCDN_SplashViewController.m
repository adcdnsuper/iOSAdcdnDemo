//
//  ADCDN_SplashViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/9.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_SplashViewController.h"
#import <ADCDN/ADCDN.h>

@interface ADCDN_SplashViewController ()<ADCDN_SplashAdManagerViewDelegate>
/* 开屏广告对象 */
@property (nonatomic,strong) ADCDN_SplashAdManagerView *splashAdView;
@end

@implementation ADCDN_SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"开屏广告";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadSplashAd)];
    self.navigationItem.rightBarButtonItem = button;
    
}
-(void)dealloc{
    NSLog(@"释放了");
}
#pragma mark - 加载开屏广告
-(void)loadSplashAd{
   // 初始化开屏广告
   CGRect frame = [UIScreen mainScreen].bounds;
   self.splashAdView = [[ADCDN_SplashAdManagerView alloc] initWithFrame:frame plcId:KplcId_Splash];
   self.splashAdView.backgroundColor = [UIColor whiteColor];
   UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
   self.splashAdView.window = keyWindow;
   self.splashAdView.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
   [keyWindow.rootViewController.view addSubview:self.splashAdView];
   self.splashAdView.rootViewController = keyWindow.rootViewController;
   
   //防止白屏，给一个兜底图，开发者可以设置一个跟启动图一样的
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
   
   //设置开屏底部自定义LogoView，展示半屏开屏广告
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
/**
 *  开屏广告成功展示
 */
- (void)ADCDN_SplashAdSuccessPresentScreen:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告成功展示");
}
/**
 *  开屏广告展示失败
 */
- (void)ADCDN_SplashAdFailToPresent:(ADCDN_SplashAdManagerView *_Nullable)splashAd withError:(NSError *_Nullable)error {
    NSLog(@"%s---%@ error:%@",__FUNCTION__,@"开屏广告展示失败",error);
    // 移除开屏视图
    if (self.splashAdView) {
        [self.splashAdView removeFromSuperview];
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
}
/**
 *  开屏广告将要关闭回调
 */
- (void)ADCDN_SplashAdWillClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd{
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告将要关闭回调");
    // 移除开屏视图
    if (self.splashAdView) {
        [self.splashAdView removeFromSuperview];
    }
}
/**
 *  开屏详情页关闭回调
 */
- (void)ADCDN_SplashAdDetailClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd{
    NSLog(@"%s---%@",__FUNCTION__,@"开屏详情页关闭回调");
}
@end
