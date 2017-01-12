//
//  SKUserProfile.m
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKUserProfile.h"

@interface SKUserProfile ()

@end


@implementation SKFriInfo


@end

@implementation SKUserProfile


- (NSDictionary *)dictionaryValue {
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    if (_uid != nil && ![_uid isEqualToString:@""]) {
        [dic setObject:_uid forKey:@"id"];
    }

    
    if (_name != nil && ![_name isEqualToString:@""]) {
        [dic setObject:_name forKey:@"name"];
    }
    
   
    if (_sex != nil && ![_sex isEqualToString:@""]) {
        [dic setObject:_sex forKey:@"sex"];
    }
    
    if (_address != nil && ![_address isEqualToString:@""]) {
        [dic setObject:_address forKey:@"address"];
    }
    
    if (_constellation != nil && ![_constellation isEqualToString:@""]) {
        [dic setObject:_constellation forKey:@"constellation"];
    }
    
    if (_tags != nil && ![_tags isEqualToString:@""]) {
        [dic setObject:_tags forKey:@"tags"];
    }
    
    if (_hobbies != nil && ![_hobbies isEqualToString:@""]) {
        [dic setObject:_hobbies forKey:@"hobbies"];
    }
    
    if (_avatar != nil && ![_avatar isEqualToString:@""]) {
        [dic setObject:_avatar forKey:@"avatar"];
    }

    if (_birthday != nil && ![_birthday isEqualToString:@""]) {
        [dic setObject:_birthday forKey:@"birthday"];
    }
    
    if (_career != nil && ![_career isEqualToString:@""]) {
        [dic setObject:_career forKey:@"career"];
    }

    return dic;
}
- (instancetype)initWithDictionary:(NSDictionary *)dic {
    
    self = [super init];
    
    if (self) {
        _uid = [dic objectForKey:@"id"];
        _name = [dic objectForKey:@"name"];
        _sex = [dic objectForKey:@"sex"];
        _address = [dic objectForKey:@"address"];
        _constellation = [dic objectForKey:@"constellation"];
        _tags = [dic objectForKey:@"tags"];
        _hobbies = [dic objectForKey:@"hobbies"];
        _avatar = [dic objectForKey:@"avatar"];
        _birthday = [dic objectForKey:@"birthday"];
        _career = [dic objectForKey:@"career"];
    }
    
    return self;
}

@end
