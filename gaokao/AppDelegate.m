//
//  AppDelegate.m
//  gaokao
//
//  Created by MiaoLizhuang on 15/11/21.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseBarController.h"
#import "ListViewController.h"
#import "ViewController.h"
#import "SettingViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    [self ConfigureUI];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)ConfigureUI{
    
     [UINavigationBar appearance].barTintColor=[UIColor colorWithRed:72.0/255.0 green:181.0/255.0 blue:235.0/255.0 alpha:1.0];
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"TabbarConfig" ofType:@"plist"];
    NSArray * infoArray = [[NSArray alloc]initWithContentsOfFile:filePath];
    NSMutableArray * vcArray = [[NSMutableArray alloc]init];
    for (NSDictionary * info in infoArray) {
        
        NSString * title = info[@"title"];
        UIImage * normalImage = [UIImage imageNamed:info[@"normalImage"]];
        UIImage * selectedImage = [UIImage imageNamed:info[@"selectedImage"]];
        UIViewController * vc = [[[NSClassFromString(info[@"className"]) class] alloc]init];
         UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.title = title;
        UITabBarItem * item = [[UITabBarItem alloc]initWithTitle:title image:normalImage selectedImage:selectedImage];
        nav.tabBarItem = item;
        [vcArray addObject:nav];
    }
    BaseBarController * baseBarVC = [[BaseBarController alloc]init];
    baseBarVC.viewControllers = vcArray;
    self.window.rootViewController = baseBarVC;
}

@end
