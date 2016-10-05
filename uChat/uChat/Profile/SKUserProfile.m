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


@implementation SKUserProfile


- (NSDictionary *)dictionaryValue {
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    if (_name != nil && ![_name isEqualToString:@""]) {
        [dic setObject:_name forKey:@"name"];
    }
    
    if (_password != nil && ![_password isEqualToString:@""]) {
        [dic setObject:_password forKey:@"password"];
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
    
    if (_tags != nil && !(_tags.count == 0)) {
        [dic setObject:_tags forKey:@"tags"];
    }
    
    if (_hobbies != nil && !(_hobbies.count == 0)) {
        [dic setObject:_hobbies forKey:@"hobbies"];
    }
    
    if (_avatar != nil && ![_avatar isEqualToString:@""]) {
        [dic setObject:_avatar forKey:@"avatar"];
    }

    
    return dic;
}
- (void)initWithDictionary:(NSDictionary *)dic {


}

@end
