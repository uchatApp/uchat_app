//
//  SKNetwork.h
//  uChat
//
//  Created by zj－db0548 on 16/10/1.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKRequestParam : NSObject

@property (nonatomic, strong) NSDictionary *paramDic;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSData *formData;


@end

@interface SKNetwork : NSObject

+ (instancetype)shareInstance;

- (void)postRequestWithParam:(SKRequestParam *)param target:(id) target okSelector:(SEL) okSelector failSelector:(SEL) failSelector erroSelector:(SEL) erroSelector;

- (void)getRequestWithParam:(SKRequestParam *)param target:(id) target okSelector:(SEL) okSelector failSelector:(SEL) failSelector erroSelector:(SEL) erroSelector;

@end
