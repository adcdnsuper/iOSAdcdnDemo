//
//  ADCDN_BaseViewController.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/8/17.
//  Copyright © 2020 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+ADCDN_APPView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_BaseViewController : UIViewController
/* 加载广告 */
@property (nonatomic,strong) UIBarButtonItem *loadAdBtnItem;
#pragma mark - 展示loading
-(void)showLoading;
#pragma mark - 移除loading
-(void)removeLoading;
#pragma mark - 加载广告
-(void)loadAd;
@end

NS_ASSUME_NONNULL_END
