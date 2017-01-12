//
//  SKSelfViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/4.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKSelfViewController.h"

#import "SKSelfVCHandler.h"


@interface SKSelfViewController ()

@property (nonatomic, strong) SKSelfVCHandler *handler;

@end


@implementation SKSelfViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.delegate = self.handler;
    self.tableView.dataSource = self.handler;
    
    

}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
    
}

- (SKSelfVCHandler *)handler {
    if (!_handler) {
        _handler = [[SKSelfVCHandler alloc] init];
    }
    return _handler;
}

- (void)dealloc {
    
    NSLog(@"hehe dealloc");
}


@end
