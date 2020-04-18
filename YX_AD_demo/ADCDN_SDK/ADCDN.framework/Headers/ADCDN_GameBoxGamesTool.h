//
//  ADCDN_GameBoxGamesTool.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/3/27.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ADCDN_GameBoxModel;
@class ADCDN_GameBoxGamesModel;
typedef void (^ADCDN_GameBoxBlock)(NSMutableArray<ADCDN_GameBoxGamesModel *> *modelArr);

@interface ADCDN_GameBoxGamesTool : NSObject
/**
 * 获取热门/最近在玩游戏列表
 */
-(void)getWithModel:(ADCDN_GameBoxModel *)model gameBoxBlock:(ADCDN_GameBoxBlock)gameBoxBlock;

/**
 * 点击某个游戏
 */
-(void)didGameWithModel:(ADCDN_GameBoxGamesModel *)model withViewController:(UIViewController *)viewController;

/**
 * 获取游戏开关 1 开启 否则关闭
 */
-(NSString *)getScenesSwitch;
@end


