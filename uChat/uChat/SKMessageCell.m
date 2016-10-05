//
//  SKMessageCell.m
//  SKTalk
//
//  Created by zj－db0548 on 16/9/13.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import "SKMessageCell.h"

#import "UIView+Utils.h"
#import "SKUserProfile.h"

@interface SKMessageCell ()

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) UILabel *bageView;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) UILabel *sexlabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *constellation;

@end


@implementation SKMessageCell

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, MTScreenWidth, 100);
        [self.contentView addSubview:self.avatarView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.msgLabel];
        [self.contentView addSubview:self.bageView];
        
        UIColor* color=[[UIColor alloc]initWithRed:0.3 green:0.4 blue:0.5 alpha:1];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = color;
    }
    
    return self;
}


- (UIImageView *)avatarView {

    if (!_avatarView) {
        
        CGRect avatarFrame = CGRectMake(10, 10, 50, 50);
        _avatarView = [[UIImageView alloc] initWithFrame:avatarFrame];
        _avatarView.backgroundColor = [UIColor redColor];
        _avatarView.layer.cornerRadius = _avatarView.width / 2.0;
        _avatarView.layer.masksToBounds = YES;
        
    }
    
    return _avatarView;
}


- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        CGRect frame = CGRectMake(self.avatarView.right + 15,
                                  self.avatarView.top,
                                  MTScreenWidth - self.avatarView.right - 15,
                                  30);
        _nameLabel = [[UILabel alloc] initWithFrame:frame];
        _nameLabel.backgroundColor = [UIColor grayColor];
    }
    
    return _nameLabel;
}


- (UILabel *)msgLabel {
    
    if (!_msgLabel) {
        
        CGRect frame = CGRectMake(self.avatarView.right + 15,
                                  self.nameLabel.bottom + 5,
                                  self.nameLabel.width,
                                  self.nameLabel.height - 10);
        _msgLabel = [[UILabel alloc] initWithFrame:frame];
        _msgLabel.backgroundColor = [UIColor yellowColor];
        
    }
    
    return _msgLabel;
}

- (UILabel *)bageView {
    
    if (!_bageView) {
        _bageView = [[UILabel alloc] init];
    }
    
    return _bageView;
}


+ (CGFloat)cellHeight {

    return 100;
}

- (void)layoutWithUserProfile:(SKUserProfile *)profile {
    
    
    self.nameLabel.text = profile.name;
}


- (void)fold {


}

- (void)open {


}

@end








