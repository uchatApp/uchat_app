//
//  MTAccountManager.h
//  uChat
//
//  Created by zj－db0548 on 16/10/5.
//  Copyright © 2016年 amazingSS. All rights reserved.
//


#import <Foundation/Foundation.h>
@class SKUserProfile;


@interface SKAccountManager : NSObject

+ (void)saveAccount:(NSString *)account andPwd:(NSString *)pwd;

+ (NSString *)getAccount;
+ (NSString *)getPwd;

+ (NSArray *)getAccounts;

+ (void)getUserInfoWithAccount:(NSString *)account;
+ (void)saveToken:(NSString *)token;
+ (NSString *)getToken;
+ (SKUserProfile *)getLocalUser;
+ (void)setLocalUser:(SKUserProfile *)userProfile;

@end
