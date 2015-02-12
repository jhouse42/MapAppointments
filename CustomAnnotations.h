//
//  CustomAnnotations.h
//  MapAppointments
//
//  Created by Jeanie House on 10/1/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotations : NSObject <MKAnnotation> {
    
    // Declare the coordinate variable
    CLLocationCoordinate2D coordinate;
    // Declare the variable for the title
    NSString *title;
    // Declare the variable for the subtitle
    NSString *subtitle;
    
}
// Define the properties for the declared variables
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


//Declare the initialization method
- (id)initWithLocation:(CLLocationCoordinate2D)coords title:(NSString *)aTitle andSubtitle:(NSString*)aSubtitle;



@end
