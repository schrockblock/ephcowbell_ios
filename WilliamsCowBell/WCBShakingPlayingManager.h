//
//  WCBShakingPlayingManager.h
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/21/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCBShakingPlayingManager : NSObject

- (id)initWithSoundNamed:(NSString *)soundName;
- (void)getReady;
- (void)finish;
@end
