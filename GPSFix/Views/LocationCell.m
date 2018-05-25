//
//  LocationCell.m
//  GPSFix
//
//  Created by Taras on 4/15/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import "LocationCell.h"
#import <CoreLocation/CLLocation.h>
#import "LabelsFormatter.h"
#import "UIColor+Location.h"

@interface LocationCell () {
    __weak IBOutlet UILabel *number;
    __weak IBOutlet UILabel *time;
    __weak IBOutlet UILabel *course;
    __weak IBOutlet UILabel *hAccuracy;
    __weak IBOutlet UILabel *vAccuracy;
    __weak IBOutlet UILabel *integrity;
    __weak IBOutlet UILabel *type;
    __weak IBOutlet UILabel *referenceFrame;
}

@end

@implementation LocationCell

- (void)configureWithLocation:(CLLocation *)location locationIndex:(NSInteger)locationIndex
{
    double horizontalAccuracy = location.horizontalAccuracy;
    double verticalAccuracy = location.verticalAccuracy;
    
    number.text = [LabelsFormatter stringFromInteger:locationIndex];
    time.text = [LabelsFormatter timeStringFromDate:location.timestamp];
    course.text = [LabelsFormatter stringFromDouble:location.course];
    hAccuracy.text = [LabelsFormatter stringFromDouble:horizontalAccuracy];
    vAccuracy.text = [LabelsFormatter stringFromDouble:verticalAccuracy];
    integrity.text = [LabelsFormatter integrityStringFromLocation:location];
    type.text = [LabelsFormatter typeStringFromLocation:location];
    referenceFrame.text = [LabelsFormatter referenceFrameStringFromLocation:location];
    
    hAccuracy.backgroundColor = [UIColor colorByHorizontalAccuracy:horizontalAccuracy];
    vAccuracy.backgroundColor = [UIColor colorByVerticalAccuracy:verticalAccuracy];
    integrity.backgroundColor = [UIColor colorByIntegrityFromLocation:location];
    type.backgroundColor = [UIColor colorByTypeFromLocation:location];
    referenceFrame.backgroundColor = [UIColor colorByReferenceFrameFromLocation:location];
}

@end
