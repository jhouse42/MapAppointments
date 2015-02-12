//
//  AppointmentPlaceViewController.h
//  MapAppointments
//
//  Created by Jeanie House on 10/15/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"
#import <MapKit/MapKit.h>


@class AppointmentPlaceViewController;

@protocol AppointmentPlaceViewControllerDelegate
- (void)appointmentPlaceViewControllerDidFinish:(AppointmentPlaceViewController *)controller;
- (MKMapItem *)currentLocationMapItem;
- (void)displayDirectionsForRoute:(MKRoute *)route;
@end

@interface AppointmentPlaceViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectModel *appointmentPlaceID;

@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *addressTextField;
@property (nonatomic, strong) IBOutlet UITextField *cityTextField;
@property (nonatomic, strong) IBOutlet UITextField *stateTextField;
@property (nonatomic, strong) IBOutlet UITextField *postalTextField;
@property (nonatomic, strong) IBOutlet UITextField *latitudeTextField;
@property (nonatomic, strong) IBOutlet UITextField *longitudeTextField;
@property (nonatomic, strong) IBOutlet UILabel *geofenceLabel;
@property (nonatomic, strong) IBOutlet UISwitch *displayProximitySwitch;
@property (nonatomic, strong) IBOutlet UILabel *displayRadiusLabel;
@property (nonatomic, strong) IBOutlet UISlider *displayRadiusSlider;
@property (nonatomic, strong) IBOutlet UIButton *geocodeNowButton;

- (IBAction)saveButtonTouched:(id)sender;
- (IBAction)cancelButtonTouched:(id)sender;
- (IBAction)geocodeLocationTouched:(id)sender;
- (IBAction)displayProxitySwitchChanged:(id)sender;
- (IBAction)displayProxityRadiusChanged:(id)sender;
- (IBAction)getDirectionsButtonTouched:(id)sender;
- (IBAction)getDirectionsToButtonTouched:(id)sender;


@end
