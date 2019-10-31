//
//  ADCDN_StringStyleTool.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/31.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_StringStyleTool : NSObject
+ (NSAttributedString *)titleAttributeText:(NSString *)text;
+ (NSAttributedString *)subtitleAttributeText:(NSString *)text;
+ (NSAttributedString *)infoAttributeText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
