//
//  EHTabBar.m
//  EHTabBarController
//
//  Created by Nolan Brown on 12/10/09.
//  Copyright 2009 EGG HAUS, Inc.. All rights reserved.
//

#import "EHTabBar.h"
#import "EHTab.h"


#define kTabMargin	10
#define kPadding	10


@implementation EHTabBar

@synthesize delegate = _delegate, selectedTabIndex = _selectedTabIndex, borderColor = _borderColor, shadowColor = _shadowColor, 
tabColor = _tabColor, tabWidth = _tabWidth, selectedTextColor = _selectedTextColor, deselectedTextColor = _deselectedTextColor; 

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.backgroundColor = [UIColor colorWithRed:0.776 green:0.796 blue:0.827 alpha:1.0];
		self.borderColor = [UIColor lightGrayColor];
		self.shadowColor = [UIColor darkGrayColor];
		self.tabColor = [UIColor grayColor];
		self.selectedTextColor = [UIColor blackColor];
		self.deselectedTextColor = [UIColor darkGrayColor];
		_selectedTabIndex = 0;
		_tabItems = [[NSMutableArray alloc] init];
		self.tabWidth = 0;
    }
    return self;
}

- (void) setTabs:(NSArray *) tbs
{
	NSInteger index = 0;
	for(NSString *title in tbs)
	{
		EHTab *t = [[[EHTab alloc] initWithTitle:title] autorelease];
		t.borderColor = self.borderColor;
		t.shadowColor = self.shadowColor;
		t.cornerColor = self.backgroundColor;
		t.selectedTextColor = self.selectedTextColor;
		t.deselectedTextColor = self.deselectedTextColor;
		t.backgroundColor = self.tabColor;
		if (self.tabWidth > 0) {
			[t setWidth:self.tabWidth];
		}
		
		t.index = index;
		[t addTarget:self action:@selector(tabWasPressed:) forControlEvents:UIControlEventTouchUpInside];
		[_tabItems addObject:t];
		index++;
		
	}
}

- (void) tabWasPressed: (id) sender
{	
	[self selectTab:(EHTab *) sender];	
	[self.delegate tabBar:self tabSelected:self.selectedTabIndex];
}

						
- (void) selectTab:(EHTab *) t
{
	EHTab *selectedTab = [_tabItems objectAtIndex:self.selectedTabIndex];
	selectedTab.selected = NO;
	
	self.selectedTabIndex = t.index;
	t.selected = YES;	
}

- (void) drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext(); 
	CGContextSetStrokeColorWithColor(context,self.borderColor.CGColor);		
	CGContextSetLineWidth(context, 2.0);
	CGContextMoveToPoint(context, 0.0, self.frame.size.height);
	CGContextAddLineToPoint(context, 320.0, self.frame.size.height);
	CGContextStrokePath(context);
}

- (void) layoutSubviews
{
	[super layoutSubviews];
	
	CGFloat tabsWidth = 0;
	
	
	CGFloat currentXPos = 0;
	for(EHTab *t in _tabItems)
	{
		tabsWidth = tabsWidth + [t getWidth];
	}
	
	tabsWidth = tabsWidth + (kTabMargin * ([_tabItems count] - 1));
	
	CGFloat startX = (self.frame.size.width - tabsWidth) / 2.0;
	currentXPos = startX;
	NSInteger index = 0;
	for(EHTab *t in _tabItems){
		CGFloat xPos = currentXPos;

		if(index != 0)
			xPos = xPos + kTabMargin;
		
		CGFloat yPos = self.frame.size.height - t.frame.size.height;
		t.frame = CGRectMake(xPos, yPos, t.frame.size.width, t.frame.size.height);
		if(index == 0){
			t.selected = YES;
		}
		else
			t.selected = NO;
		index++;
		
		currentXPos = xPos + t.frame.size.width;
		
		[self addSubview:t];
	}
}

- (void)selectTabAtIndex:(NSInteger)tabIndex{
	[self selectTab:[_tabItems objectAtIndex:tabIndex]];
}


- (void)dealloc {
	[_tabItems release];
	_tabItems = nil;
	
	[_borderColor release];
	_borderColor = nil;
	
	[_shadowColor release];
	_shadowColor = nil;
	
	[_tabColor release];
	_tabColor = nil;
	
	[_selectedTextColor release];
	_selectedTextColor = nil;
	
	[_deselectedTextColor release];
	_deselectedTextColor = nil;
	
	[super dealloc];
}

@end
