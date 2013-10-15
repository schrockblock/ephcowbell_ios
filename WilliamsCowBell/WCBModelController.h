//
//  WCBModelController.h
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/15/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WCBDataViewController;

@interface WCBModelController : NSObject <UIPageViewControllerDataSource>

- (WCBDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(WCBDataViewController *)viewController;

@end
