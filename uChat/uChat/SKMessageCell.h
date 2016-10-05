//
//  SKMessageCell.h
//  SKTalk
//
//  Created by zj－db0548 on 16/9/13.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import <UIKit/UIkit.h>

@class SKUserProfile;

@interface SKMessageCell : UITableViewCell

+ (CGFloat)cellHeight;

- (void)layoutWithUserProfile:(SKUserProfile *)profile;

- (void)fold;
- (void)open;

@end
