//
//  LabelsFormatter.h
//  GPSFix
//
//  Created by Taras on 4/16/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocation;

@interface LabelsFormatter : NSObject

+ (NSString *)stringFromDouble:(double)value;
+ (NSString *)stringFromInteger:(NSInteger)integer;
+ (NSString *)timeStringFromDate:(NSDate *)date;
+ (NSString *)integrityStringFromLocation:(CLLocation *)location;
+ (NSString *)typeStringFromLocation:(CLLocation *)location;
+ (NSString *)referenceFrameStringFromLocation:(CLLocation *)location;

@end
