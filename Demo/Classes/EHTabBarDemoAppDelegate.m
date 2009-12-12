//
//  EHTabBarDemoAppDelegate.m
//  EHTabBarDemo
//
//  Created by Nolan Brown on 12/10/09.
//  Copyright EGG HAUS, Inc. 2009. All rights reserved.
//

#import "EHTabBarDemoAppDelegate.h"
#import "EggHausViewController.h"
#import "CurrentTimeViewController.h"

@implementation EHTabBarDemoAppDelegate

@synthesize window = window_;
@synthesize tabBar = tabBar_;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
	self.tabBar = [[EHTabBarController alloc] init];
    
    EggHausViewController *vc1 = [[[EggHausViewController alloc] init] autorelease];
    CurrentTimeViewController *vc2 = [[[CurrentTimeViewController alloc] init] autorelease];
    
    [tabBar_ setViewControllers:[NSArray arrayWithObjects:vc1, vc2, nil]];
    
    [window_ addSubview:tabBar_.view];
    
    [window_ makeKeyAndVisible];
}


- (void)tabBar:(EHTabBar*)tabBar tabSelected:(NSInteger)selectedIndex {
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Tab %d was selected on EHTabBar %@",selectedIndex,tabBar] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
	[errorAlert release];
}

- (void)dealloc {
    [window_ release];
    [super dealloc];
}


@end
