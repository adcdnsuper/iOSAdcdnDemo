//
//  AppDelegate.h
//  YX_AD_demo
//
//  Created by 彭双塔 on 2019/9/26.
//  Copyright © 2019 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;


@end

