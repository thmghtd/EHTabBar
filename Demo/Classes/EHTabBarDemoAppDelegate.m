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

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
	tabBarController_ = [[EHTabBarController alloc] init];
    
    EHTabBar *tabBar = tabBarController_.tabBar;
    
    tabBar.tabWidth = 100.0;
    tabBar.selectedTextColor = [UIColor whiteColor];
    tabBar.deselectedTextColor = [UIColor darkGrayColor];
    
    tabBarController_.viewControllers = [NSArray arrayWithObjects:
                               [[[EggHausViewController alloc] init] autorelease],
                               [[[CurrentTimeViewController alloc] init] autorelease],
                               nil];
    
    [window_ addSubview:tabBarController_.view];
    
    [window_ makeKeyAndVisible];
}

- (void)dealloc {
    [tabBarController_ release];
    tabBarController_ = nil;
    
    [window_ release];
    window_ = nil;
    [super dealloc];
}


@end
