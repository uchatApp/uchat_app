//
//  MTBaseViewController.m
//  MTTalk
//
//  Created by zj－db0548 on 16/9/13.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import "SKBaseViewController.h"

#import "UIView+Utils.h"

@interface SKBaseViewController ()

@property (nonatomic, strong, readwrite) UITableView *tableView;

@end

@implementation SKBaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        CGFloat statusW = [[UIApplication sharedApplication] statusBarFrame].size.height;
        CGRect tableFrame = CGRectMake(0, 0, MTScreenWidth, MTScreenHeight - statusW);
        _tableView = [[UITableView alloc] initWithFrame:tableFrame];
        _tableView.backgroundColor = [UIColor grayColor];
    }
    
    return _tableView;
}


@end
