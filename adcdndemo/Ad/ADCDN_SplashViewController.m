//
//  ADCDN_SplashViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/9.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_SplashViewController.h"
#import "UIFont+ADCDN_APPFont.h"
#import <ADCDN/ADCDN.h>

@interface ADCDN_SplashViewController ()<ADCDN_SplashAdManagerViewDelegate>
/* 开屏广告 */
@property (nonatomic,strong) ADCDN_SplashAdManagerView *splashAdView;
@end

@implementation ADCDN_SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"开屏广告";
    [self loadAdBtnItem];
    
}
-(void)dealloc{
    NSLog(@"释放了");
}
#pragma mark - splashAdView
-(ADCDN_SplashAdManagerView *)splashAdView{
    if (!_splashAdView) {
        // 初始化开屏广告
        CGRect frame = [UIScreen mainScreen].bounds;
        _splashAdView = [[ADCDN_SplashAdManagerView alloc] initWithFrame:frame plcId:KplcId_Splash];
        _splashAdView.backgroundColor = [UIColor whiteColor];
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        _splashAdView.window = keyWindow;
        _splashAdView.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
        [keyWindow.rootViewController.view addSubview:_splashAdView];
        _splashAdView.rootViewController = keyWindow.rootViewController;
        
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
        _splashAdView.bottomView = bottomView;
        
        //设置开屏底部自定义LogoView，展示半屏开屏广告
        UIView *logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.width * 0.25)];
        UIImageView *logo = [[UIImageView alloc]initWithFrame:logoView.frame];
        CGRect logoFrame = logo.frame;
        logoFrame.size.width = 123;
        logoFrame.size.height = 30;
        logo.frame = logoFrame;
        logo.image = [UIImage imageNamed:@"splash_logo"];
        [logoView addSubview:logo];
        logo.center = logoView.center;
        logoView.backgroundColor = [UIColor whiteColor];
        _splashAdView.logoView = logoView;
    }
    return _splashAdView;
}
#pragma mark - 加载开屏
-(void)loadAd{
    [self.splashAdView loadSplashAd];
    // 展示loading
    [self showLoading];
}
#pragma mark - ADCDN_SplashAdManagerViewDelegate代理
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
    // 移除loading
    [self removeLoading];
    NSLog(@"%s---%@ error:%@",__FUNCTION__,@"开屏广告展示失败",error);
    if (self.splashAdView) {
        [self.splashAdView removeFromSuperview];
        self.splashAdView = nil;
    }
}
/**
 *  开屏广告曝光回调
 */
- (void)ADCDN_SplashAdExposured:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    // 移除loading
    [self removeLoading];
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
    if (self.splashAdView) {
        [self.splashAdView removeFromSuperview];
        self.splashAdView = nil;
    }
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告关闭回调");
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
@end
