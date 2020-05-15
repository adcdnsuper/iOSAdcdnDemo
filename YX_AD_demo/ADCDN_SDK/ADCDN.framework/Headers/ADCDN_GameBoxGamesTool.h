//
//  ADCDN_GameBoxGamesTool.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/3/27.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ADCDN_GameBoxGamesTool : NSObject
/**
 *  提供单例类方法
 */
+(instancetype)shareManager;
/**
 * 获取游戏开关 1 开启 否则关闭
 */
-(NSString *)getScenesSwitch;
@end


