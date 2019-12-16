//
//  ADCDN_GameModel.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/12/9.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_GameModel : NSObject
/* 应用id (必传) */
@property (nonatomic,copy) NSString *appId;

/* 游戏id (必传) */
@property (nonatomic,copy) NSString *gameId;

/* 原生模板 文字浮层 广告id (必传) */
@property (nonatomic,copy) NSString *textPlcId;

/* 原生模板 上文下浮层 广告id (必传) */
@property (nonatomic,copy) NSString *topTextPlcId;

/* 激励视频 竖屏 广告id (必传) */
@property (nonatomic,copy) NSString *rewardVideoPlcId;

/** 控制器 点击广告跳转详情需要（必传） */
@property (nonatomic, weak)UIViewController *rootViewController;


/* 用户id */
@property (nonatomic,copy,nullable) NSString *uuid;

/* 用户昵称 */
@property (nonatomic,copy,nullable) NSString *nickName;

/* 用户头像 urlString */
@property (nonatomic,copy,nullable) NSString *avatarUrl;


@end

NS_ASSUME_NONNULL_END
