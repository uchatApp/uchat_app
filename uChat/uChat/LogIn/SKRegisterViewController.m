//
//  SKRegisterViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/3.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKRegisterViewController.h"

#import "UIView+Utils.h"
#import "SKUserWebApi.h"

#import "SKRgNameViewController.h"
@interface SKRegisterViewController ()

@property (nonatomic, strong) UITextField *idField;
@property (nonatomic, strong) UITextField *pwdField;
@property (nonatomic, strong) UITextField *rpwdField;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UIButton *regitserButton;
@property (nonatomic, strong) UIButton *goOnBtn;
@property (nonatomic, strong) UILabel *titleLabel;


@end


@implementation SKRegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: self.idField];
    [self.view addSubview: self.pwdField];
    [self.view addSubview: self.rpwdField];
    [self.view addSubview:self.regitserButton];
    [self.view addSubview:self.titleLabel];
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                100,
                                                                MTScreenWidth,
                                                                30)];
        _titleLabel.text = @"请设置您账号和密码";
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

- (UITextField *)idField {
    
    if (!_idField) {
        
        _idField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                 200,
                                                                 MTScreenWidth - 40,
                                                                 40)];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                _idField.height - 10,
                                                                _idField.width,
                                                                1)];
        view.backgroundColor = [UIColor grayColor];
        [_idField addSubview:view];
        _idField.placeholder = @"请输入账号";
//        _idField.backgroundColor = [UIColor redColor];
    }
    return _idField;
}

- (UITextField *)pwdField {
    
    if (!_pwdField) {
        _pwdField = [[UITextField alloc] initWithFrame:CGRectMake(self.idField.left,
                                                                  self.idField.bottom + 10,
                                                                  self.idField.width,
                                                                  self.idField.height)];
        _pwdField.borderStyle = UITextBorderStyleNone;
        
        _pwdField.secureTextEntry = YES;
        _pwdField.placeholder = @"请输入密码";
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                _pwdField.height - 10,
                                                                _pwdField.width,
                                                                1)];
        view.backgroundColor = [UIColor grayColor];
        [_pwdField addSubview:view];

        
    }
    return _pwdField;
}

- (UITextField *)rpwdField {
    
    if (!_rpwdField) {
        
        _rpwdField = [[UITextField alloc] initWithFrame:CGRectMake(self.idField.left,
                                                                   self.pwdField.bottom + 10,
                                                                   self.idField.width,
                                                                   self.idField.height)];
        
        _rpwdField.secureTextEntry = YES;
        _rpwdField.placeholder = @"请确认密码";
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                _rpwdField.height - 10,
                                                                _rpwdField.width,
                                                                1)];
        view.backgroundColor = [UIColor grayColor];
        [_rpwdField addSubview:view];

    }
    return _rpwdField;
}

- (UIImageView *)avatarView {
    
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(50,
                                                                    self.rpwdField.bottom + 20,
                                                                    200,
                                                                    50)];
    }
    return _avatarView;
}


- (UIButton *)regitserButton {
    
    if (!_regitserButton) {
        
        _regitserButton = [[UIButton alloc]initWithFrame:CGRectMake(self.idField.left + 20,
                                                                    self.rpwdField.bottom + 30,
                                                                    self.idField.width -40,
                                                                    35)];
        [_regitserButton setTitle:@"注册并接受" forState:UIControlStateNormal];
        [_regitserButton addTarget:self
                            action:@selector(registerUser)
                  forControlEvents:UIControlEventTouchUpInside];
        
        _regitserButton.backgroundColor = [UIColor grayColor];
    }
    
    return _regitserButton;
}


- (void)check {


}
- (void)registerUser {
    
    SKRgNameViewController *nameView = [[SKRgNameViewController alloc] init];
    nameView.pwd = self.pwdField.text;
    nameView.uid = self.idField.text;
    [self.navigationController pushViewController:nameView animated:NO];
    
//    SKUserWebApi *api = [[SKUserWebApi alloc] init];
//    [api registerWithUid:self.idField.text
//                   anPwd:self.pwdField.text
//                  target:self
//              okSelector:@selector(okSelector:)
//            failSelector:@selector(failSelector:)
//            erroSelector:@selector(erro:)];

}

- (void)okSelector:(id)response {
    //goto loginPage
    
    [UIView animateWithDuration:0.3
                     animations:^(void){
                         
                         
                     } completion:^(BOOL finished){
                        
                         [self.navigationController popViewControllerAnimated:NO];
                     
                     }];
    
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)failSelector:(id)response {

}

- (void)erro:(NSError *)errro {

}



@end
