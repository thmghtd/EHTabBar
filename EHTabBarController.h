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
    NSArray *viewControllers_;
    EHTabBar *tabBar_;
    UIView *containerView_;
}

@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, readonly) EHTabBar *tabBar;

@end