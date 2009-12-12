//
//  EHTabBarDemoAppDelegate.h
//  EHTabBarDemo
//
//  Created by Nolan Brown on 12/10/09.
//  Copyright EGG HAUS, Inc. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EHTabBarController.h"

@interface EHTabBarDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window_;
    EHTabBarController *tabBar_;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) EHTabBarController *tabBar;

@end

