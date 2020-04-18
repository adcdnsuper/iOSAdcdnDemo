//
//  ADCDN_GameBoxListSecondCollectionViewCell.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/2.
//  Copyright © 2020 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 点击行 */
typedef void(^DidCellBlock)(NSIndexPath *indexPath);
/** 更多游戏 */
typedef void(^DidMoreGameBlock)(void);


@class ADCDN_GameBoxGamesModel;

@interface ADCDN_GameBoxListSecondCollectionViewCell : UICollectionViewCell
/* 数据模型 */
@property (nonatomic,strong) NSMutableArray *gameModerArr;

@property (nonatomic,copy) DidCellBlock didCellBlock;
@property (nonatomic,copy) DidMoreGameBlock didMoreGameBlock;
@end


