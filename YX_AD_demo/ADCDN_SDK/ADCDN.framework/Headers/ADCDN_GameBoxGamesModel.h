//
//  ADCDN_GameBoxGamesModel.h
//  ADCDN
//
//  Created by 彭双塔 on 2020/3/27.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_GameBoxGamesModel : NSObject
/* 游戏链接 */
@property (nonatomic,copy) NSString *gameLink;
/* logo */
@property (nonatomic,copy) NSString *logo;
/* name */
@property (nonatomic,copy) NSString *name;
/* 描述 */
@property (nonatomic,copy) NSString *descGame;
/* 游戏id */
@property (nonatomic,copy) NSString *gameId;

@end

NS_ASSUME_NONNULL_END
