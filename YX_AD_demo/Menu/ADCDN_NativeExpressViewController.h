//
//  ADCDN_NativeExpressViewController.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/17.
//  Copyright © 2019 pst. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_NativeExpressViewController : UIViewController
/** plcId 广告位Id */
@property (nonatomic,copy) NSString *plcId;
/** adView 建议的尺寸 */
@property (nonatomic,assign) CGSize adSize;
@end

NS_ASSUME_NONNULL_END
