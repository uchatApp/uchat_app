//
//  SKUserConfig.h
//  uChat
//
//  Created by zj－db0548 on 16/10/6.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <FOundation/Foundation.h>

@interface SKUserConfig : NSObject

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *uid;

+ (instancetype)sharedInstance;

@end
