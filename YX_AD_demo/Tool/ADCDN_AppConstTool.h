//
//  ADCDN_AppConstTool.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/24.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
* 广告位id
*/
/** appId */
UIKIT_EXTERN NSString * const KappId;
/** 开屏广告 */
UIKIT_EXTERN NSString * const KplcId_Splash;
/** 横幅广告 */
UIKIT_EXTERN NSString * const KplcId_Banner;
/** 插屏广告 */
UIKIT_EXTERN NSString * const KplcId_Interstitial;
/** 模版非激励视频 - 竖屏 */
UIKIT_EXTERN NSString * const KplcId_ExpressVideoVertical;
/** 模版激励视频 - 横屏 */
UIKIT_EXTERN NSString * const KplcId_ExpressRewardVideoHorizon;
/** 模版激励视频 - 竖屏 */
UIKIT_EXTERN NSString * const KplcId_ExpressRewardVideoVertical;
/** 模版非激励视频 - 横屏 */
UIKIT_EXTERN NSString * const KplcId_ExpressVideoHorizon;
/** 原生广告 - 三小图 */
UIKIT_EXTERN NSString * const KplcId_ThreeSmallImg;
/** 原生广告 - 左图右文 */
UIKIT_EXTERN NSString * const KplcId_LeftImg;
/** 原生广告 - 左文右图 */
UIKIT_EXTERN NSString * const KplcId_RightImg;
/** 原生广告 - 文字浮层 */
UIKIT_EXTERN NSString * const KplcId_Text;
/** 原生广告 - 上图下文 */
UIKIT_EXTERN NSString * const KplcId_TopImg;
/** 原生广告 - 上文下浮层 */
UIKIT_EXTERN NSString * const KplcId_TopText;

@interface ADCDN_AppConstTool : NSObject

@end

