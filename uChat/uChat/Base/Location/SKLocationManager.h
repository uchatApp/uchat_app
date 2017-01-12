//
//  SKLocationManager.h
//  uChat
//
//  Created by zj－db0548 on 16/10/8.
//  Copyright © 2016年 amazingSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface SKLocationManager : NSObject

+ (instancetype)sharedManager;

- (void)requestAuthorization;
- (CLAuthorizationStatus)authorizationStatus;
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;
- (CLLocation *)getCurrentLocation;

- (void)getCoordinateByAddress:(NSString *)address completionHandler:(void(^)())block;
- (void)getAddressByLocation:(CLLocation *)location completionHandler:(void(^)())block;

@end
