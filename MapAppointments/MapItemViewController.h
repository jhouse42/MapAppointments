//
//  MapItemViewController.h
//  MapAppointments
//
//  Created by Jeanie House on 10/27/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>
#import "AppDelegate.h"

@interface MapItemViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *street;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *state;
@property (strong, nonatomic) IBOutlet UITextField *zip;
@property CLLocationCoordinate2D coordinates;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)getDirections:(id)sender;

- (void)showMap;

@property (strong, nonatomic) IBOutlet UITextField *txtHotel;




@end