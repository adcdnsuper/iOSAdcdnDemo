//
//  ADCDN_GameViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/12/9.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_GameViewController.h"
#import <ADCDN/ADCDN.h>
@interface ADCDN_GameViewController ()<ADCDN_GameViewDelegate>
/* 游戏view */
@property (nonatomic,strong) ADCDN_GameView *gameView;

@end

@implementation ADCDN_GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self gameView];
}

#pragma mark - 游戏视图
-(ADCDN_GameView *)gameView{
    if (!_gameView) {
        ADCDN_GameModel *model = [ADCDN_GameModel new];
        model.appId = KappId;// 应用id（注：与广告的appid相同）
        model.gameId = KGame_GameId;// 游戏id
        model.textPlcId = KplcId_Text;// 原生广告-文字浮层
        model.topTextPlcId = KplcId_TopText;// 原生广告-上文下图
        model.rewardVideoPlcId = KplcId_ExpressRewardVideoVertical;// 模版激励视频
        model.rootViewController = self;
        model.uuid = @"";// 用户id，不传入为游客模式
        model.nickName = @"";// 用户昵称
        model.avatarUrl = @"";// 用户头像地址urlString
        _gameView = [[ADCDN_GameView alloc] initWithGameViewFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
        [_gameView loadGameViewModel:model withIsTest:YES];
        _gameView.delegate = self;//需要strong持有，否则delegate回调无法执行，影响计费
        [self.view addSubview:_gameView];
    }
    return _gameView;
}
/**
 * ADCDN_GameViewDelegate
 */
#pragma mark - 分享第三方app/邀请好友
-(void)ADCDN_GameViewShareModel:(ADCDN_ShareModel *)model{
    NSLog(@"分享第三方app/邀请好友");
}
#pragma mark - 去登录，跳转app登录页面
-(void)ADCDN_GameViewGotoLogin{
    NSLog(@"跳装到app登录页");
}

@end
