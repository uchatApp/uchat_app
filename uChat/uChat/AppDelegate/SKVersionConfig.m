//
//  MTVersionConfig.m
//  MTTalk
//
//  Created by zj－db0548 on 16/9/9.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import "SKVersionConfig.h"

#import "SKMacro.h"

@interface SKVersionConfig ()

@end

@implementation SKVersionConfig

/**
 *  get config of current version
 */
+ (void)getCurrentConfig {
    
    if ([self isNeedUpdate]) {
        
    }
}

+ (NSInteger)MTVersionStringToNumber:(NSString *)versionString {
    NSMutableString *str = [[NSMutableString alloc] init];
    NSArray *strArray = [versionString componentsSeparatedByString:@"."];
    
    for (int i = 0; i < strArray.count; i++) {
        [str appendString:[strArray objectAtIndex:i]];
    }
    
    return str.integerValue;
}

+ (BOOL)isNeedUpdate {
    
    NSString *localVersion = [[NSUserDefaults standardUserDefaults]
                              objectForKey:MT_CURRENT_VERSION];
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary]
                                objectForKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:currentVersion
                                              forKey:MT_CURRENT_VERSION];
    
    if (!localVersion) {
        return NO;
    }else
        if ([self MTVersionStringToNumber:localVersion] !=
            [self MTVersionStringToNumber:currentVersion]) {
            
            return NO;
        }
    
    return YES;
}


@end
