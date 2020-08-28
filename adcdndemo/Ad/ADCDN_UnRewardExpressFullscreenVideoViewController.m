//
//  ADCDN_UnRewardExpressFullscreenVideoViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/12/11.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_UnRewardExpressFullscreenVideoViewController.h"
#import <ADCDN/ADCDN.h>
@interface ADCDN_UnRewardExpressFullscreenVideoViewController ()<ADCDN_FullscreenExpressVideoAdManagerDelegate>

/* 非激励视频广告 */
@property (nonatomic,strong) ADCDN_FullscreenExpressVideoAdManager *fullscreenVideoAdManager;
/* 加载广告 */
@property (nonatomic,strong) UIButton *loadBtn;
/* 展示广告 */
@property (nonatomic,strong) UIButton *showBtn;
@end

@implementation ADCDN_UnRewardExpressFullscreenVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self baseSetupUI];
}
#pragma mark - 加载UI
-(void)baseSetupUI{
    [self loadBtn];
    [self showBtn];
    
}
#pragma mark - loadBtn
-(UIButton *)loadBtn{
    if (!_loadBtn) {
        _loadBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 120, ScreenW - 100, 40)];
        _loadBtn.tag = 1;
        [_loadBtn addTarget:self action:@selector(loadClicked:) forControlEvents:UIControlEventTouchUpInside];
        _loadBtn.layer.cornerRadius = 8;
        _loadBtn.layer.masksToBounds = YES;
        _loadBtn.backgroundColor = [UIColor redColor];
        [_loadBtn setTitle:@"加载广告" forState:0];
        [_loadBtn setTitleColor:[UIColor whiteColor] forState:0];
        [self.view addSubview:_loadBtn];
    }
    return _loadBtn;
}
#pragma mark - showBtn
-(UIButton *)showBtn{
    if (!_showBtn) {
        _showBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 180, ScreenW - 100, 40)];
        _showBtn.tag = 2;
        [_showBtn addTarget:self action:@selector(loadClicked:) forControlEvents:UIControlEventTouchUpInside];
        _showBtn.layer.cornerRadius = 8;
        _showBtn.layer.masksToBounds = YES;
        _showBtn.userInteractionEnabled = NO;
        _showBtn.backgroundColor = [UIColor grayColor];
        [_showBtn setTitle:@"展示广告" forState:0];
        [_showBtn setTitleColor:[UIColor whiteColor] forState:0];
        [self.view addSubview:_showBtn];
    }
    return _showBtn;
}
#pragma mark - 加载 tag = 1/ 展示 tag = 2
-(void)loadClicked:(UIButton *)button{
    if (button.tag == 1) {
        // 加载广告
        [self.fullscreenVideoAdManager loadAd];
        // 展示loading
        [self showLoading];
    }
    if (button.tag == 2) {
        if (self.fullscreenVideoAdManager) {
            // 展示广告
            [self.fullscreenVideoAdManager showAdFromRootViewController:self];
            
            self.showBtn.userInteractionEnabled = NO;
            [self.showBtn setBackgroundColor:[UIColor grayColor]];
        }
    }
}
#pragma mark - fullscreenVideoAdManager
-(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAdManager{
    if (!_fullscreenVideoAdManager) {
        _fullscreenVideoAdManager = [[ADCDN_FullscreenExpressVideoAdManager alloc] initWithPlcId:self.plcId];
        _fullscreenVideoAdManager.rootViewController = self;
        _fullscreenVideoAdManager.delegate = self;// fullscreenVideoAdManager需要strong持有，否则delegate回调无法执行，影响计费
    }
    return _fullscreenVideoAdManager;
}
#pragma mark - loadAd
-(void)loadAd{
    
    [self.fullscreenVideoAdManager showAdFromRootViewController:self];
}
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
    // 移除loading
    [self removeLoading];
}
/**
*   下载成功
*/
-(void)ADCDN_FullscreenVideoAdDidDownLoadVideo:(ADCDN_FullscreenExpressVideoAdManager *)fullscreenVideoAd{
    NSLog(@"下载成功");
    self.showBtn.userInteractionEnabled = YES;
    [self.showBtn setBackgroundColor:[UIColor redColor]];
    // 移除loading
    [self removeLoading];
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
@end
