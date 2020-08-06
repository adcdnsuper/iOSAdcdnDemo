//
//  UIView+ADCDN_APPView.m
//  adcdndemo
//
//  Created by 彭双塔 on 2020/8/6.
//  Copyright © 2020 pst. All rights reserved.
//

#import "UIView+ADCDN_APPView.h"
#import <objc/runtime.h>

static char ADCDN_ACTIVITY_INDICATOR_KEY;

@implementation UIView (ADCDN_APPView)


- (UIActivityIndicatorView *)adcdn_loadingView {
    return objc_getAssociatedObject(self, &ADCDN_ACTIVITY_INDICATOR_KEY);
}

- (void)setAdcdn_loadingView:(UIActivityIndicatorView *)adcdn_loadingView {
    objc_setAssociatedObject(self, &ADCDN_ACTIVITY_INDICATOR_KEY, adcdn_loadingView, OBJC_ASSOCIATION_RETAIN);
}
/**
 展示loading（默认灰色）
 */
- (void)adcdn_showLoading {
    // 默认展示灰色loading
    [self adcdn_showLoadingWithColor:[UIColor grayColor]];
}

/**
 展示指定颜色的loading

 @param color loading的颜色
 */
- (void)adcdn_showLoadingWithColor:(UIColor *)color {
    if (self.adcdn_loadingView) {
        [self.adcdn_loadingView removeFromSuperview];
        self.adcdn_loadingView = nil;
    }
    self.adcdn_loadingView = [[UIActivityIndicatorView alloc] initWithFrame:self.bounds];
    [self.adcdn_loadingView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self addSubview:self.adcdn_loadingView];
    self.adcdn_loadingView.color = color;
    [self.adcdn_loadingView startAnimating];
    self.adcdn_loadingView.userInteractionEnabled = NO;
}

/**
 移除loading
 */
- (void)adcdn_removeLoading {
    
    if (self.adcdn_loadingView) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.adcdn_loadingView removeFromSuperview];
            weakSelf.adcdn_loadingView = nil;
        });
        
    }
}
@end
