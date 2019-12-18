//
//  GDTUnifiedNativeAd.h
//  GDTMobSDK
//
//  Created by nimomeng on 2018/10/10.
//  Copyright © 2018 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDTUnifiedNativeAdDataObject.h"
#import "GDTUnifiedNativeAdView.h"
NS_ASSUME_NONNULL_BEGIN

@protocol GDTUnifiedNativeAdDelegate <NSObject>

/**
 广告数据回调

 @param unifiedNativeAdDataObjects 广告数据数组
 @param error 错误信息
 */
- (void)gdt_unifiedNativeAdLoaded:(NSArray<GDTUnifiedNativeAdDataObject *> * _Nullable)unifiedNativeAdDataObjects error:(NSError * _Nullable)error;
@end

@interface GDTUnifiedNativeAd : NSObject
@property (nonatomic, weak) id<GDTUnifiedNativeAdDelegate> delegate;

/**
 请求视频的时长下限，视频时长有效值范围为[5,60]。
 以下两种情况会使用系统默认的最小值设置，1:不设置  2:minVideoDuration大于maxVideoDuration
*/
@property (nonatomic) NSInteger minVideoDuration;

/**
 请求视频的最大时长，视频时长有效值范围为[5,60]。
 */
@property (nonatomic) NSInteger maxVideoDuration;

/**
 可选属性，设置本次拉取的视频广告从用户角度看到的视频播放策略。
 
 “用户角度”特指用户看到的情况，并非SDK是否自动播放，与自动播放策略 GDTVideoAutoPlayPolicy 的取值并非一一对应
 
 例如开发者设置了 GDTVideoAutoPlayPolicyNever 表示 SDK 不自动播放视频，但是开发者通过 GDTMediaView 的 play 方法播放视频，这在用户看来仍然是自动播放的。
 
 准确的设置 GDTVideoPlayPolicy 有助于提高视频广告的eCPM值，如果广告位仅支持图文广告，则无需调用。
 
 需要在 loadAd 前设置此属性。
 */
@property (nonatomic, assign) GDTVideoPlayPolicy videoPlayPolicy;

/**
 可选属性，设置本次拉取的视频广告封面是由SDK渲染还是开发者自行渲染。
 
 SDK 渲染，指视频广告 containerView 直接在 feed 流等场景展示，用户可以直接看到渲染的视频广告。Demo 工程中的 “视频Feed” 就是 SDK 渲染。
 
 开发者自行渲染，指开发者获取到广告对象后，先用封面图字段在 feed 流中先渲染出一个封面图入口，用户点击封面图，再进入一个有 conainterView 的详细页，播放视频。Demo 工程中的 "竖版 Feed 视频" 就是开发者渲染的场景。
 */
@property (nonatomic, assign) GDTVideoRenderType videoRenderType;

/**
 构造方法

 @param appId 媒体ID
 @param placementId 广告位ID
 @return GDTUnifiedNativeAd 实例
 */
- (instancetype)initWithAppId:(NSString *)appId placementId:(NSString *)placementId;

/**
 加载广告
 */
- (void)loadAd;

/**
 加载广告

 @param adCount 加载条数
 */
- (void)loadAdWithAdCount:(NSInteger)adCount;

/**
 返回广告平台名称
 
 @return 当使用流量分配功能时，用于区分广告平台；未使用时为空字符串
 */
- (NSString *)adNetworkName;
@end
NS_ASSUME_NONNULL_END
