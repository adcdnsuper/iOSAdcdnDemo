//
//  ADCDN_NativeCustomRenderImage.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/31.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_NativeCustomRenderImage : NSObject

// image address URL
@property (nonatomic, copy) NSString *imageURL;

// image width
@property (nonatomic, assign) float width;

// image height
@property (nonatomic, assign) float height;
@end

NS_ASSUME_NONNULL_END
