//
//  SKSearchViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/31.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKSearchViewController.h"

#import "UIView+Utils.h"
#import "SKSegmentCell.h"
#import "SKAddrPickerDelegate.h"
#import "SKUserWebApi.h"
#import "SKAccountManager.h"
#import <TTRangeSlider.h>

@interface SKSearchViewController ()<UITableViewDelegate,
                                    UITableViewDataSource,
                                    TTRangeSliderDelegate>

@property (nonatomic, strong) UILabel *sexLabel;
@property (nonatomic, strong) UIButton *sexBtn;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *distanceLabel;
@property (nonatomic, strong) NSArray *secTitleArray;
@property (nonatomic, strong) NSArray *cellInfoArray;
@property (nonatomic, strong) TTRangeSlider *rangeSlider;
@property (nonatomic, strong) UIPickerView *addrPicker;
@property (nonatomic, strong) SKAddrPickerDelegate *addrHandler;
@property (nonatomic, assign) BOOL isMale;

@end

@implementation SKSearchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initData];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    UIButton *rbutton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   40,
                                                                   40)];
    [rbutton setTitle:@"➕" forState:UIControlStateNormal];
    [rbutton addTarget:self
                action:@selector(search)
      forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rItem = [[UIBarButtonItem alloc] initWithCustomView:rbutton];
    [rbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rItem;

    self.tableView.frame = [UIScreen mainScreen].bounds;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    SKUserProfile *profile = [SKAccountManager getLocalUser];
    
    if ([profile.sex isEqualToString:@"M"]) {
        _isMale = YES;
    }else {
        _isMale = NO;
    }
    
}


- (void)initData{
    
    _secTitleArray = @[@"性别",@"距离",@"年龄",@"家乡",@"高级设置"];
    _cellInfoArray = @[@[@"男",@"女",@"男女不限"],
                       @[@"1km",@"5km",@"10km",@"不限"]];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
        {
            cell = [[SKSegmentCell alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   MTScreenWidth,
                                                                   40)];
            [(SKSegmentCell *)cell adjusetWithInfo:[_cellInfoArray objectAtIndex:indexPath.section]];
            if (_isMale) {
                ((SKSegmentCell *)cell).segMent.selectedSegmentIndex = 1;
                
            }else{
                ((SKSegmentCell *)cell).segMent.selectedSegmentIndex = 0;
            }
            
        }
            break;
         case 1:
        {
            cell = [[SKSegmentCell alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   MTScreenWidth,
                                                                   40)];
            [(SKSegmentCell *)cell adjusetWithInfo:[_cellInfoArray objectAtIndex:indexPath.section]];
            ((SKSegmentCell *)cell).segMent.selectedSegmentIndex = 1;
        }
            break;
        case 2:
        {
            cell = [[UITableViewCell alloc] init];
            [cell.contentView addSubview:self.rangeSlider];
        }
            break;
        case 3:
        {
            cell = [[UITableViewCell alloc] init];
            [cell.contentView addSubview:self.addrPicker];
        }
            break;
        default:
            cell = [[UITableViewCell alloc] init];
            break;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        default:
            break;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _secTitleArray.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                               0,
                                                               MTScreenWidth,
                                                               30)];
    label.text = [_secTitleArray objectAtIndex:section];
    
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            ;
        case 1:
        {
            return 40;
        }
            break;
        case 2:{
            return 50;
        }
            break;
        case 3:
        {
            return 100;
        }
            break;
        default:

            break;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}



- (TTRangeSlider *)rangeSlider {

    if (!_rangeSlider) {
        _rangeSlider = [[TTRangeSlider alloc] initWithFrame:CGRectMake(10,
                                                                       0,
                                                                       MTScreenWidth - 20,
                                                                       50)];
        _rangeSlider.delegate = self;
        _rangeSlider.minValue = 16;
        _rangeSlider.maxValue = 50;
//        _rangeSlider.hideLabels = YES;
        _rangeSlider.tintColor = [UIColor blackColor];
    }
    return _rangeSlider;
}


-(void)rangeSlider:(TTRangeSlider *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum {

    
}


- (UIPickerView *)addrPicker {
    
    if (!_addrPicker) {
        _addrPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     MTScreenWidth,
                                                                     100)];
       NSArray *array = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle]
                                                                  pathForResource:@"area.plist" ofType:nil]];
        _addrHandler = [[SKAddrPickerDelegate alloc] init];
        _addrHandler.dataArray = array;
        _addrHandler.block = ^(NSString *returnValue){
            NSLog(@"%@",returnValue);
        };
        _addrPicker.delegate = _addrHandler;
        _addrPicker.dataSource = _addrHandler;
    }
    return _addrPicker;
}

- (void)search {
    
    SKUserWebApi *api = [[SKUserWebApi alloc] init];
    [api getRecommendWithId:[SKAccountManager getAccount]
                      token:[SKAccountManager getToken]
                        sex:@"M"
                        age:15
                   distance:5
                   province:@"福建"
                       city:@"长乐"
                     career:@"不知哪里"
                    hobbies:@"游泳"
                       page:0
                     target:self
                 okSelector:@selector(okSelector:)
               failSelector:@selector(failSelector:)
               erroSelector:@selector(erro:)];
}

- (void)okSelector:(id)response {
   
}

- (void)failSelector:(id)response {
    
    
}

- (void)erro:(NSError *)errro {
    
}

@end


























