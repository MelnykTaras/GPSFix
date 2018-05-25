//
//  AppDelegate.m
//  GPSFix
//
//  Created by Taras on 4/15/18.
//  Copyright © 2018 Taras Melnyk. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    return YES;
}

@end
