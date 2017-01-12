//
//  SKFakeData.h
//  uChat
//
//  Created by zj－db0548 on 16/10/30.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SKUserProfile.h"


@interface SKFakeData : NSObject


+ (NSArray *)friends;

+ (SKUserProfile *)currentUser;
@end

