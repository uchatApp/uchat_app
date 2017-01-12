//
//  SKRgNameViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/16.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKRgNameViewController.h"

#import "SKRgBirthdayViewController.h"
#import "UIView+Utils.h"

@interface SKRgNameViewController ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *nameFiled;
@property (nonatomic, strong) UIButton *maleBtn;
@property (nonatomic, strong) UIButton *femaleBtn;
@property (nonatomic, strong) UIButton *regitserButton;

@end


@implementation SKRgNameViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.nameFiled];
    [self.view addSubview:self.maleBtn];
    [self.view addSubview:self.femaleBtn];
    [self.view addSubview:self.regitserButton];
    
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                100,
                                                                MTScreenWidth,
                                                                30)];
        _titleLabel.text = @"请设置您的昵称和性别";
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}


- (UITextField *)nameFiled {

    if (!_nameFiled) {
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,
                                                                       self.titleLabel.bottom + 20,
                                                                       50,
                                                                       30)];
        nameLabel.text = @"昵称";
        [self.view addSubview:nameLabel];
        
        _nameFiled = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                   nameLabel.bottom + 20,
                                                                   MTScreenWidth - 40,
                                                                   30)];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                _nameFiled.height - 10,
                                                                _nameFiled.width,
                                                                1)];
        view.backgroundColor = [UIColor grayColor];
        [_nameFiled addSubview:view];

    }
    return _nameFiled;
}


- (UIButton *)maleBtn {

    if (!_maleBtn) {
        _maleBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.nameFiled.left,
                                                              self.nameFiled.bottom + 20,
                                                              20,
                                                              20)];
        [_maleBtn addTarget:self
                       action:@selector(action:)
             forControlEvents:UIControlEventTouchUpInside];
        _maleBtn.backgroundColor = [UIColor blackColor];
        
        UILabel *maleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_maleBtn.right,
                                                                       _maleBtn.top,
                                                                       20,
                                                                       20)];
        maleLabel.text = @"男";
        [self.view addSubview:maleLabel];
        _maleBtn.tag = 1;
    }
    return _maleBtn;
}

- (UIButton *)femaleBtn {
    
    if (!_femaleBtn) {
        _femaleBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.maleBtn.right + 70,
                                                                self.nameFiled.bottom + 20,
                                                                20,
                                                                20)];
        [_femaleBtn addTarget:self
                       action:@selector(action:)
             forControlEvents:UIControlEventTouchUpInside];
        _femaleBtn.backgroundColor = [UIColor blackColor];
        UILabel *femaleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_femaleBtn.right,
                                                                       _femaleBtn.top,
                                                                       20,
                                                                       20)];
        femaleLabel.text = @"女";
        [self.view addSubview:femaleLabel];

        _femaleBtn.tag = 2;
    }
    return _femaleBtn;
}

- (void)action:(UIButton *)button{
    
    
}

- (UIButton *)regitserButton {
    
    if (!_regitserButton) {
        
        _regitserButton = [[UIButton alloc]initWithFrame:CGRectMake(self.nameFiled.left,
                                                                    self.femaleBtn.bottom + 30,
                                                                    self.nameFiled.width,
                                                                    35)];
        [_regitserButton setTitle:@"继续" forState:UIControlStateNormal];
        [_regitserButton addTarget:self
                            action:@selector(gotoNext)
                  forControlEvents:UIControlEventTouchUpInside];
        
        _regitserButton.backgroundColor = [UIColor grayColor];
    }
    
    return _regitserButton;
}

- (void)gotoNext {

    SKRgBirthdayViewController *VC = [[SKRgBirthdayViewController alloc] init];
    VC.uid = self.uid;
    VC.pwd = self.pwd;
    VC.name = self.nameFiled.text;
    
    if (self.maleBtn.selected) {
        VC.gender = @"M";
    }else {
        VC.gender = @"F";
    }
    
    [self.navigationController pushViewController:VC animated:NO];
}


@end
