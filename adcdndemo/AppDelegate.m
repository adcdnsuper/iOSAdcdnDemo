//
//  AppDelegate.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/9/27.
//  Copyright © 2019 pst. All rights reserved.
//

#import "AppDelegate.h"
#import <ADCDN/ADCDN.h>
#import "ADCDN_ViewController.h"
#import "ADCDN_NavigationController.h"

@interface AppDelegate ()<ADCDN_SplashAdManagerViewDelegate>
/* 开屏广告对象 */
@property (nonatomic,strong) ADCDN_SplashAdManagerView *splashAdView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 初始化配置
    [ADCDN_ConfigManager shareManagerWithAppId:KappId];
    // ADCDN版本号
    NSLog(@"ADCDN版本号：%@",[[ADCDN_ConfigManager shareManagerWithAppId:KappId] getSDKVersion]);
    // 开发ADCDN错误日志,默认不开启,控制台搜索ADCDN_log可查看错误日志
    [ADCDN_DebugLogTool setLogEnable:YES];
    
    // 设置window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    ADCDN_ViewController *vc = [[ADCDN_ViewController alloc] init];
    ADCDN_NavigationController * nav = [[ADCDN_NavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    
    // 加载开屏广告
    [self loadSplashAd];
 
    return YES;
}

#pragma mark - 加载开屏广告
-(void)loadSplashAd{
   // 加载开屏广告
   [self.splashAdView loadSplashAd];
}
#pragma mark - 开屏页懒加载
-(ADCDN_SplashAdManagerView *)splashAdView{
    if (!_splashAdView) {
        CGRect frame = [UIScreen mainScreen].bounds;
        _splashAdView = [[ADCDN_SplashAdManagerView alloc] initWithFrame:frame plcId:KplcId_Splash];
        _splashAdView.backgroundColor = [UIColor whiteColor];
        _splashAdView.window = self.window;
        _splashAdView.delegate = self;// manager需要strong持有，否则delegate回调无法执行，影响计费
        [self.window.rootViewController.view addSubview:_splashAdView];
        _splashAdView.rootViewController = self.window.rootViewController;
        // 防止白屏，给一个兜底图，开发者可以设置一个跟启动图一样的
        UIView *bottomView = [[UIView alloc] initWithFrame:frame];
        // icon
        UIImageView *launchImg = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 62)/2.0, 180, 62, 62)];
        launchImg.image = [UIImage imageNamed:@"launch_icon"];
        launchImg.contentMode = UIViewContentModeScaleAspectFit;
        [bottomView addSubview:launchImg];
        UIImageView *launchNameImg = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 76)/2.0, launchImg.frame.size.height + launchImg.frame.origin.y + 30, 76, 18)];
        launchNameImg.image = [UIImage imageNamed:@"launch_name"];
        launchNameImg.contentMode = UIViewContentModeScaleAspectFit;
        [bottomView addSubview:launchNameImg];
       _splashAdView.bottomView = bottomView;
      
        // 设置开屏底部自定义LogoView，展示半屏开屏广告
        UIView *logoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.width * 0.25)];
        UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:logoView.frame];
        CGRect logoFrame = logoImageView.frame;
        logoFrame.size.width = 123;
        logoFrame.size.height = 30;
        logoImageView.frame = logoFrame;
        logoImageView.image = [UIImage imageNamed:@"splash_logo"];
        [logoView addSubview:logoImageView];
        logoImageView.center = logoView.center;
        logoView.backgroundColor = [UIColor whiteColor];
        _splashAdView.logoView = logoView;
    }
    return _splashAdView;
}
/**
 *  开屏广告成功展示
 */
- (void)ADCDN_SplashAdSuccessPresentScreen:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告成功展示");
}
/**
 *  开屏广告展示失败
 */
- (void)ADCDN_SplashAdFailToPresent:(ADCDN_SplashAdManagerView *_Nullable)splashAd withError:(NSError *_Nullable)error {
    NSLog(@"%s---%@ error:%@",__FUNCTION__,@"开屏广告展示失败",error);
    // 移除开屏视图
    if (self.splashAdView) {
        [self.splashAdView removeFromSuperview];
        self.splashAdView = nil;
    }
}
/**
 *  开屏广告曝光回调
 */
- (void)ADCDN_SplashAdExposured:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告曝光回调");
}
/**
 *  开屏广告点击回调
 */
- (void)ADCDN_SplashAdClicked:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告点击回调");
}
/**
 *  开屏广告关闭回调
 */
- (void)ADCDN_SplashAdClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd {
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告关闭回调");
    // 移除开屏视图
    if (self.splashAdView) {
        [self.splashAdView removeFromSuperview];
        self.splashAdView = nil;
    }
}
/**
 *  开屏广告将要关闭回调
 */
- (void)ADCDN_SplashAdWillClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd{
    NSLog(@"%s---%@",__FUNCTION__,@"开屏广告将要关闭回调");
    
}
/**
 *  开屏详情页关闭回调
 */
- (void)ADCDN_SplashAdDetailClosed:(ADCDN_SplashAdManagerView *_Nullable)splashAd{
    NSLog(@"%s---%@",__FUNCTION__,@"开屏详情页关闭回调");
}
#pragma mark - 快捷桌面启动执行的delegate方法
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options{
    BOOL resault = NO;
    // adcdnGameBox为营销场景的唯一标识
    if ([url.absoluteString containsString:@"adcdnGameBox"]) {
       // 方式一：跳转到营销场景首页
       resault = [[ADCDN_GameBoxManager defaultManager] handleOpenURL:url options:options];
    // 方式二：跳转到营销场景首页，绑定第三方用户id，如果游客模式userId可为空
//       resault = [[ADCDN_GameBoxManager defaultManager] handleOpenURL:url options:options userId:@"第三方userId"];
    }
    return resault;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ADCDN_APP"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
