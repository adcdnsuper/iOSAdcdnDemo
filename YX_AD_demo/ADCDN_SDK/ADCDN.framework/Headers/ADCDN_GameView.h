//
//  ADCDN_GameView.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/12/9.
//  Copyright © 2019 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADCDN_GameModel.h"
#import "ADCDN_ShareModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ADCDN_GameView;

/**
 *  代理协议方法
 */
@protocol ADCDN_GameViewDelegate <NSObject>
/**
* 分享第三方app
*/
-(void)ADCDN_GameViewShareModel:(ADCDN_ShareModel *)model;
/**
* 去登录，跳转app登录页面
*/
-(void)ADCDN_GameViewGotoLogin;
@end

@interface ADCDN_GameView : UIView

/** 代理对象 */
@property (nonatomic, weak, nullable) id<ADCDN_GameViewDelegate>delegate;
/**
 * 初始化游戏视图
 */
-(instancetype)initWithGameViewFrame:(CGRect)frame;
/**
 * 加载数据/如果数据有更新需要再调用次方法，如用户由游客状态到登录状态，需传入uid等信息
 * test 默认是正式，如果test = YES，为开发状态
 */
-(void)loadGameViewModel:(ADCDN_GameModel *)model withIsTest:(BOOL)test;
/**
 * app分享成功主动调用
 */
-(void)successShare;
/**
 * 展示刮奖列表页原生广告(注：列表无数据会自动展示，5s后消失)
 */
-(void)showNativeAdView;
@end

NS_ASSUME_NONNULL_END
