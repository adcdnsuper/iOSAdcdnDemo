//
//  ADCDN_GameBoxManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/6/5.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ADCDN_GameBoxVCModel;

@interface ADCDN_GameBoxManager : NSObject

/**
 * 单例方法
 */
+(instancetype)defaultManager;

/**
*  @param url       桌面图标打开本app的回调的url
*  @param options   回调的参数
*  @return 是否处理   YES代表处理成功，NO代表不处理
*  快捷桌面打开方式
*/
-(BOOL)handleOpenURL:(NSURL *)url options:(NSDictionary*)options;
/**
*  @param url       桌面图标打开本app的回调的url
*  @param options   回调的参数
*  @return 是否处理   YES代表处理成功，NO代表不处理
*  @userId   第三方用户id
*  快捷桌面打开方式
*/
-(BOOL)handleOpenURL:(NSURL *)url options:(NSDictionary*)options userId:(NSString *)userId;
/**
 * @param model  打开游戏盒子需要的参数模型
 * 非快捷桌面进入游戏盒子
 */
-(void)openGameBoxWithModel:(ADCDN_GameBoxVCModel *)model;

@end

