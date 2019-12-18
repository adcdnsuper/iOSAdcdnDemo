//
//  GDTSDKDefines.h
//  GDTMobApp
//
//  Created by royqpwang on 2017/11/6.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

#if defined(__has_attribute)
#if __has_attribute(deprecated)
#define GDT_DEPRECATED_MSG_ATTRIBUTE(s) __attribute__((deprecated(s)))
#define GDT_DEPRECATED_ATTRIBUTE __attribute__((deprecated))
#else
#define GDT_DEPRECATED_MSG_ATTRIBUTE(s)
#define GDT_DEPRECATED_ATTRIBUTE
#endif
#else
#define GDT_DEPRECATED_MSG_ATTRIBUTE(s)
#define GDT_DEPRECATED_ATTRIBUTE
#endif

#define GDTScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define GDTScreenWidth  ([UIScreen mainScreen].bounds.size.width)

/**
 *  视频播放器状态
 *
 *  播放器只可能处于以下状态中的一种
 *
 */
typedef NS_ENUM(NSUInteger, GDTMediaPlayerStatus) {
    GDTMediaPlayerStatusInitial = 0,         // 初始状态
    GDTMediaPlayerStatusLoading = 1,         // 加载中
    GDTMediaPlayerStatusStarted = 2,         // 开始播放
    GDTMediaPlayerStatusPaused = 3,          // 用户行为导致暂停
    GDTMediaPlayerStatusStoped = 4,          // 播放停止
    GDTMediaPlayerStatusError = 5,           // 播放出错
};

typedef enum GDTSDKLoginType {
    GDTSDKLoginTypeUnknow = 0,
    GDTSDKLoginTypeWeiXin = 1,    //微信账号
    GDTSDKLoginTypeQQ = 2,        //QQ账号
} GDTSDKLoginType;

typedef NS_ENUM(NSUInteger, GDTVideoPlayPolicy) {
    GDTVideoPlayPolicyUnknow = 0, // 默认值，未设置
    GDTVideoPlayPolicyAuto = 1,   // 用户角度看起来是自动播放
    GDTVideoPlayPolicyManual = 2  // 用户角度看起来是手动播放或点击后播放
};

typedef NS_ENUM(NSUInteger, GDTVideoRenderType) {
    GDTVideoRenderTypeUnknow = 0,
    GDTVideoRenderTypeSDK = 1,
    GDTVideoRenderTypeDeveloper = 2
};

static inline BOOL isIPhoneXSeries() {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            return YES;
        }
    }
    return NO;
}
