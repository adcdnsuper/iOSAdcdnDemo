//
//  ADCDN_InterstitialViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/15.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_InterstitialViewController.h"
#import <ADCDN/ADCDN.h>

@interface ADCDN_InterstitialViewController ()<ADCDN_InterstitialAdManagerDelegate>
/* 插屏广告 */
@property (nonatomic,strong) ADCDN_InterstitialAdManager *manager;
@end

@implementation ADCDN_InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"插屏广告";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
}
-(void)dealloc{
    NSLog(@"释放了");
}
#pragma mark - loadAd
-(void)loadAd{
    self.manager = [[ADCDN_InterstitialAdManager alloc] initWithPlcId:KplcId_Interstitial];
    self.manager.rootViewController = self;
    self.manager.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
    [self.manager loadAd];
}
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
@end
