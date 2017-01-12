//
//  SKFakeData.m
//  uChat
//
//  Created by zj－db0548 on 16/10/30.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKFakeData.h"

@implementation SKFakeData


+ (NSArray *)friends {

    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    SKUserProfile *profile = [[SKUserProfile alloc] init];
    profile.uid = @"kaoyao";
    profile.name = @"握草";
    profile.photoArray = @[@"test2.jpg",@"test3.jpg",@"test4.jpg",@"test6.png",@"test7.jpg"];
    profile.sex = @"M";
    profile.address = @"福建省，泉州市，德化县，春美乡，古春村";
    profile.hobbies = @"乒乓球 游泳 跑步 拳击";
    profile.career = @"程序员";
    profile.signature = @"啦啦啦啦阿拉啦";
    profile.avatar = @"test2.jpg";
    
    SKUserProfile *profile1 = [[SKUserProfile alloc] init];
    profile1.uid = @"wocao";
    profile1.name = @"小辣鸡";
    profile1.photoArray = @[@"test2.jpg",@"test3.jpg",@"test4.jpg",@"test6.png",@"test7.jpg"];
    profile1.sex = @"F";
    profile1.address = @"福建省，泉州市，德化县，春美乡，古春村";
    profile1.hobbies = @"乒乓球 游泳 跑步 拳击";
    profile1.career = @"不知道什么渣渣";
    profile1.signature = @"dsajhsala";
    profile1.avatar = @"test3.jpg";

    
    [array addObject:profile];
    [array addObject:profile1];

    return array;
}

+ (SKUserProfile *)currentUser {

    SKUserProfile *profile = [[SKUserProfile alloc] init];
    
    profile.uid = @"longya";
    profile.name = @"空海";
    profile.photoArray = @[@"test2.jpg",@"test3.jpg",@"test4.jpg",@"test6.png",@"test7.jpg"];
    profile.sex = @"M";
    profile.address = @"福建省，泉州市，德化县，春美乡，古春村";
    profile.hobbies = @"乒乓球 游泳 跑步 拳击";
    profile.career = @"程序员";
    profile.signature = @"lalalalala";
    return profile;
}


@end
