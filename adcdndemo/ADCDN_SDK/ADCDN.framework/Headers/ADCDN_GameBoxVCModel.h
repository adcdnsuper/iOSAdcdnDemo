//
//  ADCDN_GameBoxVCModel.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/6/2.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ADCDN_GameBoxVCModel : NSObject
/* 必传 app的标识urlScheme，添加快捷桌面图标使用（在工程 - info - URL Types中填写） */
@property (nonatomic,copy) NSString *urlScheme;
/* 必传 presentViewController游戏盒子的控制器 */
@property (nonatomic, weak)UIViewController *rootViewController;

@end

