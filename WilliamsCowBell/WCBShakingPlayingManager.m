//
//  WCBShakingPlayingManager.m
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/21/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>
#import "WCBShakingPlayingManager.h"

@interface WCBShakingPlayingManager()

@property (nonatomic, strong) AVAudioPlayer *player;
@property (strong, nonatomic) CMMotionManager *motionManager;

@property (nonatomic) CMAcceleration lastAcceleration;
@property (nonatomic) BOOL isInShakingState;

@end

#define CONTINUE_THRESHOLD .2
#define START_THRESHOLD .8

@implementation WCBShakingPlayingManager

- (id)initWithSoundNamed:(NSString *)soundName
{
    self = [[WCBShakingPlayingManager alloc] init];
    if (self) {
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:soundName ofType: @"mp3"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
        AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
        self.player = newPlayer;
    }
    return self;
}

- (void)getReady
{
    self.player.numberOfLoops = -1;
    self.player.currentTime = 0;
    self.player.volume = 1.0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .1;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 if (self.isInShakingState && ![self isShakingNow:accelerometerData.acceleration]){
                                                     self.isInShakingState = NO;
                                                     [self.player stop];
                                                 }else if (!self.isInShakingState && [self isBeginningToShake:accelerometerData.acceleration]){
                                                     self.isInShakingState = YES;
                                                     self.player.numberOfLoops = -1;
                                                     [self.player play];
                                                 }
                                                 
                                                 if(error){
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
}

- (void)finish
{
    [self.motionManager stopAccelerometerUpdates];
}

- (BOOL)isBeginningToShake:(CMAcceleration)acceleration
{
    double
    deltaX = fabs(self.lastAcceleration.x - acceleration.x),
    deltaY = fabs(self.lastAcceleration.y - acceleration.y);
    
    self.lastAcceleration = acceleration;
    
    return (deltaX > START_THRESHOLD || deltaY > START_THRESHOLD);
}

- (BOOL)isShakingNow:(CMAcceleration)acceleration
{
    double
    deltaX = fabs(self.lastAcceleration.x - acceleration.x),
    deltaY = fabs(self.lastAcceleration.y - acceleration.y);
    
    self.lastAcceleration = acceleration;
    
    return (deltaX > CONTINUE_THRESHOLD || deltaY > CONTINUE_THRESHOLD);
}
@end
