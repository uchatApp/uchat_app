//
//  AppDelegate.m
//  uChat
//
//  Created by zj－db0548 on 16/10/1.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "AppDelegate.h"

#import "AppDelegate+init.h"
#import "SKNotification.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self addHomeController];
    [self locationAuthority];
    [self initRongCloudSDK];
    
    [Fabric with:@[[Crashlytics class]]];

    [SKNotification addNotificationWithFireDate:[NSDate dateWithTimeIntervalSinceNow:10.0]
                                           body:@"添加了很多新功能， 快来试试吧"
                                    alertAction:nil
                               alertLaunchImage:nil];
    [SKNotification scheduleAllNotifications];
    [SKNotification registerForRemoteNotifications];
    
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


- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
  completionHandler:(void (^)())completionHandler{

    

}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {


}
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {

    [SKNotification scheduleAllNotifications];
        
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    //compare to local deviceToken
    
    NSData *localDeviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    
     //if changed send it to server
    if (![deviceToken isEqualToData:localDeviceToken]) {
        
    }
    
}
@end
