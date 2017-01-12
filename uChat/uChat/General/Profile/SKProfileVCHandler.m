//
//  SKProfileVCHandler.m
//  uChat
//
//  Created by zj－db0548 on 16/10/30.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKProfileVCHandler.h"

#import "SKPhotoView.h"
#import "SKUserProfile.h"
#import "SKProfileAgeCell.h"
#import "UIView+Utils.h"

@interface SKProfileVCHandler ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end


@implementation SKProfileVCHandler

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        _ediAble = NO;
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
            return 3;
        }
            break;
            
        default:
            break;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
    switch (indexPath.section) {
        case 0:
        {
            NSDictionary *dic = @{@"sex":_profile.sex,
                                  @"age":@"18",
                                  @"constellation":@"摩羯"};
            SKProfileAgeCell *ageCell = [[SKProfileAgeCell alloc] initWithDic:dic];
            return ageCell;
        }
        case 1:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,
                                                                            5,
                                                                            MTScreenWidth,
                                                                            20)];
            UILabel *msgLabel = [[UILabel alloc] init];
            [cell.contentView addSubview:titleLabel];
            [cell.contentView addSubview:msgLabel];
            
            switch (indexPath.row) {
                case 0:
                {
                    titleLabel.text = @"家乡:";
                    msgLabel.text = _profile.address;
                }
                    break;
                    
                case 1:
                {
                    titleLabel.text = @"爱好:";
                    msgLabel.text = _profile.hobbies;
                }
                    break;
                    
                case 2:
                {
                    titleLabel.text = @"职业:";
                    msgLabel.text = _profile.career;
                }
                    break;

                default:
                    break;
            }
            msgLabel.font = [UIFont systemFontOfSize:15];
            CGSize size = [msgLabel.text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
            msgLabel.frame = CGRectMake(0,
                                        titleLabel.bottom + 10,
                                        MTScreenWidth,
                                        size.height);
            return cell;
        
        }
            break;
            
        case 2:
        {
        
        }
            break;
            
        default:
            break;
    }
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            return 40;
            break;
        case 1:
        {
            CGFloat cellHeight = 40;
            switch (indexPath.row) {
                case 0:
                {
                  CGSize size = [_profile.address sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
                    cellHeight += size.height;
                }
                    break;
                    
                case 1:
                {
                   CGSize size = [_profile.hobbies sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
                    cellHeight += size.height;
                }
                    break;
                    
                case 2:
                {
                    CGSize size = [_profile.hobbies sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
                    cellHeight += size.height;

                }
                    break;
                    
                default:
                    break;
            }
            return cellHeight;
        }
        default:
            break;
    }
    return 30;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (!_ediAble) {
        return;
    }
    
    
    switch (indexPath.section) {
        case 0:
            
            break;
        case 1:
        {
            CGFloat cellHeight = 40;
            switch (indexPath.row) {
                case 0:
                {
                    CGSize size = [_profile.address sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
                    cellHeight += size.height;
                }
                    break;
                    
                case 1:
                {
                    CGSize size = [_profile.hobbies sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
                    cellHeight += size.height;
                }
                    break;
                    
                case 2:
                {
                    CGSize size = [_profile.hobbies sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
                    cellHeight += size.height;
                    
                }
                    break;
                    
                default:
                    break;
            }
           
        }
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
        
        SKPhotoView *photoView = [[SKPhotoView alloc] initWithImageArray:_profile.photoArray];
        return photoView;
    }
    
    return nil;
};

@end
