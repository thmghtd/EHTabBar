//
//  EHTabBarDemoAppDelegate.m
//  EHTabBarDemo
//
//  Created by Nolan Brown on 12/10/09.
//  Copyright EGG HAUS, Inc. 2009. All rights reserved.
//

#import "EHTabBarDemoAppDelegate.h"

@implementation EHTabBarDemoAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	
	//Set up basic UIView
	UIView *v = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	v.backgroundColor = [UIColor grayColor];
	
	//Instanciate EHTabBar
	EHTabBar *tabBar = [[[EHTabBar alloc] initWithFrame:CGRectMake(0, 20, 320, 65)] autorelease];
	tabBar.delegate = self;
	tabBar.tabWidth = 100.0;
	tabBar.selectedTextColor = [UIColor whiteColor];
	tabBar.deselectedTextColor = [UIColor darkGrayColor];
	
	//Add tabs with a title
	[tabBar setTabs:[NSArray arrayWithObjects:@"Test", @"Hello", nil]];
	[v addSubview:tabBar];
	
	[window addSubview:v];

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)tabBar:(EHTabBar*)tabBar tabSelected:(NSInteger)selectedIndex {
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Tab %d was selected on EHTabBar %@",selectedIndex,tabBar] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
	[errorAlert release];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
