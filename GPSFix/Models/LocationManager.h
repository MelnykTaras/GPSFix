//
//  LocationManager.h
//  GPSFix
//
//  Created by Taras on 4/15/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationManagerDelegate.h"
#import "LocationsDataSource.h"

@interface LocationManager : NSObject <LocationsDataSource>

- (instancetype)initWithLocationManagerDelegate:(id<LocationManagerDelegate>)delegate;
- (void)start;

@end
