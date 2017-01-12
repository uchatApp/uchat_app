//
//  MTMessageVCHandler.h
//  MTTalk
//
//  Created by zj－db0548 on 16/9/13.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SKFriVCHandler : NSObject<UITableViewDelegate,
                                        UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
