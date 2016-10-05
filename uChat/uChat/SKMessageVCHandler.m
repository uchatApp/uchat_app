//
//  SKMessageVCHandler.m
//  SKTalk
//
//  Created by zj－db0548 on 16/9/13.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import "SKMessageVCHandler.h"

#import <RongIMKit/RongIMKit.h>

#import "SKMessageCell.h"
#import "SKUserProfile.h"
#import "UIView+Utils.h"

@interface SKMessageVCHandler ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end


@implementation SKMessageVCHandler


- (instancetype)init {
    
    self = [super init];
    
    if (self) {
       
    }
    return self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SKMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"msgCell"];
    if (!cell) {
        cell = [[SKMessageCell alloc] init];
        [cell layoutWithUserProfile:[_dataArray objectAtIndex:indexPath.row]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [SKMessageCell cellHeight];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
    chat.conversationType = ConversationType_PRIVATE;
    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
    SKUserProfile *profile = (SKUserProfile *)[_dataArray objectAtIndex:indexPath.row];
    
    //设置聊天会话界面要显示的标题
    
    //显示聊天会话界面
    

   
}


@end





