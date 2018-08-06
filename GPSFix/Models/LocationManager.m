//
//  LocationManager.m
//  GPSFix
//
//  Created by Taras on 4/15/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIApplication.h>

@interface LocationManager () <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    NSMutableArray<CLLocation *> *_locations;
    __weak id<LocationManagerDelegate> locationManagerDelegate;
}

@end

@implementation LocationManager

#pragma mark - Initialization

- (instancetype)initWithLocationManagerDelegate:(id<LocationManagerDelegate>)delegate
{
    self = [super init];
    if (self) {
        locationManagerDelegate = delegate;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Managing State

- (void)start
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onApplicationWillTerminate:) name:UIApplicationWillTerminateNotification object:nil];
    _locations = [NSMutableArray array];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    if (authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [locationManager requestAlwaysAuthorization];
    } else {
        [self startUpdatingLocation];
    }
}

- (void)startUpdatingLocation
{
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    locationManager.pausesLocationUpdatesAutomatically = NO;
    locationManager.allowsBackgroundLocationUpdates = YES;
    [locationManager startUpdatingLocation];
}

- (void)onApplicationWillTerminate:(NSNotification *)notification
{
    [locationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedAlways) {
        [self startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [_locations addObjectsFromArray:locations];
    [locationManagerDelegate onLocationManagerDidUpdateLocation:[locations lastObject]];
}

#pragma mark - LocationsDataSource

- (NSArray <CLLocation *> *)locations
{
    return _locations;
}

@end
