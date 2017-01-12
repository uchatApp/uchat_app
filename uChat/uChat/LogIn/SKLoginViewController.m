//
//  SKLoginViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/2.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKLoginViewController.h"

#import <Foundation/Foundation.h>

#import "UIView+Utils.h"
#import "SKRegisterViewController.h"
#import "SKUserWebApi.h"
#import "SKAccountManager.h"
#import <MBProgressHUD.h>
#import <RongIMKit/RongIMKit.h>


@interface SKLoginViewController ()

@property (nonatomic, strong) UITextField *idField;
@property (nonatomic, strong) UITextField *pwdField;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *regitserButton;
@property (nonatomic, strong) UILabel *successLabel;

@end


@implementation SKLoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: self.idField];
    [self.view addSubview:self.pwdField];
    [self.view addSubview:self.regitserButton];
    [self.view addSubview:self.loginButton];
    
    
//    SKUserWebApi *api = [[SKUserWebApi alloc] init];
//   
//    SKUserProfile *profile = [[SKUserProfile alloc] init];
//    profile.uid = @"longya";
//    profile.name = @"hehe";
//    profile.sex = @"M";
//    profile.birthday = @"1992.12.28";
//    profile.address = @"sad";
//    profile.hobbies = @"lo,dsa";
//    profile.career = @"dsa,dsa";
//    profile.tags = @"dasfa,hua";
//
//    NSString *token = [SKAccountManager getToken];
//    [api setUserInfoWithProfile:profile
//                       andToken:token
//                         target:self
//                     okSelector:@selector(okSelector:)
//                   failSelector:@selector(failSelector:)
//                   erroSelector:@selector(erro:)];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}

- (UITextField *)idField {
    
    if (!_idField) {
        
        _idField = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                 200,
                                                                 MTScreenWidth - 40,
                                                                 40)];
        _idField.text = [SKAccountManager getAccount];
        _idField.placeholder = @"请输入账号";
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                _idField.height - 10,
                                                                _idField.width,
                                                                1)];
        view.backgroundColor = [UIColor grayColor];
        [_idField addSubview:view];

    }
    return _idField;
}

- (UITextField *)pwdField {

    if (!_pwdField) {
        _pwdField = [[UITextField alloc] initWithFrame:CGRectMake(self.idField.left,
                                                                  self.idField.bottom + 10,
                                                                  self.idField.width,
                                                                  self.idField.height)];
        
        _pwdField.text = [SKAccountManager getPwd];
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

- (UIImageView *)avatarView {

    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(50,
                                                                    self.pwdField.bottom + 20,
                                                                    200,
                                                                    50)];
    }
    return _avatarView;
}

- (UIButton *)loginButton {
    
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(self.regitserButton.right + 20,
                                                                  self.pwdField.bottom + 10,
                                                                  (self.idField.width - 20) / 2,
                                                                  35)];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self
                            action:@selector(login)
                  forControlEvents:UIControlEventTouchUpInside];

        _loginButton.backgroundColor = [UIColor grayColor];
    }
    
    return _loginButton;
}

- (UIButton *)regitserButton {

    if (!_regitserButton) {
        
        _regitserButton = [[UIButton alloc]initWithFrame:CGRectMake(self.idField.left,
                                                                    self.pwdField.bottom + 10,
                                                                    (self.idField.width - 20) / 2,
                                                                    35)];
        [_regitserButton setTitle:@"注册" forState:UIControlStateNormal];
        _regitserButton.backgroundColor = [UIColor grayColor];
        [_regitserButton addTarget:self
                            action:@selector(gotoRegister)
                  forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _regitserButton;
}

- (void)login {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (self.idField.text == nil
        ||[self.idField.text isEqualToString:@""]) {
        
      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"账号不能为空"
                                                                     message:@"请输入正确的账号"
                                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action) {
           
        }];
        [alert addAction:cancelAction];
        [self presentViewController:alert
                           animated:NO
                         completion:nil];
    }else
        if (self.pwdField.text == nil
            ||[self.pwdField.text isEqualToString:@""]) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码不能为空"
                                                                           message:@"请输入正确的密码"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction *action) {
                                                                     
                                                                 }];
            [alert addAction:cancelAction];
            [self presentViewController:alert
                               animated:NO
                             completion:nil];

        
        }else{
        
            SKUserWebApi *api = [[SKUserWebApi alloc] init];
            [api loginWithUid:self.idField.text
                        anPwd:self.pwdField.text
                       target:self
                   okSelector:@selector(okSelector:)
                 failSelector:@selector(failSelector:)
                 erroSelector:@selector(erro:)];

        }
}

- (void)gotoRegister {
    
    SKRegisterViewController *registerVC = [[SKRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:NO];
    
}

- (void)okSelector:(id)response {
    //goto homePage
    //save userProfile
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSDictionary *dic = response;
    NSString *token = [dic objectForKey:@"result"];
    [SKAccountManager saveToken:token];
    [SKAccountManager saveAccount:self.idField.text
                           andPwd:self.pwdField.text];
    
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        printf("登陆的错误码为:%d", status);
        
    } tokenIncorrect:^{
               NSLog(@"token错误");
    }];
    
    [UIView animateWithDuration:0.3
                     animations:^(void){
                         
                         
                     } completion:^(BOOL finished){
                         
                         [self.navigationController popViewControllerAnimated:NO];
                         
                     }];
    [self.navigationController popViewControllerAnimated:NO];
    
}

- (void)failSelector:(id)response {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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





