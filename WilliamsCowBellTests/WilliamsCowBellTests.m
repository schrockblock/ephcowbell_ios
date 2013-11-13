//
//  WilliamsCowBellTests.m
//  WilliamsCowBellTests
//
//  Created by Ellidi Jatgeirsson on 10/15/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WCBShakingPlayingManager.h"
#import "WCBModelController.h"
#import "WCBCowbellPageData.h"

@interface WilliamsCowBellTests : XCTestCase

@end

@implementation WilliamsCowBellTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShakingPlayingManager
{
    WCBShakingPlayingManager *manager = [[WCBShakingPlayingManager alloc] initWithSoundNamed:@"NormalShort"];
    
    XCTAssertTrue(manager, @"Shaking manager not instantiated");
}

@end
