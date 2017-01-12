//
//  SKProfileEditViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/11/6.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKProfileEditViewController.h"

#import "SKFakeData.h"
#import "SKProfileEditVCHandler.h"
#import "UIView+Utils.h"



@interface SKProfileEditViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SKProfileEditVCHandler *handler;
@property (nonatomic, strong) UIButton *rbutton;
@property (nonatomic, assign) BOOL editAble;

@end


@implementation SKProfileEditViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    _editAble = NO;
    
    _rbutton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                          0,
                                                          40,
                                                          40)];
    [_rbutton setTitle:@"保存" forState:UIControlStateNormal];
    [_rbutton addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rItem = [[UIBarButtonItem alloc] initWithCustomView:_rbutton];
    [_rbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rItem;
    
    
    _handler = [[SKProfileEditVCHandler alloc] init];
    _handler.profile = [SKFakeData currentUser];
    self.tableView.delegate = _handler;
    self.tableView.dataSource = _handler;
    self.title = @"编辑资料";
}


- (UITableView *)tableView {
    
    if (!_tableView) {
        
        CGRect tableFrame = CGRectMake(0, 0, MTScreenWidth, MTScreenHeight);
        _tableView = [[UITableView alloc] initWithFrame:tableFrame
                                                  style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor grayColor];
    }
    
    return _tableView;
}


- (void)save {
    
    
    
}



@end
