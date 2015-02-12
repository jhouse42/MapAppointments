//
//  ViewController.m
//  MapAppointments
//
//  Created by Jeanie House on 10/1/14.
//  Copyright (c) 2014 Jeanie House. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnnotations.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize polygon;
@synthesize showHideSwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    [_mapView setDelegate:self];
    
    CLLocationCoordinate2D regionCenter;
    regionCenter.latitude = 35.960638;
    regionCenter.longitude = -83.920739;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(regionCenter, 10000, 10000);
    [_mapView setRegion:region animated:TRUE];
    
    //Create the array of map points
    MKMapPoint *pointsArray = malloc(sizeof(CLLocationCoordinate2D)*4);
    pointsArray[0]=MKMapPointForCoordinate(CLLocationCoordinate2DMake(35.967242,-83.957044));
    
    pointsArray[1]=MKMapPointForCoordinate(CLLocationCoordinate2DMake(35.945554,-83.940401));
    
    pointsArray[2]=MKMapPointForCoordinate(CLLocationCoordinate2DMake(35.951144,-83.925207));
    
    pointsArray[3]=MKMapPointForCoordinate(CLLocationCoordinate2DMake(35.9544296,-83.925979));
    
    //Pass the array to the MKPolyline instance and add the overlay to the map view
    polygon = [MKPolygon polygonWithPoints:pointsArray count:4];
    [ _mapView addOverlay:polygon];
    
    for (int i = 0; i<4; i++) {
        
        CustomAnnotations *annotation = [[CustomAnnotations alloc]initWithLocation: MKCoordinateForMapPoint(pointsArray[i]) title: [NSString stringWithFormat:@"Appointment Annotation. %i", i] andSubtitle:[NSString stringWithFormat:@"This is appointment. %i", i]];
        [_mapView addAnnotation:annotation];
        
    }
    free(pointsArray);
    
}

- (MKOverlayView *)mapView:(MKMapView *)theMapView viewForOverlay:(id )overlay

{
    
    
    MKPolygonView  * polygonView = [[MKPolygonView alloc] initWithPolygon:polygon];
    
    
    polygonView.fillColor = [UIColor colorWithWhite:0.2 alpha:0.5];
    
    polygonView.strokeColor = [UIColor redColor];
    
    polygonView.lineWidth = 3;
    
    return polygonView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showHideOverlay:(id)sender {
    
    if(showHideSwitch.on) {
        [_mapView addOverlay:polygon];
    }
    
    else {
        
        [_mapView removeOverlay:polygon];
    }
}


@end
