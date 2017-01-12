//
//  SKDataBase.m
//  uChat
//
//  Created by zj－db0548 on 16/10/9.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKDataBase.h"


@interface SKDataBase ()

@property (nonatomic, strong) FMDatabase *dataBase;

@end


@implementation SKDataBase

- (instancetype)init {

    self = [super init];
    if (self) {
        
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask,
                                                              YES) firstObject];
        NSString *dbPath = [path stringByAppendingPathComponent:@"skDB.sqlite"];
        
        _dataBase = [FMDatabase databaseWithPath:dbPath];
        [_dataBase open];
        
    }
    return self;
}

+ (instancetype)shareInstance {

    static SKDataBase *shareInstace;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shareInstace = [[SKDataBase alloc] init];
    });
    
    return shareInstace;
}

- (BOOL)rollback {

   return [_dataBase rollback];
}

- (BOOL)beginTransaction {
    
    return [_dataBase beginTransaction];
}

- (BOOL)commit {
    return [_dataBase commit];
}

- (NSArray *)executeQuery:(NSString*)sql {
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    FMResultSet *result = [_dataBase executeQuery:sql];
    
    while (result.next) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < result.columnCount; i ++) {
            
            NSString *key = [result columnNameForIndex:i];
            id object = [result objectForColumnIndex:i];
            [dic setObject:object forKey:key];
        }
         [array addObject:dic];
    }
    return array;
}

- (BOOL)executeUpdate:(NSString *)sql {

    return [_dataBase executeUpdate:sql];
}

- (BOOL)isExistTable:(NSString *)tableName {

    NSString *sql = [NSString stringWithFormat:@"select count(*) from sqlite_master where type = 'table' and name = '%@'",tableName];
    
    FMResultSet *result = [_dataBase executeQuery:sql];
    
    while (result.next) {
        
       int count = [[result objectForColumnIndex:0] integerValue];
        if (count > 0) {
            return true;
        }
    }
    return false;
}
@end
