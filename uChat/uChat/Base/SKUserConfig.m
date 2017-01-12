//
//  SKUserConfig.m
//  uChat
//
//  Created by zj－db0548 on 16/10/6.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKUserConfig.h"

@interface SKUserConfig ()

@end

@implementation SKUserConfig

+ (instancetype)sharedInstance {

    static SKUserConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        config = [[SKUserConfig alloc] init];
        
    });
    return config;
}


@end
