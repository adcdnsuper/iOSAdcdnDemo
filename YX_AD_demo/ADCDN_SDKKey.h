//
//  ADCDN_SDKKey.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/11/22.
//  Copyright © 2019 pst. All rights reserved.
//

#ifndef ADCDN_SDKKey_h
#define ADCDN_SDKKey_h

/** appid */
#define KappId @"600001"

/**
 * 广告位置id
 */
/** 开屏广告 */
#define KplcId_Splash @"2000006"
/** 横幅广告 */
#define KplcId_Banner @"2000017"
/** 插屏广告 */
#define KplcId_Interstitial @"2000014"
/** 模版激励视频 - 竖屏 */
#define KplcId_ExpressRewardVideoVertical @"2000010"
/** 模版非激励视频 - 竖屏 */
#define KplcId_ExpressVideoVertical @"2000010"
/** 原生广告 - 上文下浮层 */
#define KplcId_TopText @"2000012"





/** 原生广告 - 三小图 */
#define KplcId_ThreeSmallImg @"1010144"
/** 原生广告 - 纯图 */
#define KplcId_Img @"1010163"
/** 原生广告 - 左图右文 */
#define KplcId_LeftImg @"1010142"
/** 原生广告 - 左文右图 */
#define KplcId_RightImg @"1010143"
/** 原生广告 - 文字浮层 */
#define KplcId_Text @"1010140"
/** 原生广告 - 上图下文 */
#define KplcId_TopImg @"1010145"


/** 非激励视频 - 横屏 */
#define KplcId_VideoHorizon @"1010167"
/** 非激励视频 - 竖屏 */
#define KplcId_VideoVertical @"1010168"

/** 激励视频 - 横屏 */
#define KplcId_RewardVideoHorizon @"1010171"
/** 激励视频 - 竖屏 */
#define KplcId_RewardVideoVertical @"1010101"

/** 原生自渲染广告 - 大图 */
#define KplcId_RenderBigImg @"1010207"
/** 原生自渲染广告 - 组图 */
#define KplcId_RenderGroupImg @"1010212"
/** 原生自渲染广告 - 单图 */
#define KplcId_RenderSingleImg @"1010209"
/** 原生自渲染广告 - 视频 */
#define KplcId_RenderVideo @"1010211"

/** 模版非激励视频 - 横屏 */
#define KplcId_ExpressVideoHorizon @"1010461"
/** 模版非激励视频 - 竖屏 */
#define KplcId_ExpressVideoVertical @"1010462"

/** 模版激励视频 - 横屏 */
#define KplcId_ExpressRewardVideoHorizon @"1010458"
/** 模版激励视频 - 竖屏 */
#define KplcId_ExpressRewardVideoVertical @"1010457"

/**
 *  游戏sdk模块
 */
/** 游戏id */
#define KGame_GameId @"10001"

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
