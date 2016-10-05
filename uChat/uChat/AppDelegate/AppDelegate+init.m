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
#import "SKMessageViewController.h"
#import "SKSelfViewController.h"
#import "SKMacro.h"
//#import "MTWaterWave.h"
//#import "MTFriViewController.h"
@import Firebase;

@implementation AppDelegate(init)

- (void)addHomeController {
    
//    [FIRApp configure];
    SKMessageViewController *controllerMsg = [[SKMessageViewController alloc] init];
    SKSelfViewController *controllerSelf = [[SKSelfViewController alloc] init];
//    MTFriViewController *controllerFri = [[MTFriViewController alloc] init];
//    MTNearbyViewController *controllerNear = [[MTNearbyViewController alloc] init];
//    
    controllerMsg.title = @"消息";
    controllerSelf.title = @"我";
//    controllerFri.title = @"friends";
//    controllerNear.title = @"near";
//    
//    MTHomePageTabBarController *homePage = [MTHomePageTabBarController shareInstance];
//    [homePage addChildViewController:controllerMsg];
//    [homePage addChildViewController:controllerFri];
//    [homePage addChildViewController:controllerNear];
    
    SKLoginViewController *loginVC = [[SKLoginViewController alloc] init];
    
    UITabBarController *homePage = [[UITabBarController alloc] init];

    UINavigationController *rootController = [[UINavigationController alloc]
                                              initWithRootViewController:homePage];
    self.window.rootViewController = rootController;
    [homePage addChildViewController:controllerMsg];
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


- (BOOL)isLogin {
    
    return NO;
}


- (void)initRongCloudSDK {
    
    [[RCIM sharedRCIM] initWithAppKey:MT_RONG_CLOUD_APPKEY];
    
    //测试阶段
    NSString *MTTest = @"mXJk/Lu5RmnnwcRscUPwGIH9pTpZm6lnQjp+SVRPKW92dNyyAh9DLIBqhl4FOoCKa3JUhYXiBVPtWmh6IaRGC6f7atXwyAJf";
    NSString *MTTest2 = @"Nwa18QY9QwqO3wsFkvP+k4H9pTpZm6lnQjp+SVRPKW8XvF+SuQte9/HwRxeLazplGjduYwTNidkU6X8xWMTx2g==";
    
    [[RCIM sharedRCIM] connectWithToken:MTTest
                                success:^(NSString *userId){
                                    NSLog(@"%@",userId);
                                }
     
                                error:^(RCConnectErrorCode status) {
                                      NSLog(@"登陆的错误码为:%ld", status);
                                  }
                         tokenIncorrect:^{
                                      //token过期或者不正确。
                                      //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
                                      //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
                                      NSLog(@"token错误");
                                  }];
    
}



@end



















