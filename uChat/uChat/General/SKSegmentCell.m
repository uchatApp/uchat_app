//
//  SKSegmentCell.m
//  uChat
//
//  Created by zj－db0548 on 16/11/1.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKSegmentCell.h"

#import "UIView+Utils.h"
#define cell_Height 40
@interface SKSegmentCell ()

@property (nonatomic, strong) NSArray *infoArray;

@end

@implementation SKSegmentCell

- (void)adjusetWithInfo:(NSArray *)infoArray {
    
    _infoArray = infoArray;
    _segMent = [[UISegmentedControl alloc] initWithItems:infoArray];
    [self.contentView addSubview:_segMent];
    _segMent.frame =  CGRectMake(0,
                                 0,
                                 MTScreenWidth,
                                 cell_Height);
    
    [_segMent addTarget:self
                 action:@selector(select:)
       forControlEvents:UIControlEventValueChanged];
}


- (void)select:(id)sender{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    _info = [_infoArray objectAtIndex:control.selectedSegmentIndex];
}

+ (CGFloat)cellHeight {
    return cell_Height;
}

@end
