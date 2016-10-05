//
//  MTMessageViewController.m
//  MTTalk
//
//  Created by zj－db0548 on 16/9/13.
//  Copyright © 2016年 meitu. All rights reserved.
//

#import "SKMessageViewController.h"


#import <GoogleMobileAds/GoogleMobileAds.h>

#import "SKMessageVCHandler.h"
#import "UIView+Utils.h"




@interface SKMessageViewController ()

@property (nonatomic, strong) SKMessageVCHandler *handler;
@property (nonatomic, strong) GADBannerView *bannerView;

@end


@implementation SKMessageViewController



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

- (SKMessageVCHandler *)handler {
    if (!_handler) {
        _handler = [[SKMessageVCHandler alloc] init];
    }
    return _handler;
}

- (void)dealloc {

    NSLog(@"hehe dealloc");
}

@end
