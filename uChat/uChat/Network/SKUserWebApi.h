//
//  SKUserWebApi.h
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKUserProfile.h"

@interface SKUserWebApi : NSObject

- (void)loginWithUid:(NSString *)uid
               anPwd:(NSString *)pwd
              target:(id) target
          okSelector:(SEL) okSelector
        failSelector:(SEL) failSelector
        erroSelector:(SEL) erroSelector;

- (void)logoutWithUid:(NSString *)uid
              anToken:(NSString *)token
               target:(id) target
           okSelector:(SEL) okSelector
         failSelector:(SEL) failSelector
         erroSelector:(SEL) erroSelector;

- (void)registerWithUid:(NSString *)uid
                    pwd:(NSString *)pwd
                   name:(NSString *)name
                    sex:(NSString *)sex
               birthday:(NSString *)birthday
                 target:(id) target
             okSelector:(SEL) okSelector
           failSelector:(SEL) failSelector
           erroSelector:(SEL) erroSelector;

- (void)getNewToken:(NSString *)newToken
            withUid:(NSString *)uid
           andToken:(NSString *)token
             target:(id) target
         okSelector:(SEL) okSelector
       failSelector:(SEL) failSelector
       erroSelector:(SEL) erroSelector;

- (void)getSelfInfoWithId:(NSString *)uid
                 andToken:(NSString *)token
                   target:(id) target
               okSelector:(SEL) okSelector
             failSelector:(SEL) failSelector
             erroSelector:(SEL) erroSelector;

- (void)getFriInfoWithSelfId:(NSString *)uid
                 andToken:(NSString *)token
                andFriId:(NSString *)friId
                   target:(id) target
               okSelector:(SEL) okSelector
             failSelector:(SEL) failSelector
             erroSelector:(SEL) erroSelector;

- (void)getFriInfoListWithSelfId:(NSString *)uid
                    andToken:(NSString *)token
                      target:(id) target
                  okSelector:(SEL) okSelector
                failSelector:(SEL) failSelector
                erroSelector:(SEL) erroSelector;

- (void)setUserInfoWithProfile:(SKUserProfile *)profile
                 andToken:(NSString *)token
                   target:(id) target
               okSelector:(SEL) okSelector
             failSelector:(SEL) failSelector
             erroSelector:(SEL) erroSelector;


- (void)setPwd:(NSString *)pwd
    withOldPwd:(NSString *)oldPwd
        target:(id) target
    okSelector:(SEL) okSelector
  failSelector:(SEL) failSelector
  erroSelector:(SEL) erroSelector;

- (void)setLocationWithId:(NSString *)uid
                  token:(NSString *)token
                 target:(id) target
              longitude:(float)longitude
               latitude:(float)latitude
             okSelector:(SEL) okSelector
           failSelector:(SEL) failSelector
           erroSelector:(SEL) erroSelector;


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
             erroSelector:(SEL) erroSelector;

@end
