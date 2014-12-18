//
//  TCFMapViewController.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/7/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFMapViewController.h"
#import "TCFLocationManager.h"
#import "TCFSearchOperation.h"
#import "TCFCompactVenueModel.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TCFMapViewController () <MKMapViewDelegate,TCFLocationObserver>

@property (nonatomic,weak) IBOutlet MKMapView * mapView;

@end

@implementation TCFMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self didChangeLocationAuthorizationStatus:[CLLocationManager authorizationStatus]];
    
    [TCFLocationManager registerObserver:self];
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    if(mapView.region.span.latitudeDelta>0.3 || mapView.region.span.longitudeDelta>0.3) {
        return;
    }
    else {
        TCFSearchOperation * operation = [[TCFSearchOperation alloc] initWithLocation:mapView.region.center andRange:MAX(mapView.region.span.latitudeDelta, mapView.region.span.longitudeDelta)];
        operation.responseBlock = ^(NSDictionary* output) {
            [self updateAnnotations:[output allValues]];
        };
        [operation start];
    }
}

-(void)updateAnnotations:(NSArray*)newAnnotations {
    NSMutableArray * annotations = [self.mapView.annotations mutableCopy];
    [annotations removeObjectsInArray:self.mapView.selectedAnnotations];
    [self.mapView removeAnnotations:annotations];
    
    [self.mapView addAnnotations:newAnnotations];
}

-(void)didChangeLocationAuthorizationStatus:(CLAuthorizationStatus)authStatus {
    if(authStatus==kCLAuthorizationStatusAuthorizedWhenInUse || authStatus==kCLAuthorizationStatusAuthorizedAlways) {
        self.mapView.delegate = self;
        self.mapView.showsUserLocation = YES;
        [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    }
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView * view = nil;
    if(annotation!=mapView.userLocation) {
        MKAnnotationView * view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"reuse"];
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.canShowCallout = YES;
    }
    return view;
}

-(UIButton*)rightCalloutButton {
    
    return nil;
}

@end
