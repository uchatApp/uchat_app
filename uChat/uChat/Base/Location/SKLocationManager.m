//
//  SKLocationManager.m
//  uChat
//
//  Created by zj－db0548 on 16/10/8.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import "SKLocationManager.h"

@interface SKLocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLGeocoder *geoCoder;
@property (nonatomic, strong) NSDate *lastUpdateTime;
@property (nonatomic, strong) CLLocation *location;


@end


@implementation SKLocationManager


- (instancetype)init {
    
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _lastUpdateTime = [NSDate dateWithTimeIntervalSince1970:0];
        _geoCoder = [[CLGeocoder alloc] init];
    }
    return self;
}

+ (instancetype)sharedManager {
    
    static SKLocationManager *shareManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[SKLocationManager alloc] init];
    });
    return shareManager;
}

- (void)requestAuthorization {
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestWhenInUseAuthorization];
    }
}

- (CLAuthorizationStatus)authorizationStatus {

    return [CLLocationManager authorizationStatus];
}

- (void)startUpdatingLocation {
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    CLLocationDistance distance = 50.0;
    _locationManager.distanceFilter = distance;
    
    [_locationManager startUpdatingLocation];
    
}

- (void)stopUpdatingLocation {

    [_locationManager stopUpdatingLocation];
}

- (CLLocation *)getCurrentLocation {

    return nil;
}


- (void)dealloc {

    [_locationManager stopUpdatingLocation];
    _locationManager = nil;
}

//******************************delegate*********************************************//

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    _location = [locations firstObject];
    
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval =  [date timeIntervalSinceDate:_lastUpdateTime];
    
    if (timeInterval >= 60 * 10) {
        // update new location to server;
        
        [self getAddressByLocation:_location
                 completionHandler:nil];
        _lastUpdateTime = date;
    }
    
}


//地理编码和反地理编码

- (void)getCoordinateByAddress:(NSString *)address completionHandler:(void(^)())block; {

    [_geoCoder geocodeAddressString:address
                  completionHandler:^(NSArray<CLPlacemark *> *_Nullable placemarks,
                                      NSError *error){
                      
                      
                  
                  }];
    
    
}

- (void)getAddressByLocation:(CLLocation *)location completionHandler:(void(^)())block{

    
    [_geoCoder reverseGeocodeLocation:location
                    completionHandler:^(NSArray *placemarks, NSError *error){
                    
                        CLPlacemark *placemark=[placemarks firstObject];
                        NSString *city = placemark.locality;
                        NSLog(@"详细信息:%@",city);
                    }];
}


@end


















