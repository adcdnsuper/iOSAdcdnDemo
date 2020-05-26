//
//  ADCDN_BaseView.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/3/12.
//  Copyright © 2020 pst. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_BaseView : UIView
/**
 *  代码创建view
 */
+ (instancetype)loadCode:(CGRect)frame;
/**
 *  初始化UI，父类定义，子类重写
 */
- (void)initUI;
@end

NS_ASSUME_NONNULL_END
