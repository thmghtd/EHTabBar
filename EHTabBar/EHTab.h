//
//  EHTab.h
//  EHTabBarController
//
//  Created by Nolan Brown on 12/10/09.
//  Copyright 2009 EGG HAUS, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EHTab : UIControl {
	NSString* _title;	
	UIColor *_titleColor;	
	UILabel *_label;
	
  UIColor *_cornerColor;
	UIColor *_borderColor;
	UIColor *_shadowColor;
	
	UIColor *_selectedTextColor;
	UIColor *_deselectedTextColor;
	
	int _radius;	
	BOOL _selected;
	CGFloat defaultHeight;
	NSInteger index;
}

@property(nonatomic,copy) NSString* title;
@property (nonatomic,retain) UIColor *cornerColor;
@property (nonatomic,retain) UIColor *borderColor;
@property (nonatomic,retain) UIColor *shadowColor;

@property (nonatomic,retain) UIColor *selectedTextColor;
@property (nonatomic,retain) UIColor *deselectedTextColor;



@property (nonatomic) int radius;
@property (nonatomic) NSInteger index;
@property (nonatomic,getter=isSelected) BOOL selected;


- (id)initWithTitle:(NSString*)title;
- (void) setWidth: (CGFloat) w;
- (CGFloat) getWidth;

@end
