//
//  ADCDN_NativeCustomRenderModel.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/30.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ADCDN_NativeCustomRenderImage.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ADCDNFeedADMode) {
    ADCDNFeedADModeSmallImage = 2, //三小图
    ADCDNFeedADModeLargeImage = 3, //大图
    ADCDNFeedADModeGroupImage = 4, //组图
    ADCDNFeedVideoAdModeImage = 5, //video
};

@interface ADCDN_NativeCustomRenderModel : NSObject
/** 广告标题 */
@property (nonatomic,copy) NSString *adTitle;
/** 广告副标题 */
@property (nonatomic,copy) NSString *adDesc;
/** 广告图片 */
@property (nonatomic, strong) NSMutableArray<ADCDN_NativeCustomRenderImage *> *adImageAry;
/** icon */
@property (nonatomic,copy) NSString *adIcon;
/** 视频类型的View */
@property (nonatomic,strong) UIView *adVideoView;
// 枚举类型
@property (nonatomic, assign) ADCDNFeedADMode imageMode;
// ad source.
@property (nonatomic, copy) NSString *source;

/** ad */
@property (nonatomic,strong) NSObject *ad;
/** relatedView */
@property (nonatomic,strong) NSObject *relatedView;

@end

NS_ASSUME_NONNULL_END
