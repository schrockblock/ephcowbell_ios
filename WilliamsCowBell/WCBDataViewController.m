//
//  WCBDataViewController.m
//  WilliamsCowBell
//
//  Created by Ellidi Jatgeirsson on 10/15/13.
//  Copyright (c) 2013 Ellidi Jatgeirsson. All rights reserved.
//

#import <Social/Social.h>
#import "Flurry.h"
#import "WCBDataViewController.h"
#import "WCBShakingPlayingManager.h"

@interface WCBDataViewController () <UIAlertViewDelegate>

@property (nonatomic, strong) WCBShakingPlayingManager *manager;

@end

@implementation WCBDataViewController

- (void)viewDidAppear:(BOOL)animated
{
    [self.manager getReady];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.manager finish];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
    [self.dataImage setImage:[UIImage imageNamed:self.dataObject.imageName]];
    self.manager = [[WCBShakingPlayingManager alloc] initWithSoundNamed:self.dataObject.soundName];
}



- (IBAction)locationPressed
{
    SLComposeViewController *mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    NSDate *homecoming = [NSDate dateWithTimeIntervalSince1970:1383973200000];
    NSDate *dayAfterHomecoming = [NSDate dateWithTimeIntervalSince1970:1384059600000];
    
    if ([[NSDate date] compare:dayAfterHomecoming] == NSOrderedDescending || [[NSDate date] compare:homecoming] == NSOrderedAscending) {
        [mySLComposerSheet setInitialText:@"At a Williams athletics event! Go Ephs!\n\nPosted with Eph Cowbell for iOS"];
    }else{
        [mySLComposerSheet setInitialText:@"At Homecoming! Go Ephs!\n\nPosted with Eph Cowbell for iOS"];
    }
        
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http://itunes.com/apps/williamscowbell"]];
        
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [Flurry logEvent:@"Cancelled facebook post"];
                    });
                    break;
                case SLComposeViewControllerResultDone:
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [Flurry logEvent:@"Posted to facebook"];
                    });
                    break;
                    
                default:
                    break;
            }
        }];
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    
}

- (IBAction)updatePressed
{
    SLComposeViewController *mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if (![self isHomecoming]) {
        [mySLComposerSheet setInitialText:@"Ephs are winning! Woohoo!"];
    }else{
        [mySLComposerSheet setInitialText:@"#ephhomecoming2013 Ephs are winning! Woohoo! The score is... (or some other update)"];
    }
        
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [Flurry logEvent:@"Cancelled twitter post"];
                    });
                    break;
                case SLComposeViewControllerResultDone:
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [Flurry logEvent:@"Posted to twitter"];
                    });
                    break;
                default:
                    break;
            }
            [self dismissViewControllerAnimated:YES completion:nil];
            if ([self isHomecoming]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Homecoming on Twitter" message: @"Take a look at what others are saying about the game on Twitter!" delegate:self cancelButtonTitle:@"Nah, it's cool" otherButtonTitles:@"Show me!",nil];
                [alert show];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Ephs on Twitter" message: @"Checkout Eph Sports on Twitter!" delegate:self cancelButtonTitle:@"Nah, it's cool" otherButtonTitles:@"Show me!",nil];
                [alert show];
            }
        }];
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1 && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]] && [self isHomecoming]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://search?query=%23ephhomecoming2013"]];
    }else if (buttonIndex == 1 && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=ephsports"]];
    }
}

- (BOOL)isHomecoming
{
    NSDate *homecoming = [NSDate dateWithTimeIntervalSince1970:1383973200];
    NSDate *dayAfterHomecoming = [NSDate dateWithTimeIntervalSince1970:1384059600];
    NSDate *now = [NSDate date];
    NSComparisonResult beforeHomecoming = [now compare:homecoming];
    NSComparisonResult afterHomecoming = [now compare:dayAfterHomecoming];
    BOOL isBeforeHomecoming = beforeHomecoming == NSOrderedAscending;
    BOOL isAfterHomcoming = afterHomecoming == NSOrderedDescending;
    
    return !isBeforeHomecoming && !isAfterHomcoming;
}
@end
