//
//  SKFriViewController.m
//  uChat
//
//  Created by zj－db0548 on 16/10/30.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKFriViewController.h"


#import <GoogleMobileAds/GoogleMobileAds.h>

#import "SKFriVCHandler.h"
#import "UIView+Utils.h"
#import "SKFakeData.h"




@interface SKFriViewController ()

@property (nonatomic, strong) SKFriVCHandler *handler;
@property (nonatomic, strong) GADBannerView *bannerView;

@end


@implementation SKFriViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.delegate = self.handler;
    self.tableView.dataSource = self.handler;
    
    
    
    
    GADAdSize size = GADAdSizeFromCGSize(CGSizeMake(MTScreenWidth, 50));
    _bannerView = [[GADBannerView alloc] initWithAdSize:size];
    
    
    _bannerView.frame = CGRectMake(0,
                                   0,
                                   MTScreenWidth,
                                   50);
    
    _bannerView.adUnitID = @"ca-app-pub-9435427819697575/7724933240";
    _bannerView.rootViewController = self;
    GADRequest *request = [GADRequest request];
    //    request.testDevices = @[@"3a0feb82829fd6e5126e283c823dd436" ];
    [_bannerView loadRequest:request];
    _bannerView.backgroundColor = [UIColor redColor];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
    
}


- (SKFriVCHandler *)handler {
    if (!_handler) {
        _handler = [[SKFriVCHandler alloc] init];
        _handler.dataArray = [[SKFakeData friends] mutableCopy];
    }
    return _handler;
}

- (void)dealloc {
    
    NSLog(@"hehe dealloc");
}

@end
