//
//  SKDataBase.h
//  uChat
//
//  Created by zj－db0548 on 16/10/9.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>

@interface SKDataBase : NSObject

+ (instancetype)shareInstance;
- (BOOL)beginTransaction;
- (BOOL)commit;
- (BOOL)rollback;
- (NSArray *)executeQuery:(NSString*)sql;
- (BOOL)executeUpdate:(NSString *)sql;
- (BOOL)isExistTable:(NSString *)tableName;

@end
