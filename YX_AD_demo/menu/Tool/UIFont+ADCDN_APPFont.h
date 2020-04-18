//
//  UIFont+ADCDN_APPFont.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/2.
//  Copyright © 2020 pst. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (ADCDN_APPFont)
/**
 *  自定义字体
 */
+ (UIFont *)myCustomFont:(CGFloat)size;
/**
 *  自定义字体 PingFangSC-Medium
 */
+ (UIFont *)myCustomMediumFont:(CGFloat)size;
/**
 *  自定义字体 PingFangSC-Semibold
 */
+ (UIFont *)myCustomSemiboldFont:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
