//
//  MTAccountManager.m
//  uChat
//
//  Created by zj－db0548 on 16/10/5.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKAccountManager.h"
#import "SKUserProfile.h"

static SKUserProfile *localUser;
@interface SKAccountManager ()

@end


@implementation SKAccountManager

+ (void)saveAccount:(NSString *)account andPwd:(NSString *)pwd{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:account forKey:@"SK_ACCOUNT"];
    [userDefaults setObject:pwd forKey:@"SK_PWD"];

}

+ (NSString *)getAccount {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"SK_ACCOUNT"];
}

+ (NSString *)getPwd {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"SK_PWD"];
}

+ (NSArray *)getAccounts {

    return nil;
}

+ (void)getUserInfoWithAccount:(NSString *)account {
    
    
}

+ (void)saveToken:(NSString *)token {

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:token forKey:@"SK_TOKEN"];

}
+ (NSString *)getToken {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"SK_TOKEN"];

}

+ (SKUserProfile *)getLocalUser {
    return localUser;
}

+ (void)setLocalUser:(SKUserProfile *)userProfile {
    localUser = userProfile;
}
@end
