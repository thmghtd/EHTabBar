//
//  EHTabBarController.m
//  EHTabBarDemo
//
//  Created by Shayne Sweeney on 12/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EHTabBarController.h"
#import "EHTabBar.h"

@implementation EHTabBarController

@synthesize tabBar = tabBar_;
@synthesize viewControllers = viewControllers_;

- (id)init {
    if (self = [super init]) {
        tabBar_ = [[[EHTabBar alloc] initWithFrame:CGRectMake(0, 20, 320, 65)] retain];
        tabBar_.delegate = self;
        tabBar_.tabWidth = 100.0;
        tabBar_.selectedTextColor = [UIColor whiteColor];
        tabBar_.deselectedTextColor = [UIColor darkGrayColor];
        
        [self.view addSubview:tabBar_];
        self.view.backgroundColor = tabBar_.backgroundColor;
    }
    return self;
}

- (void)setViewControllers:(NSArray *)viewControllers {
    // TEMP HACK
    NSMutableArray *titles = [NSMutableArray array];
    for (UIViewController *vc in viewControllers) {
        [titles addObject:vc.title];
    }
    [tabBar_ setTabs:titles];
}

#pragma mark -
#pragma mark EHTabBarDelegate methods

- (void)tabBar:(EHTabBar *)tabBar tabSelected:(NSInteger)selectedIndex {
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Tab %d was selected on EHTabBar %@",selectedIndex,tabBar] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
	[errorAlert release];
}

@end