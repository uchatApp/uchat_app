//
//  SKNotification.m
//  uChat
//
//  Created by zj－db0548 on 16/10/9.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKNotification.h"

@interface SKNotification ()

@end


@implementation SKNotification


+ (void)registerUserNotificationSettings:(UIUserNotificationSettings *)settings{

    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types
        == UIUserNotificationTypeNone) {
        if (settings == nil) {
             [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound  categories:nil]];
        }else{
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];

        }
    }
}


+ (UILocalNotification *)addNotificationWithFireDate:(NSDate *)date
                                  body:(NSString *)body
                           alertAction:(NSString *)action
                      alertLaunchImage:(NSString *)launchImage{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notifications = [[NSMutableArray alloc] init];
    });
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    notification.fireDate = date;
    notification.alertBody = body;
    notification.alertAction = action;
    notification.alertLaunchImage = launchImage;
    
    if (action == nil || [action isEqualToString:@""]) {
        notification.alertAction = @"打开应用";
    }

    notification.alertAction = action;
    
    if (launchImage == nil || [launchImage isEqualToString:@""]) {
        notification.alertLaunchImage = @"default";
    }
    
    [notifications addObject:notification];
    return notification;
}

+ (UILocalNotification *)scheduleNotificationWithFireDate:(NSDate *)date
                                                     body:(NSString *)body
                                              alertAction:(NSString *)action
                                         alertLaunchImage:(NSString *)launchImage {
    
   UILocalNotification *notification =  [SKNotification addNotificationWithFireDate:date
                                                                               body:body
                                                                        alertAction:action
                                                                   alertLaunchImage:launchImage];

    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types
        != UIUserNotificationTypeNone) {
    
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }else{
    
        [SKNotification registerUserNotificationSettings:nil];
    }
    
    return notification;
}

+ (void)cancelAllLocalNotifications {

    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


+ (void)scheduleAllNotifications {

    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types
        == UIUserNotificationTypeNone) {
        
        [SKNotification registerUserNotificationSettings:nil];

    }else{
    
        for ( int i = 0; i < notifications.count; i ++) {
            
            UILocalNotification *notification = [notifications objectAtIndex:i];
            [[UIApplication sharedApplication] cancelLocalNotification:notification];
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }

    }
}

+ (void)registerForRemoteNotifications {

    if (![[UIApplication sharedApplication] isRegisteredForRemoteNotifications]) {
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
}

@end
