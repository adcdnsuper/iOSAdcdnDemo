//
//  ADCDN_VideoViewController.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/18.
//  Copyright © 2019 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADCDN_BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_VideoViewController : ADCDN_BaseViewController
/* type = 1 视频广告；type = 2 模版视频广告 */
@property (nonatomic,assign) NSInteger type;

@end

NS_ASSUME_NONNULL_END
