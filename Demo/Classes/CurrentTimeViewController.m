//
//  CurrentTimeViewController.m
//  EHTabBarDemo
//
//  Created by Shayne Sweeney on 12/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CurrentTimeViewController.h"


@implementation CurrentTimeViewController

- (id)init {
    if (self = [super init]) {
        self.title = @"Current Time";
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor blueColor];
}

@end
