//
//  MapItemViewController.m
//  MapAppointments
//
//  Created by Jeanie House on 10/27/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import "MapItemViewController.h"
#define METERS_PER_MILE 1609.344

@interface MapItemViewController ()

@end

@implementation MapItemViewController
@synthesize mapView,street,city,state, zip,txtHotel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    if (FixedID==0)
    {
       
        street.text=@"";
        city.text=@"";
        state.text=@"";
        zip.text = @"";
    }
    else{
       
        street.text=@"";
        city.text=@"";
        state.text=@"";
        zip.text = @"";
    }
    [self LoadHotel];
}
-(void)dismissKeyboard {
    [street resignFirstResponder];
    [city resignFirstResponder];
    [state resignFirstResponder];
    [zip resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getDirections:(id)sender {
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@ %@",
                               street.text,
                               city.text,
                               state.text,
                               zip.text];
    
    [geocoder geocodeAddressString:addressString
                 completionHandler:^(NSArray *placemarks, NSError *error) {
                     
                     if (error) {
                         NSLog(@"Geocode failed with error: %@", error);
                         return;
                     }
                     
                     if (placemarks && placemarks.count > 0)
                     {
                         CLPlacemark *placemark = placemarks[0];
                         
                         CLLocation *location = placemark.location;
                         _coordinates = location.coordinate;
                         _coordinates = location.coordinate;
                         
                         [self showMap];
                     }
                 }];
    [self dismissKeyboard];
}
- (void)LoadHotel
{
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@ %@",
                               street.text,
                               city.text,
                               state.text,
                               zip.text];
    
    [geocoder geocodeAddressString:addressString
                 completionHandler:^(NSArray *placemarks, NSError *error) {
                     
                     if (error) {
                         NSLog(@"Geocode failed with error: %@", error);
                         return;
                     }
                     
                     if (placemarks && placemarks.count > 0)
                     {
                         CLPlacemark *placemark = placemarks[0];
                         
                         CLLocation *location = placemark.location;
                         _coordinates = location.coordinate;
                         _coordinates = location.coordinate;
                         
                         [self showHotel];
                     }
                 }];
    [self dismissKeyboard];
}


- (void)showMap{
    NSDictionary *address = @{
                              (NSString *)kABPersonAddressStreetKey: street.text,
                              (NSString *)kABPersonAddressCityKey: city.text,
                              (NSString *)kABPersonAddressStateKey: state.text,
                              (NSString *)kABPersonAddressZIPKey: zip.text
                              };
    
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:_coordinates
                          addressDictionary:address];
    
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:place];
    
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving
                              };
    [mapItem openInMapsWithLaunchOptions:options];
    //[mapItem openInMapsWithLaunchOptions:nil];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(_coordinates, 1*METERS_PER_MILE, 1*METERS_PER_MILE);
    
    [mapView setRegion:viewRegion animated:YES];
}
- (void)showHotel{
    NSDictionary *address = @{
                              (NSString *)kABPersonAddressStreetKey: street.text,
                              (NSString *)kABPersonAddressCityKey: city.text,
                              (NSString *)kABPersonAddressStateKey: state.text,
                              (NSString *)kABPersonAddressZIPKey: zip.text
                              };
    
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:_coordinates
                          addressDictionary:address];
    
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:place];
    
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving
                              };
    // [mapItem openInMapsWithLaunchOptions:options];
    //[mapItem openInMapsWithLaunchOptions:nil];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(_coordinates, 1*METERS_PER_MILE, 1*METERS_PER_MILE);
    
    [mapView setRegion:viewRegion animated:YES];
}






@end