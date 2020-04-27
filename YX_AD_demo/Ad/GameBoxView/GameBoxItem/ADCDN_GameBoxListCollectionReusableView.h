//
//  ADCDN_GameBoxListCollectionReusableView.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/2.
//  Copyright © 2020 pst. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^DidBtnBlock)(void);
NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_GameBoxListCollectionReusableView : UICollectionReusableView

/* 查看更多 */
@property (nonatomic,copy) DidBtnBlock didBtnBlock;
@end

NS_ASSUME_NONNULL_END
