//
//  SKSelfVCHandler.m
//  uChat
//
//  Created by zj－db0548 on 16/10/16.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKSelfVCHandler.h"

#import "SKProfileViewController.h"
#import "UIView+Utils.h"
#import "SKMessageCell.h"

@interface SKSelfVCHandler ()

@end


@implementation SKSelfVCHandler

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
    }
    return self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
        {
            
           return 1;
            
        }
            break;
        case 1:
        {
            return 2;
        }
            break;
        case 2:
        {
            return 1;
        }
            break;
        default:
            break;
    }

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SKMessageCell *cell = [[SKMessageCell alloc] init];
        [cell layoutWithUserProfile:nil];
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20,
                                                                           10,
                                                                           20,
                                                                           20)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right + 20,
                                                               imageView.top,
                                                               40,
                                                               20)];
    label.text = @"握草";
    UIImageView *rImageView = [[UIImageView alloc] initWithFrame:CGRectMake(MTScreenWidth - 30,
                                                                           0,
                                                                           40,
                                                                           40)];
    
    [cell.contentView addSubview:imageView];
    [cell.contentView addSubview:label];
    [cell.contentView addSubview:rImageView];
    
    switch (indexPath.section) {
        case 0:
        {
           
            imageView.image = [UIImage imageNamed:@"test3.jpg"];
            
        }
            break;
        case 1:
        {
            if (indexPath.row == 1) {
                label.text = @"游戏";
            }
        }
            break;
        case 2:
        {
            label.text = @"设置";
        }
            break;
        default:
            break;
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
             return [SKMessageCell cellHeight];
            break;
            
        default:
            break;
    }
    return 40;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (section == 0) {
        return 0.1;
    }
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
        {
            
            SKProfileViewController *VC = [[SKProfileViewController alloc] init];
            VC.title = @"资料";
            UINavigationController *ViewControlelr = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            [ViewControlelr pushViewController:VC animated:NO];
        }
            break;
        case 1:
        {
                    }
            break;
        case 2:
        {
           
        }
            break;
        default:
            break;
    }
    
    
    
}



@end
