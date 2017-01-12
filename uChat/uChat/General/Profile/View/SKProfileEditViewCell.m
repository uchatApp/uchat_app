//
//  SKProfileEditViewCell.m
//  uChat
//
//  Created by zj－db0548 on 16/11/6.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKProfileEditViewCell.h"

#import "UIView+Utils.h"

@interface SKProfileEditViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *iconView;

@end


@implementation SKProfileEditViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initLayout];
    }
    return self;
}

- (void)initLayout {

    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                            0,
                                                            80,
                                                            40)];
    _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(MTScreenWidth - 30,
                                                              0,
                                                              30,
                                                              40)];
    _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.right + 20,
                                                               0,
                                                               MTScreenWidth - _titleLabel.width - _iconView.width - 20,
                                                               40)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _subTitleLabel.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_subTitleLabel];
    [self.contentView addSubview:_iconView];
}


- (void)layoutWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle {

    self.titleLabel.text = title;
    self.subTitleLabel.text = subTitle;
}


@end

