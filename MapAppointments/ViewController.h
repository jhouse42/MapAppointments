//
//  ViewController.h
//  MapAppointments
//
//  Created by Jeanie House on 10/1/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
    MKPolyline *polyline;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, retain)MKPolygon *polygon;
@property (weak, nonatomic) IBOutlet UISwitch *showHideSwitch;

- (IBAction)showHideOverlay:(id)sender;



@end

