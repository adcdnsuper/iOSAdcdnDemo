//
//  UIFont+ADCDN_APPFont.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/2.
//  Copyright © 2020 pst. All rights reserved.
//

#import "UIFont+ADCDN_APPFont.h"



@implementation UIFont (ADCDN_APPFont)
/**
 *  自定义字体
 */
+ (UIFont *)myCustomFont:(CGFloat)size {
    if (![UIFont fontWithName:@"PingFangSC-Regular" size:size]) {
        return [UIFont systemFontOfSize:size];
    }
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}
/**
 *  自定义字体 PingFangSC-Medium
 */
+ (UIFont *)myCustomMediumFont:(CGFloat)size{
    if (![UIFont fontWithName:@"PingFangSC-Medium" size:size]) {
        return [UIFont systemFontOfSize:size];
    }
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}
/**
 *  自定义字体 PingFangSC-Semibold
 */
+ (UIFont *)myCustomSemiboldFont:(CGFloat)size{
    if (![UIFont fontWithName:@"PingFangSC-Semibold" size:size]) {
        return [UIFont systemFontOfSize:size];
    }
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}
@end
