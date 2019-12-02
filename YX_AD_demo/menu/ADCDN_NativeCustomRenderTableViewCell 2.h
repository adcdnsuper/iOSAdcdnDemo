//
//  ADCDN_NativeCustomRenderTableViewCell.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/11/27.
//  Copyright © 2019 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ADCDN/ADCDN.h>
NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_NativeCustomRenderTableViewCell : UITableViewCell
/* model */
@property (nonatomic,strong) ADCDN_NativeCustomRenderModel *model;
/** 返回高度 */
+(CGFloat)cellHeight:(ADCDN_NativeCustomRenderModel *)model;

@end

NS_ASSUME_NONNULL_END
