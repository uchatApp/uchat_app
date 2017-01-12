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
    self.tabBarController.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        CGFloat statusH = [[UIApplication sharedApplication] statusBarFrame].size.height;
        CGRect tableFrame = CGRectMake(0, 0, MTScreenWidth, MTScreenHeight - statusH);
        _tableView = [[UITableView alloc] initWithFrame:tableFrame
                                                  style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor grayColor];
        
    }
    
    return _tableView;
}

//- (UIView *)headView {
//    
//    if (!_headView) {
//        _headView = [[UIView alloc] initWithFrame:CGRectMake(0,
//                                                             20,
//                                                             MTScreenWidth,
//                                                             44)];
//        _headView.backgroundColor = [UIColor redColor];
//    }
//    return _headView;
//}
@end
