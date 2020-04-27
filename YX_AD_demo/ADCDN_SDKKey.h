//
//  ADCDN_SDKKey.h
//  ADCDN_APP
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

#endif /* ADCDN_SDKKey_h */
