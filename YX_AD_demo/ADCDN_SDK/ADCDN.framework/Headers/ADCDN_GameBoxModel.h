//
//  ADCDN_GameBoxModel.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/3/12.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_GameBoxModel : NSObject
/* 是否显示返回按钮，一级页面不显示传NO，二级页面显示：传：YES */
@property (nonatomic,assign) BOOL showBackBtn;
/** 控制器 点击广告跳转详情需要（必传） */
@property (nonatomic, weak)UIViewController *rootViewController;
/* 页面是要覆盖到时间栏 沉浸式：YES，页面不穿透到时间栏：NO*/
@property (nonatomic,assign) BOOL showImmersive;

@end

NS_ASSUME_NONNULL_END
