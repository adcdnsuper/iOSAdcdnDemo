//
//  ADCDN_APPNetWorkTool.h
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/6/18.
//  Copyright © 2020 pst. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ADCDN_CompletioBlock)(NSDictionary *dic, NSURLResponse *response, NSError *error);
typedef void (^ADCDN_SuccessBlock)(NSDictionary *data);
typedef void (^ADCDN_FailureBlock)(NSError *error);
typedef void (^ADCDN_SuccessIpBlock)(id data);

@interface ADCDN_APPNetWorkTool : NSObject
/**
 * get请求
 */
+ (void)getWithUrlString:(NSString *)url parameters:(id)parameters success:(ADCDN_SuccessBlock)successBlock failure:(ADCDN_FailureBlock)failureBlock;
@end


