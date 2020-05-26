//
//  AppDelegate.h
//  adcdndemo
//
//  Created by 彭双塔 on 2020/5/26.
//  Copyright © 2020 pst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

