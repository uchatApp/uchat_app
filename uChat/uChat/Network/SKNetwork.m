//
//  SKNetwork.m
//  uChat
//
//  Created by zj－db0548 on 16/10/1.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKNetwork.h"

#import <AFNetworking.h>

#define requestIp

@interface SKNetwork ()


@end


@implementation SKNetwork

+ (instancetype)shareInstance {
    
    static SKNetwork *network;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        network = [[SKNetwork alloc] init];
        
    });
    return network;
}


- (void)postRequestWithParam:(SKRequestParam *)param target:(id) target okSelector:(SEL) okSelector failSelector:(SEL) failSelector erroSelector:(SEL) erroSelector {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:param.url parameters:param.paramDic constructingBodyWithBlock:^(id formData){
        
        if (param.formData) {
            [formData appendPartWithFileData:param.formData name:@"image" fileName:@"image" mimeType:@"image/png"];
        }
        
    } progress:^(NSProgress *_Nonnull uploadProgress) {
        
    }success:^(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        if (dic == NULL || [[dic objectForKey:@"err_code"] intValue] == 0) {
            
            if ([target respondsToSelector:erroSelector]) {
                [target performSelectorOnMainThread:erroSelector withObject:responseObject waitUntilDone:YES];
            }
            
        }
        else{
            if ([target respondsToSelector:okSelector]) {
                [target performSelectorOnMainThread:okSelector withObject:responseObject waitUntilDone:YES];
            }
            
        }
        
        
        
    }failure:^(NSURLSessionDataTask *_Nonnull task,NSError *_Nonnull error){
        NSLog(@"failure");
        if ([target respondsToSelector:failSelector]) {
            [target performSelectorOnMainThread:failSelector withObject:error waitUntilDone:YES];
        }
        
    }];
    


}



- (void)getRequestWithParam:(SKRequestParam *)param target:(id) target okSelector:(SEL) okSelector failSelector:(SEL) failSelector erroSelector:(SEL) erroSelector {
    
    NSDictionary *par = param.paramDic;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:param.url parameters:par progress:^(NSProgress *_Nonnull downloadProgress) {
        
    }success:^(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        if (dic == NULL || [[dic objectForKey:@"err_code"] intValue] != 0) {
            
            if ([target respondsToSelector:erroSelector]) {
                [target performSelectorOnMainThread:erroSelector withObject:responseObject waitUntilDone:YES];
            }
            
        }
        else{
            if ([target respondsToSelector:okSelector]) {
                [target performSelectorOnMainThread:okSelector withObject:responseObject waitUntilDone:YES];
            }
            
        }
        
        
        
    }failure:^(NSURLSessionDataTask *_Nonnull task,NSError *_Nonnull error){
        NSLog(@"failure");
        if ([target respondsToSelector:failSelector]) {
            [target performSelectorOnMainThread:failSelector withObject:error waitUntilDone:YES];
        }
        
    }];


}




@end











