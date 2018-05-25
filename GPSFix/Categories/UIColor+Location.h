//
//  UIColor+Location.h
//  GPSFix
//
//  Created by Taras on 4/16/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import <UIKit/UIColor.h>

@class CLLocation, UIColor;

@interface UIColor (Location)

+ (UIColor *)colorByHorizontalAccuracy:(double)accuracy;
+ (UIColor *)colorByVerticalAccuracy:(double)accuracy;
+ (UIColor *)colorByIntegrityFromLocation:(CLLocation *)location;
+ (UIColor *)colorByTypeFromLocation:(CLLocation *)location;
+ (UIColor *)colorByReferenceFrameFromLocation:(CLLocation *)location;

@end
