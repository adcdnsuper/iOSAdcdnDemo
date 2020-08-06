//
//  UIView+ADCDN_APPView.h
//  adcdndemo
//
//  Created by 彭双塔 on 2020/8/6.
//  Copyright © 2020 pst. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ADCDN_APPView)
/**
 展示loading（默认灰色）
 */
- (void)adcdn_showLoading;

/**
 展示指定颜色的loading
 
 @param color loading的颜色
 */
- (void)adcdn_showLoadingWithColor:(UIColor *)color;

/**
 移除loading
 */
- (void)adcdn_removeLoading;
@end

NS_ASSUME_NONNULL_END
