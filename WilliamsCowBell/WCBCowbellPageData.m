//
//  WCBCowbellPageData.m
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/16/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import "WCBCowbellPageData.h"

@implementation WCBCowbellPageData

- (id)initWithTitle:(NSString *)title image:(NSString *)imageName sound:(NSString *)soundName
{
    self = [super init];
    if (self) {
        self.title = title;
        self.imageName = imageName;
        self.soundName = soundName;
    }
    return self;
}

- (NSString *)description
{
    return self.title;
}

@end
