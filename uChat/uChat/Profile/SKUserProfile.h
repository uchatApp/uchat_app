//
//  SKUserProfile.h
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKFriInfo : NSObject

@property (nonatomic, copy) NSString *firstUid;
@property (nonatomic, copy) NSString *secondUid;
@property (nonatomic, strong) NSString *likingDegree;

@end

@interface SKUserProfile : NSObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *constellation;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *hobbies;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *career;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, strong) NSArray *photoArray; //fake
@property (nonatomic, assign) BOOL isEdiable;

- (NSDictionary *)dictionaryValue;
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
