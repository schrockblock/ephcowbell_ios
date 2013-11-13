//
//  WCBDataViewController.h
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/15/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCBCowbellPageData.h"

@interface WCBDataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) IBOutlet UIImageView *dataImage;
@property (strong, nonatomic) WCBCowbellPageData *dataObject;

- (IBAction)locationPressed;
- (IBAction)updatePressed;
@end
