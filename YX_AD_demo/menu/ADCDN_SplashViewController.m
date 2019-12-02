//
//  ADCDN_SplashViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/9.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_SplashViewController.h"
#import <ADCDN/ADCDN.h>

@interface ADCDN_SplashViewController ()<ADCDN_SplashAdManagerDelegate>
/* 开屏广告 */
@property (nonatomic,strong) ADCDN_SplashAdManager *manage;
@end

@implementation ADCDN_SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"开屏广告";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
    
}
-(void)dealloc{
    NSLog(@"释放了");
}
#pragma mark - loadAd
-(void)loadAd{
    CGRect frame = [UIScreen mainScreen].bounds;
    self.manage = [[ADCDN_SplashAdManager alloc] initWithPlcId:KplcId_Splash];
    self.manage.wFrame = frame;
    self.manage.window = [UIApplication sharedApplication].keyWindow;
    self.manage.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
    [self.manage loadSplashAd];
}
/**
 *  ADCDN_SplashAdManagerDelegate 代理协议方法
 */
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
@end
