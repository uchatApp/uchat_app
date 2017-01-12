//
//  png"]; SKUserWebApi.m
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKUserWebApi.h"

#import "SKNetwork.h"
#import "SKAccountManager.h"

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
                    pwd:(NSString *)pwd
                   name:(NSString *)name
                    sex:(NSString *)sex
               birthday:(NSString *)birthday
                 target:(id) target
             okSelector:(SEL) okSelector
           failSelector:(SEL) failSelector
           erroSelector:(SEL) erroSelector{
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:uid forKey:@"id"];
    [dic setObject:pwd forKey:@"pwd"];
    [dic setObject:name forKey:@"name"];
    [dic setObject:sex forKey:@"sex"];
    [dic setObject:birthday forKey:@"birthday"];
    
    
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

- (void)getSelfInfoWithId:(NSString *)uid
                 andToken:(NSString *)token
                   target:(id) target
               okSelector:(SEL) okSelector
             failSelector:(SEL) failSelector
             erroSelector:(SEL) erroSelector {
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    param.url = @"https://www.kongyt.com/get_self_info";



}

- (void)getFriInfoListWithSelfId:(NSString *)uid
                    andToken:(NSString *)token
                      target:(id) target
                  okSelector:(SEL) okSelector
                failSelector:(SEL) failSelector
                erroSelector:(SEL) erroSelector {
    SKRequestParam *param = [[SKRequestParam alloc] init];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    param.url = @"https://www.kongyt.com/get_friend_info";

}

- (void)setUserInfoWithProfile:(SKUserProfile *)profile
                      andToken:(NSString *)token
                        target:(id) target
                    okSelector:(SEL) okSelector
                  failSelector:(SEL) failSelector
                  erroSelector:(SEL) erroSelector {
    
    NSMutableDictionary *dic = [[profile dictionaryValue] mutableCopy];
    [dic setObject:token forKey:@"token"];
    [dic setObject:@"hehe" forKey:@"province"];
    [dic setObject:@"loa" forKey:@"city"];
       
    SKRequestParam *param = [[SKRequestParam alloc] init];
    param.paramDic = dic;
    param.url = @"https://www.kongyt.com/set_user_info";
    
    [[SKNetwork shareInstance] postRequestWithParam:param
                                             target:target
                                         okSelector:okSelector
                                       failSelector:failSelector
                                       erroSelector:erroSelector];

}



- (void)setPwd:(NSString *)pwd
    withOldPwd:(NSString *)oldPwd
        target:(id) target
    okSelector:(SEL) okSelector
  failSelector:(SEL) failSelector
  erroSelector:(SEL) erroSelector; {
    
    NSString *uid = [SKAccountManager getAccount];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:pwd forKey:@"newpwd"];
    [dic setObject:oldPwd forKey:@"oldpwd"];
    [dic setObject:uid forKey:@"id"];
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    param.paramDic = dic;
    param.url = @"https://www.kongyt.com/change_password_by_old_pwd";
    
    [[SKNetwork shareInstance] postRequestWithParam:param
                                             target:target
                                         okSelector:okSelector
                                       failSelector:failSelector
                                       erroSelector:erroSelector];

}

- (void)setLocationWithId:(NSString *)uid
                  token:(NSString *)token
                 target:(id) target
              longitude:(float)longitude
               latitude:(float)latitude
             okSelector:(SEL) okSelector
           failSelector:(SEL) failSelector
           erroSelector:(SEL) erroSelector{
    
     NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:uid forKey:@"id"];
    [dic setObject:token forKey:@"token"];
    [dic setObject:@(latitude) forKey:@"latitude"];
    [dic setObject:@(longitude) forKey:@"longitude"];
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    param.paramDic = dic;
    param.url = @"https://www.kongyt.com/set_location";
    
    [[SKNetwork shareInstance] postRequestWithParam:param
                                             target:target
                                         okSelector:okSelector
                                       failSelector:failSelector
                                       erroSelector:erroSelector];


}

- (void)getRecommendWithId:(NSString *)uid
                     token:(NSString *)token
                       sex:(NSString *)sex
                       age:(NSUInteger )age
                  distance:(float)distance
                  province:(NSString *)province
                      city:(NSString *)city
                    career:(NSString *)career
                   hobbies:(NSString *)hobbies
                      page:(NSUInteger )page
                    target:(id) target
                okSelector:(SEL) okSelector
              failSelector:(SEL) failSelector
              erroSelector:(SEL) erroSelector {


    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:uid forKey:@"id"];
    [dic setObject:token forKey:@"token"];
    [dic setObject:sex forKey:@"sex"];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(age) forKey:@"age"];
    [dic setObject:@(distance) forKey:@"distance"];
    [dic setObject:province forKey:@"province"];
    [dic setObject:city forKey:@"city"];
    [dic setObject:hobbies forKey:@"hobbies"];
    
    SKRequestParam *param = [[SKRequestParam alloc] init];
    param.paramDic = dic;
    param.url = @"https://www.kongyt.com/get_recommend_friends";
    
    [[SKNetwork shareInstance] postRequestWithParam:param
                                             target:target
                                         okSelector:okSelector
                                       failSelector:failSelector
                                       erroSelector:erroSelector];

}



@end
