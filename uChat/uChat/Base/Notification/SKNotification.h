//
//  SKNotification.h
//  uChat
//
//  Created by zj－db0548 on 16/10/9.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSMutableArray *notifications;

@interface SKNotification : NSObject

+ (void)cancelAllLocalNotifications;
+ (void)scheduleAllNotifications;
+ (UILocalNotification *)addNotificationWithFireDate:(NSDate *)date
                                                body:(NSString *)body
                                         alertAction:(NSString *)action
                                    alertLaunchImage:(NSString *)launchImage;
+ (UILocalNotification *)scheduleNotificationWithFireDate:(NSDate *)date
                                                body:(NSString *)body
                                         alertAction:(NSString *)action
                                    alertLaunchImage:(NSString *)launchImage;
+ (void)registerUserNotificationSettings:(UIUserNotificationSettings *)settings;
+ (void)registerForRemoteNotifications;
@end
