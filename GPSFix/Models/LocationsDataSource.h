//
//  LocationsDataSource.h
//  GPSFix
//
//  Created by Taras on 4/15/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocation;

@protocol LocationsDataSource <NSObject>

- (NSArray <CLLocation *> *)locations;

@end
