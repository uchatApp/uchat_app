//
//  SKUserWebApi.h
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>

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
                  anPwd:(NSString *)pwd
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



@end
