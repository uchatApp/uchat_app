//
//  SKUserDataBase.m
//  uChat
//
//  Created by zj－db0548 on 16/10/9.
//  Copyright © 2016年 amazingSS. All rights reserved.
//


#import "SKUserDataBase.h"

#import "SKDataBase.h"
#import "SKUserProfile.h"

#define USER_TABLE_NAME @"skusertable"
#define FRI_TABLE_NAME @"skfriTable"

@interface SKUserDataBase ()

@end



@implementation SKUserDataBase

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self createTable];
    }
    return self;
}

- (void)createTable {
    
    if (![[SKDataBase shareInstance] isExistTable:USER_TABLE_NAME]) {
        
        NSString *sqlstr = @"create table %@ ("
                                "id int primary key,"
                                "age int,"
                                "sex char(2),"
                                "address char(50),"
                                "constellation char(10),"
                                "tags char(50),"
                                "hobbies char(50),"
                                "avatar char(50)"
                                ")";
        
        NSString *sql = [NSString stringWithFormat:sqlstr, USER_TABLE_NAME];
        [[SKDataBase shareInstance] executeUpdate:sql];
    }
    
    if (![[SKDataBase shareInstance] isExistTable:FRI_TABLE_NAME]) {
        
        NSString *sqlstr = @"create table %@ ("
        "id int primary key,"
        "fid int"
        ")";
        
        NSString *sql = [NSString stringWithFormat:sqlstr, FRI_TABLE_NAME];
        [[SKDataBase shareInstance] executeUpdate:sql];
    }

}


- (NSArray *)getFrindsWithUid:(NSString *)uid {
    
    NSString *sqlStr = @"select skusertable.id, name, age, sex, address,constellation,tags from skusertable, skfriTable  where  skfriTable.id = '%@' and skfriTable.fid = skusertable.id";
    
    NSString *sql = [NSString stringWithFormat:sqlStr,uid];
    
    NSArray *array = [[SKDataBase shareInstance] executeQuery:sql];
    
    NSMutableArray *userArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < array.count; i ++){
        NSDictionary *dic = array[i];
        
        SKUserProfile *profile = [[SKUserProfile alloc] initWithDictionary:dic];
        
        [userArray addObject:profile];
    }
    
    return userArray;
}




- (void)getUserWithUid:(NSString *)uid {
    
    NSString *sqlStr = @"select uid, age, name, tags, hobbies from %@ where uid = %@ ";
    

}

- (SKUserProfile *)getInfoWithUid:(NSString *)uid {
    
    return nil;
}

@end







