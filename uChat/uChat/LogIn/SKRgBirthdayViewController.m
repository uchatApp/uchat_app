//
//  SKRgBirthdayViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/16.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKRgBirthdayViewController.h"
#import "UIView+Utils.h"
#import "SKUserWebApi.h"

@interface SKRgBirthdayViewController()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *dateFiled;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIButton *regitserButton;

@end

@implementation SKRgBirthdayViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.datePicker];
    [self.view addSubview:self.dateFiled];
    [self.view addSubview:self.regitserButton];

}
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                100,
                                                                MTScreenWidth,
                                                                30)];
        _titleLabel.text = @"请填写您的生日";
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

- (UIDatePicker *)datePicker {
    
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(30,
                                                                     self.dateFiled.bottom + 30,
                                                                     MTScreenWidth - 60,
                                                                     100)];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        NSDate *maxDate = [NSDate date];
        _datePicker.maximumDate = maxDate;
        [ _datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];

    }
    
    return _datePicker;
}

- (UIButton *)regitserButton {
    
    if (!_regitserButton) {
        
        _regitserButton = [[UIButton alloc]initWithFrame:CGRectMake(30,
                                                                    MTScreenHeight - 35 - 30,
                                                                    MTScreenWidth - 60,
                                                                    35)];
        [_regitserButton setTitle:@"继续" forState:UIControlStateNormal];
        [_regitserButton addTarget:self
                            action:@selector(gotoNext)
                  forControlEvents:UIControlEventTouchUpInside];
        
        _regitserButton.backgroundColor = [UIColor grayColor];
    }
    
    return _regitserButton;
}

- (UITextField *)dateFiled {
    
    if ( !_dateFiled) {
        _dateFiled = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                   self.titleLabel.bottom + 40,
                                                                   MTScreenWidth - 60,
                                                                   30)];
        
        _dateFiled.enabled = NO;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                _dateFiled.height - 10,
                                                                _dateFiled.width,
                                                                1)];
        view.backgroundColor = [UIColor grayColor];
        [_dateFiled addSubview:view];

    }
    return _dateFiled;
}

-(void)dateChanged:(id)sender{
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate *date = control.date;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSString *string = [dateFormatter stringFromDate:date];
    self.dateFiled.text = string;
    /*添加你自己响应代码*/
}

- (void)gotoNext {
    
    SKUserWebApi *api = [[SKUserWebApi alloc] init];
    [api registerWithUid:_uid
                     pwd:_pwd
                    name:_name
                     sex:_gender
                birthday:_dateFiled.text
                  target:self
              okSelector:@selector(okSelector:)
            failSelector:@selector(failSelector:)
            erroSelector:@selector(erro:)];
   

}


- (void)okSelector:(id)response {
    //go to login page
    
    UINavigationController *VC = self.navigationController;
    [VC popViewControllerAnimated:NO];
    [VC popViewControllerAnimated:NO];
    [VC popViewControllerAnimated:NO];
    
    
}

- (void)failSelector:(id)response {
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"网络连接错误"
                                                                   message:@"请重新连接"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                             
                                                         }];
    [alert addAction:cancelAction];
    [self presentViewController:alert
                       animated:NO
                     completion:nil];
    
    
}

- (void)erro:(NSError *)errro {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号或密码不正确"
                                                                   message:@"请重新输入"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                             
                                                         }];
    [alert addAction:cancelAction];
    [self presentViewController:alert
                       animated:NO
                     completion:nil];
    
    
}


@end
