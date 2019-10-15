//
//  ADCDN_MaterialMeta.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/10.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADCDN_Image.h"
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ADCDN_FeedADMode) {
    ADCDN_FeedADModeSmallImage = 2,
    ADCDN_FeedADModeLargeImage = 3,
    ADCDN_FeedADModeGroupImage = 4,
    ADCDN_FeedVideoAdModeImage = 5, // video ad || rewarded video ad horizontal screen
    ADCDN_FeedVideoAdModePortrait = 15, // rewarded video ad vertical screen
    ADCDN_FeedADModeImagePortrait = 16
};

@interface ADCDN_MaterialMeta : NSObject
/// material pictures.
@property (nonatomic, strong) NSArray<ADCDN_Image *> *imageAry;

/// ad headline.
@property (nonatomic, copy) NSString *AdTitle;

/// ad description.
@property (nonatomic, copy) NSString *AdDescription;

/// display format of the in-feed ad, other ads ignores it.
@property (nonatomic, assign) ADCDN_FeedADMode imageMode;

@end

NS_ASSUME_NONNULL_END
