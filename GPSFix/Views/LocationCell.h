//
//  LocationCell.h
//  GPSFix
//
//  Created by Taras on 4/15/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLLocation;

@interface LocationCell : UITableViewCell

- (void)configureWithLocation:(CLLocation *)location locationIndex:(NSInteger)locationIndex;

@end
