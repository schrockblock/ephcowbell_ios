//
//  WCBCowbellPageData.h
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/16/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCBCowbellPageData : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *soundName;

- (id)initWithTitle:(NSString *)title image:(NSString *)imageName sound:(NSString *)soundName;

@end
