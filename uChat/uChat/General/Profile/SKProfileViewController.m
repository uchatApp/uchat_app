//
//  SKProfileViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/29.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKProfileViewController.h"

#import "SKProfileVCHandler.h"
#import "SKUserProfile.h"

#import "SKProfileEditViewController.h"
#import "UIView+Utils.h"
#import "SKFakeData.h"

@interface SKProfileViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SKProfileVCHandler *handler;
@property (nonatomic, strong) UIButton *rbutton;
@property (nonatomic, assign) BOOL editAble;

@end


@implementation SKProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    _editAble = NO;
    
    _rbutton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   40,
                                                                   40)];
    [_rbutton setTitle:@"编辑" forState:UIControlStateNormal];
    [_rbutton addTarget:self action:@selector(gotoEdit) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rItem = [[UIBarButtonItem alloc] initWithCustomView:_rbutton];
    [_rbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rItem;

    
    _handler = [[SKProfileVCHandler alloc] init];
    _handler.profile = [SKFakeData currentUser];
    self.tableView.delegate = _handler;
    self.tableView.dataSource = _handler;
    self.title = self.handler.profile.name;
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


- (void)gotoEdit {
    
    SKProfileEditViewController *VC = [[SKProfileEditViewController alloc] init];

    [self.navigationController pushViewController:VC animated:NO];
    
}




@end
