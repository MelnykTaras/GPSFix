//
//  ViewController.m
//  GPSFix
//
//  Created by Taras on 4/15/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import <Corelocation/CLLocation.h>
#import "LocationCell.h"
#import "LabelsFormatter.h"
#import "UIColor+Location.h"

@interface ViewController () <LocationManagerDelegate, UITableViewDataSource> {
    __weak IBOutlet UILabel *labelPoints;
    __weak IBOutlet UILabel *labelTimestamp;
    __weak IBOutlet UILabel *labelCourse;
    __weak IBOutlet UILabel *labelHorizontalAccuracy;
    __weak IBOutlet UILabel *labelVerticalAccuracy;
    __weak IBOutlet UILabel *labelIntegrity;
    __weak IBOutlet UILabel *labelType;
    __weak IBOutlet UILabel *labelReferenceFrame;
    __weak IBOutlet UITableView *locationsTableView;
    
    LocationManager *locationManager;
    NSArray <CLLocation *> *locations;
    NSInteger pointsCounter;
}

@end

@implementation ViewController

#pragma mark - ViewController Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

#pragma mark - Setup

- (void)setup
{
    locationManager = [[LocationManager alloc] initWithLocationManagerDelegate:self];
    [locationManager start];
    locations = [locationManager locations];
}

#pragma mark - LocationManagerDelegate

- (void)onLocationManagerDidUpdateLocation:(CLLocation *)location
{
    double horizontalAccuracy = location.horizontalAccuracy;
    double verticalAccuracy = location.verticalAccuracy;
    
    labelPoints.text = [LabelsFormatter stringFromInteger:++pointsCounter];
    labelTimestamp.text = [LabelsFormatter timeStringFromDate:location.timestamp];
    labelCourse.text = [LabelsFormatter stringFromDouble:location.course];
    labelHorizontalAccuracy.text = [LabelsFormatter stringFromDouble:horizontalAccuracy];
    labelVerticalAccuracy.text = [LabelsFormatter stringFromDouble:verticalAccuracy];
    labelIntegrity.text = [LabelsFormatter integrityStringFromLocation:location];
    labelType.text = [LabelsFormatter typeStringFromLocation:location];
    labelReferenceFrame.text = [LabelsFormatter referenceFrameStringFromLocation:location];

    labelHorizontalAccuracy.backgroundColor = [UIColor colorByHorizontalAccuracy:horizontalAccuracy];
    labelVerticalAccuracy.backgroundColor = [UIColor colorByVerticalAccuracy:verticalAccuracy];
    labelIntegrity.backgroundColor = [UIColor colorByIntegrityFromLocation:location];
    labelType.backgroundColor = [UIColor colorByTypeFromLocation:location];
    labelReferenceFrame.backgroundColor = [UIColor colorByReferenceFrameFromLocation:location];
    
    [locationsTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [locations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    NSInteger locationIndex = pointsCounter - indexPath.row - 1;
    [cell configureWithLocation:locations[locationIndex] locationIndex:locationIndex];
    return cell;
}

@end
