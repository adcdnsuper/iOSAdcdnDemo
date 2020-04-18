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

/* userId */
@property (nonatomic,copy) NSString *userId;
/* 用户昵称 */
@property (nonatomic,copy) NSString *nickname;
/* 用户头像路径 */
@property (nonatomic,copy) NSString *avatar;
/* app是否存在用户体系 (必传) 默认 0 ，0:没有用户体系，1:有用户体系*/
@property (nonatomic,assign) NSInteger userSystem;
/* gameBoxView加载在app的一级页面还是二级页面 0:一级页面不存在导航栏；1:二级页面存在导航栏 （注：app如果该页面存在导航栏，需自行隐藏，gameBoxView负责提供导航栏功能）*/
@property (nonatomic,assign) NSInteger existNav;
/** 控制器 点击广告跳转详情需要（必传） */
@property (nonatomic, weak)UIViewController *rootViewController;

@end

NS_ASSUME_NONNULL_END
