//
//  SKSegmentCell.h
//  uChat
//
//  Created by zj－db0548 on 16/11/1.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKSegmentCell : UITableViewCell

@property (nonatomic, strong) UISegmentedControl *segMent;
@property (nonatomic, copy) NSString *info;

- (void)adjusetWithInfo:(NSArray *)infoArray;



+ (CGFloat)cellHeight;
@end
