//
//  TTSecondViewController.h
//  TaxiTaxiApp
//
//  Created by Michael Wawra on 03/11/2011.
//  Copyright (c) 2011 Wawra Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TTManagedObjectContextProtocol.h"
#import <MapKit/MapKit.h>

@interface TTCheckinViewController  : UIViewController <TTManagedObjectContextProtocol, CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    
    IBOutlet UILabel *latitudeLabel;
    IBOutlet UILabel *longitudeLabel;
    IBOutlet UITextField *plateNumberTextView;
    IBOutlet MKMapView *mapView;
    
    UIButton *checkinButton;
    
    IBOutlet UIScrollView *scrollView;
}

@property (nonatomic, retain) CLLocation *currentLocation;
@property (nonatomic, retain) IBOutlet UIButton *checkinButton;
@property (nonatomic, retain) IBOutlet UITextField *plateNumberTextView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

- (IBAction) keyboardDisplayed: (id) sender;
- (IBAction) keyboardHidden: (id) sender;
- (IBAction) checkin:(id)sender;
- (BOOL) createCheckinWithPlate:(NSString*)plateNumber onDate:(NSDate *)when withLongitude:(NSString *)longitude withLatitude:(NSString *)latitude;

@end
