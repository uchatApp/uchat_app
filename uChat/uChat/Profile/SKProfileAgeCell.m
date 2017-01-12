//
//  SKProfileAgeCell.m
//  uChat
//
//  Created by zj－db0548 on 16/10/30.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKProfileAgeCell.h"

#import "UIView+Utils.h"

@interface SKProfileAgeCell ()

@property (nonatomic, strong) UIImageView *genderView;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *constellation;

@end

@implementation SKProfileAgeCell

- (instancetype)initWithDic:(NSDictionary *)dic {

    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(0,
                                0,
                                MTScreenWidth,
                                40);
        
        NSString *gender = [dic objectForKey:@"sex"];
        if ([gender isEqualToString:@"M"]) {
            
        }else
            if ([gender isEqualToString:@"F"]) {
                
            
        }
        self.ageLabel.text = [dic objectForKey:@"age"];
        self.constellation.text = [dic objectForKey:@"constellation"];
    }
    
    return self;
}

- (UILabel *)ageLabel {
    
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.genderView.right,
                                                              self.genderView.top,
                                                              30,
                                                              self.genderView.height)];
        _ageLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_ageLabel];
    }
    return _ageLabel;
}

- (UILabel *)constellation {
    
    if (!_constellation) {
        _constellation = [[UILabel alloc] initWithFrame:CGRectMake(self.ageLabel.right + 10,
                                                                   self.genderView.top,
                                                                   40,
                                                                   self.genderView.height)];
        _constellation.backgroundColor = [UIColor greenColor];
         [self.contentView addSubview:_constellation];
        
    }
    return _constellation;
}

- (UIImageView *)genderView {

    if (!_genderView) {
        _genderView = [[UIImageView alloc] initWithFrame:CGRectMake(15,
                                                                    10,
                                                                    20,
                                                                    20)];
         [self.contentView addSubview:_genderView];
       _genderView.backgroundColor = [UIColor redColor];
        
    }
    return _genderView;
}
@end
