//
//  EHTab.m
//  EHTabBarController
//
//  Created by Nolan Brown on 12/10/09.
//  Copyright 2009 EGG HAUS, Inc.. All rights reserved.
//

#import "EHTab.h"

#define kTabHeight					35
#define kDefaultTabCornerRadius		3
#define kLabelPadding				20
#define kDefaultFont				[UIFont fontWithName:@"Helvetica-Bold" size:14]

@implementation EHTab


@synthesize title = _title, radius = _radius, selected = _selected, borderColor = _borderColor, shadowColor = _shadowColor, cornerColor = _cornerColor, index, selectedTextColor = _selectedTextColor, deselectedTextColor = _deselectedTextColor;

- (id)initWithTitle:(NSString*)title {
	
	CGSize size = [title sizeWithFont:kDefaultFont];
	CGFloat width = size.width + (kLabelPadding * 2);	
	CGFloat height = kTabHeight;

	if (self = [super initWithFrame:CGRectMake(0, 0, width, height)]) {
		self.title = title;
		
		self.selectedTextColor = [UIColor blackColor];
		self.deselectedTextColor = [UIColor blackColor];
		
		_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
		_label.text = self.title;
		_label.textAlignment = UITextAlignmentCenter;
		_label.backgroundColor = [UIColor clearColor];
		_label.font = kDefaultFont;
		_label.textColor = self.selectedTextColor;
		
		defaultHeight = height;
		
		self.clearsContextBeforeDrawing = YES;
		
		//Setting default colors
		self.cornerColor = [UIColor grayColor];
		self.backgroundColor = [UIColor darkGrayColor];
		self.borderColor = self.backgroundColor;
		self.shadowColor = self.borderColor;
		
		
		_selected = YES;
		self.selected = YES;
		self.opaque = NO;
		self.radius = kDefaultTabCornerRadius;
		
		
	}
	return self;	
}



- (void)dealloc {
	[_title release];
	_title = nil;
	
	[_label release];
	_label = nil;
	
	[super dealloc];
}

-(void) setSelected:(BOOL) s
{
	if (s) 
		_label.textColor = self.selectedTextColor;
	else
		_label.textColor = self.deselectedTextColor;

	_selected = s;
	[self setNeedsDisplay];
}

- (void) setWidth: (CGFloat) w
{
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, w, self.frame.size.height);
	_label.frame = CGRectMake(_label.frame.origin.x, _label.frame.origin.y, w, _label.frame.size.height);
}
- (CGFloat) getWidth
{
	return self.frame.size.width;
}


- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
	[super sendAction:action to:target forEvent:event];
}


#pragma mark -

-(void) drawRect:(CGRect) rect { // this is one of the last things that happens	
    CGContextRef c = UIGraphicsGetCurrentContext();
    if (c != nil)  {
		
		if (self.selected) {
			CGContextSetLineWidth(c, 2.0f);
			
			CGContextSetStrokeColorWithColor(c,self.borderColor.CGColor);
			
			CGContextMoveToPoint(c, 0.0, rect.size.height);
			CGContextAddArcToPoint(c, 0, 0, 20, 0, self.radius);
			CGContextAddLineToPoint(c, rect.size.width, 0.0);
			CGContextStrokePath(c);
			
			CGContextMoveToPoint(c, rect.size.width, rect.size.height+1);
			CGContextSetStrokeColorWithColor(c,self.shadowColor.CGColor);
			CGContextAddArcToPoint(c, rect.size.width,0,20, 0, self.radius);
			CGContextStrokePath(c);
			
			
			//REMOVE CORNERS 
			CGContextSetFillColorWithColor(c, self.cornerColor.CGColor);
			int x_left = rect.origin.x;
			int x_left_center = rect.origin.x + self.radius;
			int x_right_center = rect.origin.x + rect.size.width - self.radius;
			int x_right = rect.origin.x + rect.size.width;
			int y_top = rect.origin.y;
			int y_top_center = rect.origin.y + self.radius;
			
			//upper left
			CGContextMoveToPoint(c, x_left, y_top_center);
			CGContextAddArcToPoint(c, x_left, y_top, x_left_center, y_top, self.radius);
			CGContextAddLineToPoint(c, x_left, y_top);
			CGContextAddLineToPoint(c, x_left, y_top_center);
			
			//upper right
			CGContextMoveToPoint(c, x_right, y_top_center);
			CGContextAddArcToPoint(c, x_right, y_top, x_right_center, y_top, self.radius);
			CGContextAddLineToPoint(c, x_right, y_top);
			CGContextAddLineToPoint(c, x_right, y_top_center);
			
			
			CGContextFillPath(c);
			
		}
		else {
			CGContextClearRect(c, rect);
			CGContextSetFillColorWithColor(c, self.cornerColor.CGColor);
			CGContextFillRect(c,rect);

			
			
			CGContextSetStrokeColorWithColor(c,self.borderColor.CGColor);	
			CGContextSetLineWidth(c, 2.0);
			
			// Draw a single line from left to right
			CGContextMoveToPoint(c, 0.0, self.frame.size.height);
			CGContextAddLineToPoint(c, self.frame.size.width, self.frame.size.height);
			CGContextStrokePath(c);
						
		}

		if(![_label isDescendantOfView:self])
			[self addSubview:_label];
		
    }
	
}


@end
