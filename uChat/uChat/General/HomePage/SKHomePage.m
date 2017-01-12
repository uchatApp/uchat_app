//
//  SKHomePage.m
//  uChat
//
//  Created by zj－db0548 on 16/10/6.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKHomePage.h"

#import "SKSearchViewController.h"


@interface SKHomePage ()

@end


@implementation SKHomePage


- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  40,
                                                                  40)];
    [button setTitle:@"友聊" forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = leftItem;

    
    UIButton *rbutton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  40,
                                                                  40)];
    [rbutton setTitle:@"➕" forState:UIControlStateNormal];
    [rbutton addTarget:self
                action:@selector(gotoSearchView)
      forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rItem = [[UIBarButtonItem alloc] initWithCustomView:rbutton];
    [rbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rItem;


}
- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    
}

- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController {

    [super setSelectedViewController:selectedViewController];
    self.navigationItem.title = selectedViewController.title;
}

- (void)gotoSearchView {
    
    SKSearchViewController *VC = [[SKSearchViewController alloc] init];
    [self.navigationController pushViewController:VC animated:NO];
}
@end
