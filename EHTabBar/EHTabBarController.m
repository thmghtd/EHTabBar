//
//  EHTabBarController.m
//  EHTabBarDemo
//
//  Created by Shayne Sweeney on 12/11/09.
//

#import "EHTabBarController.h"
#import "EHTabBar.h"

@implementation EHTabBarController

@synthesize tabBar = tabBar_, viewControllers = viewControllers_;

- (id)init {
  if (self = [super init]) {
    tabBar_ = [[EHTabBar alloc] init];
    tabBar_.delegate = self;
    
    viewControllers_ = [[NSArray alloc] init];
    
    containerView_ = nil;
  }
  return self;
}

- (void)dealloc {
  [viewControllers_ release];
  [containerView_ release];
  [tabBar_ release];
  [super dealloc];
}

- (void)loadView {
  [super loadView];
  self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
  [self.view addSubview:tabBar_];
  
  containerView_ = [[UIView alloc] initWithFrame:
                    CGRectMake(0, tabBar_.frame.size.height, 320, self.view.frame.size.height - tabBar_.frame.size.height)];
  
  [self.view addSubview:containerView_];
  
  [self tabBar:tabBar_ tabSelected:0];
}

- (void)setViewControllers:(NSArray *)viewControllers {
  [viewControllers_ autorelease];
  viewControllers_ = [viewControllers copy];
  
  NSMutableArray *titles = [NSMutableArray array];
  
  for (UIViewController *vc in viewControllers_) {
    if ([vc.title length] > 0) {
      [titles addObject:vc.title];
    } else {
      [titles addObject:@"Untitled"];
    }
	vc.view.backgroundColor = tabBar_.tabColor;
  }
  
  [tabBar_ setTabs:titles];
}

#pragma mark -
#pragma mark EHTabBarDelegate methods

- (void)tabBar:(EHTabBar *)tabBar tabSelected:(NSInteger)selectedIndex {
  for (UIView *v in [containerView_ subviews]) {
    [v removeFromSuperview];
  }
  UIViewController *vc = [viewControllers_ objectAtIndex:selectedIndex];
  vc.view.frame = containerView_.bounds;
  [containerView_ addSubview:vc.view];
}

@end