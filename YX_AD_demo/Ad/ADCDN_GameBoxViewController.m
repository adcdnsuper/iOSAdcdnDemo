//
//  ADCDN_GameBoxViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/3/16.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_GameBoxViewController.h"
#import <ADCDN/ADCDN.h>
@interface ADCDN_GameBoxViewController ()<ADCDN_GameBoxViewDelegate>
/* 游戏大厅 */
@property (nonatomic,strong) ADCDN_GameBoxView *gameBoxView;
/* 游戏model */
@property (nonatomic,strong) ADCDN_GameBoxModel *gameModel;
@end

@implementation ADCDN_GameBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"游戏大厅";
    // 游戏盒子view
    [self gameBoxView];
    
}
#pragma mark - 页面可见，显示导航栏
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
#pragma mark - 页面消失隐藏导航栏
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark - 游戏盒子view
-(ADCDN_GameBoxView *)gameBoxView{
    if (!_gameBoxView) {
        _gameBoxView = [[ADCDN_GameBoxView alloc] initWithGameBoxViewFrame:self.view.bounds];// 注：如果gameBoxView添加的一级页面底部有tabbar，view的height要扣除掉tabbar的高度
        _gameBoxView.delegate = self;
        [self.view addSubview:_gameBoxView];
        [_gameBoxView loadGameViewModel:self.gameModel];
    }
    return _gameBoxView;
}
#pragma mark - 游戏model
-(ADCDN_GameBoxModel *)gameModel{
    if (!_gameModel) {
        _gameModel = [ADCDN_GameBoxModel new];
        _gameModel.userSystem = 1;// app是否有用户体系 1是
        _gameModel.existNav = 1;// 是否存在导航栏(或是否1级页面还是二级页面)，1：存在导航栏(2级页面)，0：不存在导航栏(1级页面)，app需自行隐藏和显示导航栏
        _gameModel.userId = @"";
        _gameModel.nickname = @"";
        _gameModel.avatar = @"";
        _gameModel.rootViewController = self;
    }
    return _gameModel;
}

-(void)dealloc{
    NSLog(@"释放了");
}
#pragma mark - ADCDN_GameBoxViewDelegate

/**
 *  当app有用户体系时，还未登录，去登录，跳转app登录页面
 */
-(void)ADCDN_GameBoxViewGotoLogin{
    NSLog(@"去登录");
    /**
     * 登录之后app需要通知更新model
     */
    _gameModel.userSystem = 1;// app是否有用户体系 1是
    _gameModel.existNav = 1;// 是否存在导航栏(或是否1级页面还是二级页面)，1：存在导航栏(2级页面)，0：不存在导航栏(1级页面)，app需自行隐藏和显示导航栏
    _gameModel.userId = @"123456";
    _gameModel.nickname = @"我的昵称";
    _gameModel.avatar = @"https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2131257963,3457119996&fm=58";
    _gameModel.rootViewController = self;
    [self.gameBoxView loadGameViewModel:self.gameModel];
}
/**
 *  当游戏盒子处在app的二级页面，需要返回上一个页面时，导航栏的返回事件
 */
-(void)ADCDN_gameBoxViewNavBack{
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"返回");
}
@end
