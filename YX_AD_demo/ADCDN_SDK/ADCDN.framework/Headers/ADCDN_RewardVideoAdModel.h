//
//  ADCDN_RewardVideoAdModel.h
//  ADCDN
//
//  Created by 彭双塔 on 2019/10/21.
//  Copyright © 2019 pst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ADCDN_RewardVideoAdModel : NSObject
/**
   required.
   Third-party game user_id identity.
   Mainly used in the reward issuance, it is the callback pass-through parameter from server-to-server.
   It is the unique identifier of each user.
   In the non-server callback mode, it will also be pass-through when the video is finished playing.
   Only the string can be passed in this case, not nil.
 */
@property (nonatomic, copy) NSString *userId;

//optional. reward name.
@property (nonatomic, copy) NSString *rewardName;

//optional. number of rewards.
@property (nonatomic, assign) NSInteger rewardAmount;

//optional. serialized string.
@property (nonatomic, copy) NSString *extra;
@end

NS_ASSUME_NONNULL_END
