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
@end

@implementation ADCDN_GameBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    // 游戏盒子view
    [self gameBoxView];
    
}
#pragma mark - 游戏盒子view
-(ADCDN_GameBoxView *)gameBoxView{
    if (!_gameBoxView) {
        _gameBoxView = [[ADCDN_GameBoxView alloc] initWithGameBoxViewFrame:self.view.bounds];// 注：如果gameBoxView添加的一级页面底部有tabbar，view的height要扣除掉tabbar的高度
        _gameBoxView.delegate = self;
        [self.view addSubview:_gameBoxView];
        ADCDN_GameBoxModel *gameModel = [ADCDN_GameBoxModel new];
        gameModel.showBackBtn = YES;
        gameModel.showImmersive = YES;
        gameModel.rootViewController = self;
        [_gameBoxView loadGameViewModel:gameModel];
    }
    return _gameBoxView;
}

-(void)dealloc{
    NSLog(@"释放了");
}
#pragma mark - ADCDN_GameBoxViewDelegate
/**
 *  退出游戏盒子
 */
-(void)ADCDN_gameBoxViewBack{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
