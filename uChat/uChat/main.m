//
//  main.m
//  uChat
//
//  Created by zj－db0548 on 16/10/1.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#include <sys/socket.h> 
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <mach/mach.h>
#import "SKUserDataBase.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
//        size_t size;
//        sysctlbyname("hw.model", NULL, &size, NULL, 0);
//        
//        char *answer = malloc(size);
//        sysctlbyname("hw.model", answer, &size, NULL, 0);
//        
//        NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
//        
        SKUserDataBase *dataBase = [[SKUserDataBase alloc] init];
        [dataBase getFrindsWithUid:@"qw"];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
