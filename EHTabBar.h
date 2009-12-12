//
//  EHTabBar.h
//  EHTabBarController
//
//  Created by Nolan Brown on 12/10/09.
//  Copyright 2009 EGG HAUS, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EHTab.h"

@class EHTabBar;

@protocol EHTabBarDelegate
- (void)tabBar:(EHTabBar *)tabBar tabSelected:(NSInteger)selectedIndex;
@end

@interface EHTabBar : UIView {
	id<EHTabBarDelegate> _delegate;
	NSInteger _selectedTabIndex;
	NSMutableArray* _tabItems;

	
	UIColor *_borderColor;
	UIColor *_shadowColor;
	UIColor *_tabColor;
	
	UIColor *_selectedTextColor;
	UIColor *_deselectedTextColor;
	
	
	CGFloat _tabWidth;
}
@property (nonatomic) CGFloat tabWidth;

@property (nonatomic, retain) UIColor *selectedTextColor;
@property (nonatomic, retain) UIColor *deselectedTextColor;

@property (nonatomic, retain) UIColor *shadowColor;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, retain) UIColor *tabColor;

@property (nonatomic, assign) id<EHTabBarDelegate> delegate;
@property (nonatomic) NSInteger selectedTabIndex;

- (void)showTabAtIndex:(NSInteger)tabIndex;
- (void) selectTab:(EHTab *)t;
- (void) setTabs:(NSArray *)tbs;

@end