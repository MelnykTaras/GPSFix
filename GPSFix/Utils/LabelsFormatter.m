//
//  LabelsFormatter.m
//  GPSFix
//
//  Created by Taras on 4/16/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import "LabelsFormatter.h"
#import <CoreLocation/CLLocation.h>

@implementation LabelsFormatter

+ (NSString *)stringFromDouble:(double)value
{
    return [NSString stringWithFormat:@"%.lf", value];
}

+ (NSString *)stringFromInteger:(NSInteger)integer
{
    return [NSString stringWithFormat:@"%d", (int)integer];
}

+ (NSString *)timeStringFromDate:(NSDate *)date
{
    static NSDateFormatter *timeFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
        [timeFormatter setDateFormat:@"HH':'mm':'ss"];
    });
    return [timeFormatter stringFromDate:date];
}

+ (NSString *)integrityStringFromLocation:(CLLocation *)location
{
    return [NSString stringWithFormat:@"%u", [[location valueForKey:@"integrity"] unsignedIntValue]];
}

+ (NSString *)typeStringFromLocation:(CLLocation *)location
{
    return [NSString stringWithFormat:@"%d", [[location valueForKey:@"type"] intValue]];
}

+ (NSString *)referenceFrameStringFromLocation:(CLLocation *)location
{
    return [NSString stringWithFormat:@"%d", [[location valueForKey:@"referenceFrame"] intValue]];
}

@end
