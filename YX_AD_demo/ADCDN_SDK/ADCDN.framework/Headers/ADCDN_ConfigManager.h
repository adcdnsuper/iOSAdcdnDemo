//
//  ADCDN_ConfigManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/9/27.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  问题：是否需要提供初始化AppID错误的返回错误码
 */

@interface ADCDN_ConfigManager : NSObject
/**
 *  提供一个单例类方法 初始化SDK设置AppID
 */
+(instancetype)shareManagerWithAppID:(NSString *)appId;
/**
 *  获取SDK版本号
 */
-(NSString *)getSDKVersion;
/**
 *  获取SDK的AppID
 */
+ (NSString *)getAppId;
@end

