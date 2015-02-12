//
//  AppointmentPlace.m
//  MapAppointments
//
//  Created by Jeanie House on 10/15/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import "AppointmentPlace.h"


@implementation AppointmentPlace

- (CLLocationCoordinate2D)coordinate
{
    CLLocationDegrees lat =
    [[self valueForKeyPath:@"latitude"] doubleValue];
    
    CLLocationDegrees lon =
    [[self valueForKeyPath:@"longitude"] doubleValue];
    
    CLLocationCoordinate2D coord =
    CLLocationCoordinate2DMake(lat, lon);
    
    return coord;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    [self setValue:@(newCoordinate.latitude)
        forKeyPath:@"latitude"];
    
    [self setValue:@(newCoordinate.longitude)
        forKeyPath:@"longitude"];
}

- (NSString *)title
{
    return [self valueForKeyPath:@"placeName"];
}

- (NSString *)subtitle
{
    NSString *subtitleString = @"";
    
    NSString *addressString =
    [self valueForKeyPath:@"placeStreetAddress"];
    
    if ([addressString length] > 0)
    {
        NSString *addr =
        [self valueForKeyPath:@"placeStreetAddress"];
        
        NSString *city = [self valueForKeyPath:@"placeCity"];
        NSString *state = [self valueForKeyPath:@"placeState"];
        NSString *zip = [self valueForKeyPath:@"placePostal"];
        
        subtitleString =
        [NSString stringWithFormat:@"%@, %@, %@ %@",
         addr,city,state,zip];
    }
    return subtitleString;
}

- (MKMapRect)boundingMapRect
{
    float metersPerDegreeLat = 111111.0f;
    float radiusMeters = [[self valueForKeyPath:@"displayRadius"] floatValue];
    CLLocationDegrees delta = radiusMeters / metersPerDegreeLat;
    CLLocationDegrees originLatitude = self.coordinate.latitude - delta;
    CLLocationDegrees originLongitude = self.coordinate.longitude - delta;
    
    CLLocationCoordinate2D newOrigin = CLLocationCoordinate2DMake(originLatitude, originLongitude);
    
    MKMapPoint originMapPoint = MKMapPointForCoordinate(newOrigin);
    
    double mapPoints = MKMapPointsPerMeterAtLatitude(self.coordinate.latitude) * radiusMeters;
    
    MKMapRect boundingRect = MKMapRectMake(originMapPoint.x, originMapPoint.y, mapPoints, mapPoints);
    
    return boundingRect;
}


@end
