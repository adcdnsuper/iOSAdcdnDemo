//
//  ADCDN_DebugLogTool.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/4/13.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ADCDN_DebugLogTool : NSObject
// 设置日志输出状态 YES开启，NO不开启
+ (void)setLogEnable:(BOOL)enable;

// 获取日志输出状态 默认NO，不开启
+ (BOOL)getLogEnable;
@end

