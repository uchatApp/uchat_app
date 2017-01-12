//
//  AppDelegate+init.m
//  MTTalk
//
//  Created by zj－db0548 on 16/9/9.
//  Copyright © 2016年 meitu. All rights reserved.
//


#import "AppDelegate+init.h"

#import <RongIMKit/RongIMKit.h>

#import "SKLoginViewController.h"
#import "UMMobClick/MobClick.h"
#import "SKFriViewController.h"
#import "SKSelfViewController.h"
#import "SKMacro.h"
#import "SKHomePage.h"
#import "SKLocationManager.h"
#import "SKUserDataBase.h"
#import "SKMsgViewController.h"

//#import "MTWaterWave.h"
//#import "MTFriViewController.h"
@import Firebase;

@implementation AppDelegate(init)

- (void)addHomeController {
    
    SKUserDataBase *base = [[SKUserDataBase alloc] init];
//    [FIRApp configure];
    
    SKMsgViewController *controllerMsg = [[SKMsgViewController alloc] init];
    SKFriViewController *controllerFri = [[SKFriViewController alloc] init];
    SKSelfViewController *controllerSelf = [[SKSelfViewController alloc] init];
  
    controllerFri.title = @"好友";
    controllerSelf.title = @"我";
    controllerMsg.title = @"消息";
    
    SKLoginViewController *loginVC = [[SKLoginViewController alloc] init];
    SKHomePage *homePage = [[SKHomePage alloc] init];
    UINavigationController *rootController = [[UINavigationController alloc]
                                              initWithRootViewController:homePage];
    
   
    
    self.window.rootViewController = rootController;
    [homePage addChildViewController:controllerMsg];
    [homePage addChildViewController:controllerFri];
    [homePage addChildViewController:controllerSelf];
    
    [rootController pushViewController:loginVC animated:NO];
    
//    if (![self isLogin]) {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
//        MTLoginViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:
//                                          @"MTLoginViewController"];
//        
//        [rootController pushViewController:loginVC animated:NO];
//    }
    
}

- (void)addUMConfig {
    
    UMConfigInstance.appKey = MT_UM_APPKEY;
    UMConfigInstance.channelId = @"APP Strore";
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary]
                         objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];

    [MobClick startWithConfigure:UMConfigInstance];
    
}

- (void)locationAuthority {
    [[SKLocationManager sharedManager] requestAuthorization];
    [[SKLocationManager sharedManager] startUpdatingLocation];
}

- (BOOL)isLogin {
    
    return NO;
}


- (void)initRongCloudSDK {
    
    [[RCIM sharedRCIM] initWithAppKey:MT_RONG_CLOUD_APPKEY];
    
}



@end



















