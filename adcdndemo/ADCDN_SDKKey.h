//
//  APP_SDKKey.h
//  APP_APP
//
//  Created by 彭双塔 on 2019/11/22.
//  Copyright © 2019 pst. All rights reserved.
//

#ifndef ADCDN_SDKKey_h
#define ADCDN_SDKKey_h

/** 屏幕宽高 */
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

/**
 *  比例宽高
 */
#define K_Width(f) (f / 750.0 * ScreenW)
#define K_Height(f) (f / 1334.0 * (ScreenW / 750.0 * 1334.0))

/** 颜色设置 - 十六进制*/
#define K_HexColor(hexValue)                                                   \
[UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0         \
green:((float)((hexValue & 0xFF00) >> 8)) / 255.0            \
blue:((float)((hexValue & 0xFF))) / 255.0                   \
alpha:1.0f]


/** 是否是iPhoneX系列以上的手机 */
#define APP_isBariPhoneX ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? YES : NO)
/** 状态栏高度 */
#define APP_StatusBarHeight ((APP_isBariPhoneX) ? 44.f : 20.f)
/** iphoneX底部安全区 */
#define APP_SafeAreaBottomHeight (APP_isBariPhoneX ? 34 : 0)
/** tabbar高度 */
#define APP_TabbarHeight    (49.f + APP_SafeAreaBottomHeight)
/** 导航栏高度 */
#define APP_NavigationBarHeight (44.f + APP_StatusBarHeight)

#endif /* APP_SDKKey_h */
