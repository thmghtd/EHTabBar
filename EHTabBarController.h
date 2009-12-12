//
//  EHTabBarController.h
//  EHTabBarDemo
//
//  Created by Shayne Sweeney on 12/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EHTabBar.h"

@interface EHTabBarController : UIViewController <EHTabBarDelegate> {
    EHTabBar *tabBar_;
    NSArray *viewControllers_;
}

@property (nonatomic, readonly) EHTabBar *tabBar;
@property (nonatomic, copy) NSArray *viewControllers;

- (void)setViewControllers:(NSArray *)viewControllers;

@end