//
//  SKUserDataBase.h
//  uChat
//
//  Created by zj－db0548 on 16/10/9.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKUserProfile.h"

@interface SKUserDataBase : NSObject


- (NSArray *)getFrindsWithUid:(NSString *)uid;
- (SKUserProfile *)getInfoWithUid:(NSString *)uid;
- (void)saveUser:(SKUserProfile *)profile;
- (void)saveFriInfoWithUid:(NSString *)uid andFid:(NSString *)fid;


@end
