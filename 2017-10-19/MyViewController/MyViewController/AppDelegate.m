//
//  AppDelegate.m
//  MyViewController
//
//  Created by jitengjiao      on 2017/10/19.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "AppDelegate.h"
#import "NewViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    //纯代码方式创建
//    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor=[UIColor whiteColor];
//    NewViewController *newVC=[[NewViewController alloc] init];
//    self.window.rootViewController=newVC;
//    [self.window makeKeyAndVisible];
    
//    //从storyboard中加载
//    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor=[UIColor whiteColor];
//    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *vc=[storyboard instantiateInitialViewController];
//    self.window.rootViewController=vc;
//
//    [self.window makeKeyAndVisible];
    
    
        //从storyboard中加载通过id
        self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor=[UIColor whiteColor];
        UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc=[storyboard instantiateViewControllerWithIdentifier:@"blue"];
        self.window.rootViewController=vc;
    
        [self.window makeKeyAndVisible];

    return YES;
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
}


@end
