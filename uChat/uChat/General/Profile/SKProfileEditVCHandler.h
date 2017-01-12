//
//  SKProfileEditVCHandler.h
//  uChat
//
//  Created by zj－db0548 on 16/11/8.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SKUserProfile;

@interface SKProfileEditVCHandler : NSObject<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, assign) BOOL ediAble;

@property (nonatomic, strong) SKUserProfile *profile;


@end
