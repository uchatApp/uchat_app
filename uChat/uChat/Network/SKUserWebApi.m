//
//  png"]; SKUserWebApi.m
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKUserWebApi.h"

#import "SKNetwork.h"

@interface SKUserWebApi ()


@end

@implementation SKRequestParam



@end
@implementation SKUserWebApi

- (void)loginWithUid:(NSString *)uid
               anPwd:(NSString *)pwd
              target:(id) target
          okSelector:(SEL) okSelector
        failSelector:(SEL) failSelector
        erroSelector:(SEL) erroSelector{
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:uid forKey:@"id"];
    [dic setObject:pwd forKey:@"pwd"];
    
    param.url = @"https://www.kongyt.com/login";
    param.paramDic = dic;
    
    [[SKNetwork shareInstance] postRequestWithParam:param
                                             target:target
                                         okSelector:okSelector
                                       failSelector:failSelector
                                       erroSelector:erroSelector];
    
}

- (void)logoutWithUid:(NSString *)uid
                anToken:(NSString *)token
               target:(id) target
           okSelector:(SEL) okSelector
         failSelector:(SEL) failSelector
         erroSelector:(SEL) erroSelector {
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:uid forKey:@"id"];
    [dic setObject:token forKey:@"token"];
    
    param.url = @"";
    param.paramDic = dic;
    [[SKNetwork shareInstance] postRequestWithParam:param
                                             target:target
                                         okSelector:okSelector
                                       failSelector:failSelector
                                       erroSelector:erroSelector];

}

- (void)registerWithUid:(NSString *)uid
                  anPwd:(NSString *)pwd
                 target:(id) target
             okSelector:(SEL) okSelector
           failSelector:(SEL) failSelector
           erroSelector:(SEL) erroSelector{
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:uid forKey:@"id"];
    [dic setObject:pwd forKey:@"pwd"];
    
    param.url = @"https://www.kongyt.com/register";
    param.paramDic = dic;
    
    [[SKNetwork shareInstance] postRequestWithParam:param
                                             target:target
                                         okSelector:okSelector
                                       failSelector:failSelector
                                       erroSelector:erroSelector];

    
}


- (void)getNewToken:(NSString *)newToken
            withUid:(NSString *)uid
           andToken:(NSString *)token
             target:(id) target
         okSelector:(SEL) okSelector
       failSelector:(SEL) failSelector
       erroSelector:(SEL) erroSelector {
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:uid forKey:@"id"];
    [dic setObject:token forKey:@"token"];
    
    param.url = @"";
    param.paramDic = dic;

}

@end
