//
//  AppDelegate.m
//  PopulationClock
//
//  Created by Fernando Lemos on 14/12/12.
//  Copyright (c) 2012 NetFilter. All rights reserved.
//

#import "AppDelegate.h"
#import "Appirater.h"
#import "InAppPurchaseManager.h"
#import "SimulationEngine.h"
#import "UIColor+NFAppColors.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Style all toolbar buttons
    [[UIBarButtonItem appearance] setBackgroundImage:[UIImage imageNamed:@"barBtn.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    NSDictionary *attrs = @{UITextAttributeTextColor : [UIColor nf_orangeTextColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    // Pre-load the IAP products
    [InAppPurchaseManager sharedInstance];
    
    // Reset the simulation
    [[SimulationEngine sharedInstance] reset];
    
    // Set up appirater
    [Appirater setAppId:@"590689957"];
    [Appirater setDaysUntilPrompt:5];
    [Appirater setUsesUntilPrompt:7];
    [Appirater setTimeBeforeReminding:20];
    [Appirater appEnteredForeground:YES];
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Reset the simulation
    [[SimulationEngine sharedInstance] reset];
}

@end
