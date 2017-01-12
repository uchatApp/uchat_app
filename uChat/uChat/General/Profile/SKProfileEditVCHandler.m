//
//  SKProfileEditVCHandler.m
//  uChat
//
//  Created by zj－db0548 on 16/11/8.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKProfileEditVCHandler.h"

#import "SKPhotoView.h"
#import "SKProfileEditViewCell.h"
#import "SKUserProfile.h"
#import "SKEditViewController.h"

@interface SKProfileEditVCHandler ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end


@implementation SKProfileEditVCHandler

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        _ediAble = NO;
    }
    return self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SKProfileEditViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eidtCell"];
    
    if (!cell) {
        cell = [[SKProfileEditViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"editCell"];
    }
    
    switch (indexPath.row) {
        case 0:
        {
            [cell layoutWithTitle:@"用户名"
                      andSubTitle:_profile.name];

        }
            break;
        case 1:
        {
            [cell layoutWithTitle:@"个性签名"
                      andSubTitle:_profile.signature];

        }
            break;
        case 2:
        {
            [cell layoutWithTitle:@"职业"
                      andSubTitle:_profile.career];

        }
            break;
        case 3:
        {
            [cell layoutWithTitle:@"家乡"
                      andSubTitle:_profile.address];

        }
            break;
        case 4:
        {
            [cell layoutWithTitle:@"爱好"
                      andSubTitle:_profile.hobbies];

        }
            break;
        case 5:
        {
            [cell layoutWithTitle:@"音乐" andSubTitle:@"好像没啥啊"];

        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (!_ediAble) {
//        return;
//    }
    
    
    switch (indexPath.section) {
        case 0:
        {
           
            
    
            UINavigationController *control = [[UIApplication sharedApplication] keyWindow].rootViewController;
            
            SKEditViewController *VC = [[SKEditViewController alloc] init];
            VC.type = EditViewControllerTypeText;
            
            [control pushViewController:VC animated:NO];
            
        }
            break;
        default:
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return [SKPhotoView viewHeight];

    }

    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        SKPhotoView *photoView = [[SKPhotoView alloc] initWithImageArray:nil];
        photoView.editAble = YES;
        
        return photoView;
    }
    
    return nil;
};

@end
