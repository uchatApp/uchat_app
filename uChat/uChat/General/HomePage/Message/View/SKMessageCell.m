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
@property (nonatomic, strong) UILabel *sigLabel;
@property (nonatomic, strong) UILabel *bageView;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) UIImageView *sexView;
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
        [self.contentView addSubview:self.sigLabel];
        [self.contentView addSubview:self.bageView];
        [self.contentView addSubview:self.sexView];
        [self.contentView addSubview:self.ageLabel];
        
        UIColor* color=[[UIColor alloc]initWithRed:0.3 green:0.4 blue:0.5 alpha:1];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.backgroundView.backgroundColor = color;
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
                                  25);
        _nameLabel = [[UILabel alloc] initWithFrame:frame];
    }
    
    return _nameLabel;
}


- (UILabel *)sigLabel {
    
    if (!_sigLabel) {
        
        CGRect frame = CGRectMake(5,
                                  self.avatarView.bottom + 10,
                                  MTScreenWidth - 5,
                                  40);
        _sigLabel = [[UILabel alloc] initWithFrame:frame];
        
    }
    
    return _sigLabel;
}

- (UIImageView *)sexView {
    
    if (!_sexView) {
        _sexView = [[UIImageView alloc] initWithFrame:CGRectMake(self.nameLabel.left,
                                                                 self.nameLabel.bottom + 5,
                                                                 20,
                                                                 20)];
        _sexView.backgroundColor = [UIColor yellowColor];
    }
    return _sexView;
}


- (UILabel *)bageView {
    
    if (!_bageView) {
        _bageView = [[UILabel alloc] init];
    }
    
    return _bageView;
}

- (UILabel *)ageLabel {

    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.sexView.right,
                                                              self.sexView.top,
                                                              self.sexView.width,
                                                              self.sexView.height)];
        
    }
    return _ageLabel;
}

+ (CGFloat)cellHeight {

    return 110;
}

- (void)layoutWithUserProfile:(SKUserProfile *)profile {
    
    
    self.nameLabel.text = profile.name;
    self.sigLabel.text = profile.signature;
    self.avatarView.image = [UIImage imageNamed:profile.avatar];
    self.ageLabel.text = @"18";
    if ([profile.sex isEqualToString:@"M"]) {
//            self.sexlabel.text = @"男";
    }else{
//         self.sexlabel.text = @"女";
    }
    
}


- (void)fold {


}

- (void)open {


}

@end








