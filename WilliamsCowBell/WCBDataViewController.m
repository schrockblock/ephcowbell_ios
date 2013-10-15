//
//  WCBDataViewController.m
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/15/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import "WCBDataViewController.h"

@interface WCBDataViewController ()

@end

@implementation WCBDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
