//
//  SKSettingViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/11/13.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKSettingViewController.h"

@interface SKSettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;


@end


@implementation SKSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}


- (void)initData {

    _dataArray = [NSMutableArray arrayWithCapacity:2];

    [_dataArray addObject:@"密码修改"];
    [_dataArray addObject:@"登出"];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleValue1
                             reuseIdentifier:@"settingCell"];
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}




@end
