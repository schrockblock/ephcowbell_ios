//
//  WCBAppDelegate.m
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/15/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import "Flurry.h"
#import "WCBAppDelegate.h"

@implementation WCBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Flurry setCrashReportingEnabled:YES];
    //note: iOS only allows one crash reporting tool per app; if using another, set to: NO
    [Flurry startSession:@"MRRJDRQ8G577QFP7HP7C"];
    
    // Override point for customization after application launch.
    application.applicationSupportsShakeToEdit = YES;
    
    return YES;
}

@end
