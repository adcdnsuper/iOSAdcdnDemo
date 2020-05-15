//
//  ADCDN_GameBoxView.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/3/12.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_BaseView.h"


@class ADCDN_GameBoxModel;
@class ADCDN_GameBoxView;

@protocol ADCDN_GameBoxViewDelegate <NSObject>
/**
 *  当游戏盒子处在app的二级页面，需要返回上一个页面时，导航栏的返回事件
 */
-(void)ADCDN_gameBoxViewBack;

@end

NS_ASSUME_NONNULL_BEGIN
@interface ADCDN_GameBoxView : ADCDN_BaseView
/** 代理对象 */
@property (nonatomic, weak, nullable) id<ADCDN_GameBoxViewDelegate>delegate;
/**
 * 初始化游戏视图
 */
-(instancetype)initWithGameBoxViewFrame:(CGRect)frame;
/**
 * model 数据模型
 */
-(void)loadGameViewModel:(ADCDN_GameBoxModel *)model;

@end

NS_ASSUME_NONNULL_END

