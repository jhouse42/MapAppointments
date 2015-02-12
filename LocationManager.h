//
//  LocationManager.h
//  MapAppointments
//
//  Created by Jeanie House on 10/15/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h> 


typedef void (^ICFLocationUpdateCompletionBlock)(CLLocation *location, NSError *error);


@interface LocationManager : NSObject <CLLocationManagerDelegate>

+ (LocationManager *)sharedLocationManager;

@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) BOOL hasLocation;
@property (nonatomic, strong) NSError *locationError;
@property (strong, nonatomic) CLGeocoder *geocoder;

//- (void)getLocationWithCompletionBlock:(LocationUpdateCompletionBlock)block;


@end
