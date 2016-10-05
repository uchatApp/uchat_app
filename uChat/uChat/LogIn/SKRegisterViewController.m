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

@interface SKRegisterViewController ()

@property (nonatomic, strong) UITextField *idField;
@property (nonatomic, strong) UITextField *pwdField;
@property (nonatomic, strong) UITextField *rpwdField;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UIButton *regitserButton;


@end


@implementation SKRegisterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: self.idField];
    [self.view addSubview: self.pwdField];
    [self.view addSubview: self.rpwdField];
    [self.view addSubview:self.regitserButton];
    
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (UITextField *)idField {
    
    if (!_idField) {
        
        _idField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                 200,
                                                                 MTScreenWidth - 40,
                                                                 40)];
        _idField.backgroundColor = [UIColor redColor];
    }
    return _idField;
}

- (UITextField *)pwdField {
    
    if (!_pwdField) {
        _pwdField = [[UITextField alloc] initWithFrame:CGRectMake(self.idField.left,
                                                                  self.idField.bottom + 10,
                                                                  self.idField.width,
                                                                  self.idField.height)];
        _pwdField.backgroundColor = [UIColor blueColor];
        _pwdField.secureTextEntry = YES;
        
    }
    return _pwdField;
}

- (UITextField *)rpwdField {
    
    if (!_rpwdField) {
        
        _rpwdField = [[UITextField alloc] initWithFrame:CGRectMake(self.idField.left,
                                                                   self.pwdField.bottom + 10,
                                                                   self.idField.width,
                                                                   self.idField.height)];
         _rpwdField.backgroundColor = [UIColor blueColor];
        _rpwdField.secureTextEntry = YES;
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
        
        _regitserButton = [[UIButton alloc]initWithFrame:CGRectMake(self.idField.left,
                                                                    self.rpwdField.bottom + 10,
                                                                    self.idField.width,
                                                                    35)];
        [_regitserButton setTitle:@"注册" forState:UIControlStateNormal];
        [_regitserButton addTarget:self
                            action:@selector(registerUser)
                  forControlEvents:UIControlEventTouchUpInside];
        
        _regitserButton.backgroundColor = [UIColor grayColor];
    }
    
    return _regitserButton;
}

- (void)registerUser {
    
    SKUserWebApi *api = [[SKUserWebApi alloc] init];
    [api registerWithUid:self.idField.text
                   anPwd:self.pwdField.text
                  target:self
              okSelector:@selector(okSelector:)
            failSelector:@selector(failSelector:)
            erroSelector:@selector(erro:)];

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
