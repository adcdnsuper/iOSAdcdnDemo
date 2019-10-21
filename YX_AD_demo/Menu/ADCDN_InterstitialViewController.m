//
//  ADCDN_InterstitialViewController.m
//  YX_AD_demo
//
//  Created by 彭双塔 on 2019/10/16.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_InterstitialViewController.h"
#import <ADCDN/ADCDN.h>
#define KappId @"1030013"
#define KplcId @"1010101"
@interface ADCDN_InterstitialViewController ()<ADCDN_InterstitialAdManagerDelegate>

@end

@implementation ADCDN_InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"插屏广告";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;
}
#pragma mark - loadAd
-(void)loadAd{
    ADCDN_InterstitialAdManager *manager = [ADCDN_InterstitialAdManager shareManagerWithAppId:KappId plcId:KplcId];
    manager.rootViewController = self;
    manager.delegate = self;
    [manager loadAd];
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

@end
