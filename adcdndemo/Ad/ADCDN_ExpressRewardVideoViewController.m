//
//  ADCDN_ExpressRewardVideoViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/12/11.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_ExpressRewardVideoViewController.h"
#import <ADCDN/ADCDN.h>
@interface ADCDN_ExpressRewardVideoViewController ()<ADCDN_ExpressRewardVideoAdManagerDelegate>
/* 模版激励视频广告 */
@property (nonatomic,strong)ADCDN_ExpressRewardVideoAdManager  *rewardVideoAdManager;
/* 加载广告 */
@property (nonatomic,strong) UIButton *loadBtn;
/* 展示广告 */
@property (nonatomic,strong) UIButton *showBtn;
@end

@implementation ADCDN_ExpressRewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
        [self.rewardVideoAdManager loadAd];
        // 展示loading
        [self showLoading];
    }
    if (button.tag == 2) {
        if (self.rewardVideoAdManager) {
            // 展示广告
            [self.rewardVideoAdManager showAdFromRootViewController:self];
            
            self.showBtn.userInteractionEnabled = NO;
            [self.showBtn setBackgroundColor:[UIColor grayColor]];
        }
    }
}
#pragma mark - rewardVideoAdManager
-(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAdManager{
    if (!_rewardVideoAdManager) {
        _rewardVideoAdManager = [[ADCDN_ExpressRewardVideoAdManager alloc] initWithPlcId:self.plcId];
        //需要 服务器到服务器回调的，请传入rewardVideoAdModel数据模型
//        ADCDN_RewardVideoAdModel *rewardVideoAdModel = [ADCDN_RewardVideoAdModel new];
//        rewardVideoAdModel.userId = @"123456789";
//        rewardVideoAdModel.rewardName = @"rewardName";
//        rewardVideoAdModel.rewardAmount = 1;
//        rewardVideoAdModel.extra = @"extra";
//        self.rewardVideoAdManager.rewardVideoAdModel = rewardVideoAdModel;
        _rewardVideoAdManager.rootViewController = self;// rewardVideoAdManager需要strong持有，否则delegate回调无法执行，影响计费
        _rewardVideoAdManager.delegate = self;
    }
    return _rewardVideoAdManager;
}
#pragma mark - loadAd
-(void)loadAd{
    [self.rewardVideoAdManager loadAd];
}
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
    // 移除loading
    [self removeLoading];
}
-(void)ADCDN_RewardVideoAdDidDownLoadVideo:(ADCDN_ExpressRewardVideoAdManager *)rewardVideoAd{
    NSLog(@"下载成功");
    self.showBtn.userInteractionEnabled = YES;
    [self.showBtn setBackgroundColor:[UIColor redColor]];
    // 移除loading
    [self removeLoading];
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
 服务器核实回调成功
 Server verification which is requested asynchronously is succeeded.
 @param verify :return YES when return value is 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidSucceed:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd verify:(BOOL)verify{
    NSLog(@"服务器核实回调成功");
}

/**
 服务器核实回调失败
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
 */
- (void)ADCDN_RewardVideoAdServerRewardDidFail:(ADCDN_ExpressRewardVideoAdManager *)rewardedVideoAd{
    NSLog(@"服务器核实回调失败");
}
@end
