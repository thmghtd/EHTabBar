//
//  EHTabBarDemoAppDelegate.m
//  EHTabBarDemo
//
//  Created by Nolan Brown on 12/10/09.
//  Copyright EGG HAUS, Inc. 2009. All rights reserved.
//

#import "EHTabBarDemoAppDelegate.h"
#import "LoginController.h"
#import "SignUpController.h"

@implementation EHTabBarDemoAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
	tabBarController_ = [[EHTabBarController alloc] init];
  
  EHTabBar *tabBar = tabBarController_.tabBar;
  
  tabBar.tabWidth = 100.0;
  tabBar.selectedTextColor = [UIColor lightTextColor];
  tabBar.deselectedTextColor = [UIColor darkTextColor];
  
  tabBarController_.viewControllers = [NSArray arrayWithObjects:
                                       [[[LoginController alloc] init] autorelease],
                                       [[[SignUpController alloc] init] autorelease],
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
