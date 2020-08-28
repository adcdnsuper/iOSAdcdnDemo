//
//  ADCDN_NativeExpressViewController.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/17.
//  Copyright © 2019 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADCDN_BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_NativeExpressViewController : ADCDN_BaseViewController
/** plcId 广告位Id */
@property (nonatomic,copy) NSString *plcId;
/** adView建议的尺寸*/
@property (nonatomic,assign) CGSize adSize;
@end

NS_ASSUME_NONNULL_END
