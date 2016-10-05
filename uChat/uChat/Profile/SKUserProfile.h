//
//  SKUserProfile.h
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKUserProfile : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *constellation;
@property (nonatomic, strong) NSMutableArray *tags;
@property (nonatomic, strong) NSMutableArray *hobbies;
@property (nonatomic, strong) NSString *avatar;

- (NSDictionary *)dictionaryValue;
- (void)initWithDictionary:(NSDictionary *)dic;

@end
