//
//  CustomAnnotations.m
//  MapAppointments
//
//  Created by Jeanie House on 10/1/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import "CustomAnnotations.h"

@implementation CustomAnnotations

@synthesize coordinate, title, subtitle;

//Implement the initialization method

- (id)initWithLocation:(CLLocationCoordinate2D)coords title:(NSString *)aTitle andSubtitle:(NSString*)aSubtitle

{
    self = [super init];
    coordinate = coords;
    title = aTitle;
    subtitle = aSubtitle;
    return self;
}

@end
