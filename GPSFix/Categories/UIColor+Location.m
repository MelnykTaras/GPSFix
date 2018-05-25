//
//  UIColor+Location.m
//  GPSFix
//
//  Created by Taras on 4/16/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import "UIColor+Location.h"
#import <CoreLocation/CLLocation.h>

@implementation UIColor (Location)

+ (UIColor *)colorByHorizontalAccuracy:(double)accuracy
{
    UIColor *color;
    if (accuracy <= 10) {
        color = [UIColor greenColor];
    } else if (accuracy <= 30) {
        color = [UIColor yellowColor];
    } else if (accuracy <= 65) {
        color = [UIColor orangeColor];
    } else {
        color = [UIColor redColor];
    }
    return color;
}

+ (UIColor *)colorByVerticalAccuracy:(double)accuracy
{
    UIColor *color;
    if (accuracy <= 10) {
        color = [UIColor greenColor];
    } else if (accuracy <= 30) {
        color = [UIColor yellowColor];
    } else if (accuracy <= 65) {
        color = [UIColor orangeColor];
    } else {
        color = [UIColor redColor];
    }
    return color;
}

+ (UIColor *)colorByIntegrityFromLocation:(CLLocation *)location
{
    UIColor *color;
    unsigned integrity = [[location valueForKey:@"integrity"] unsignedIntValue];
    switch (integrity) {
        case 25:
            color = [UIColor cyanColor];
            break;
        case 50:
            color = [UIColor greenColor];
            break;
        case 75:
            color = [UIColor yellowColor];
            break;
        default:
        {
            color = [UIColor magentaColor];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSArray *savedIntegrities = [userDefaults arrayForKey:@"integrities"];
            NSMutableSet *oldPlusNew = [NSMutableSet setWithArray:savedIntegrities];
            [oldPlusNew addObject:@(integrity)];
            [userDefaults setObject:[oldPlusNew allObjects] forKey:@"integrities"];
            [userDefaults synchronize];
            break;
        }
    }
    return color;
}

+ (UIColor *)colorByTypeFromLocation:(CLLocation *)location
{
    UIColor *color;
    int type = [[location valueForKey:@"type"] intValue];
    switch (type) {
        case 1:
            color = [UIColor greenColor];
            break;
        case 4:
            color = [UIColor cyanColor];
            break;
        case 6:
            color = [UIColor yellowColor];
            break;
        case 9:
            color = [UIColor redColor];
            break;
        default:
        {
            color = [UIColor magentaColor];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSArray *savedTypes = [userDefaults arrayForKey:@"types"];
            NSMutableSet *oldPlusNew = [NSMutableSet setWithArray:savedTypes];
            [oldPlusNew addObject:@(type)];
            [userDefaults setObject:[oldPlusNew allObjects] forKey:@"types"];
            [userDefaults synchronize];
            break;
        }
    }
    return color;
}

+ (UIColor *)colorByReferenceFrameFromLocation:(CLLocation *)location
{
    UIColor *color;
    int referenceFrame = [[location valueForKey:@"referenceFrame"] intValue];
    switch (referenceFrame) {
        case 1:
            color = [UIColor greenColor];
            break;
        default:
        {
            color = [UIColor magentaColor];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSArray *savedReferenceFrame = [userDefaults arrayForKey:@"referenceFrames"];
            NSMutableSet *oldPlusNew = [NSMutableSet setWithArray:savedReferenceFrame];
            [oldPlusNew addObject:@(referenceFrame)];
            [userDefaults setObject:[oldPlusNew allObjects] forKey:@"referenceFrames"];
            [userDefaults synchronize];
            break;
        }
    }
    return color;
}

@end
