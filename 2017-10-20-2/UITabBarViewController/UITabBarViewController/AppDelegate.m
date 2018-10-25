//
//  AppDelegate.m
//  UITabBarViewController
//
//  Created by jitengjiao      on 2017/10/20.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "AppDelegate.h"
#import "FistViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    
    UITabBarController *tabBar=[[UITabBarController alloc] init];
    self.window.rootViewController=tabBar;
    
    FistViewController *firstVC=[[FistViewController alloc] init];
    firstVC.tabBarItem.title=@"电话";
    UIImage *image1=[UIImage imageNamed:@"电话.png"];
    [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstVC.tabBarItem.image= image1;
    firstVC.tabBarItem.badgeValue=@"12";
    
    UIViewController *sencondVC=[[UIViewController alloc] init];
    sencondVC.tabBarItem.title=@"短信";
    sencondVC.tabBarItem.image=[UIImage imageNamed:@"短信.png"];
    
    UIViewController *thirdVc=[[UIViewController alloc] init];
    thirdVc.tabBarItem.title=@"微信";
    thirdVc.tabBarItem.image=[UIImage imageNamed:@"微信.png"];
     thirdVc.tabBarItem.badgeValue=@"过期";
    
    tabBar.viewControllers=@[firstVC,sencondVC,thirdVc];
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
