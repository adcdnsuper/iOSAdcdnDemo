//
//  ADCDN_ConfigManager.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/9/27.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADCDN_ConfigManager : NSObject

/**
 *  提供单例类方法
 *  详解：appId - 媒体 ID
 */
+(instancetype _Nullable)shareManagerWithAppId:(NSString *_Nullable)appId;

/**
 *  获取ADCDN的版本
 */
-(NSString *_Nullable)getSDKVersion;



@end

