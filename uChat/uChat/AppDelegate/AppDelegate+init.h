//
//  AppDelegate+init.h
//  MTTalk
//
//  Created by zj－db0548 on 16/9/9.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (init)


- (void)addHomeController;
- (void)addUMConfig;
- (BOOL)isLogin;
- (void)initRongCloudSDK;
- (void)locationAuthority;

@end
