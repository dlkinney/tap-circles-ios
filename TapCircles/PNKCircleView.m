//
//  PNKCircleView.m
//  TapCircles
//
//  Created by Personal on 3/6/14.
//  Copyright (c) 2014 Pink Hop. All rights reserved.
//

#import "PNKCircleView.h"

@implementation PNKCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self circleViewInitialization];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self circleViewInitialization];
}

- (void)drawRect:(CGRect)rect
{
    // TODO change the circle's bounding rectangle based on the view's content mode
    
    // draw a circle centered in the view that is as large as possible without
    // overflowing the view -- "Aspect Fit"
    
    // load the view's bounds and find its center
    CGRect bounds = self.bounds;
    CGFloat centerX = CGRectGetMidX(bounds);
    CGFloat centerY = CGRectGetMidY(bounds);
    
    // find the shortest side of the bounds, as this is the maximum size we
    // want our circle
    CGFloat side = MIN( CGRectGetWidth(bounds), CGRectGetHeight(bounds) );
    
    // define the circle's bounding rectangle to be centered and as lasrge as
    // possible without overflowing the bounds
    CGRect ellipseRect = CGRectMake(centerX - 0.5*side,
                                    centerY - 0.5*side,
                                    side,
                                    side);
    
    // draw an ellipse filling the rectangle we just made; since we defined a
    // square, the ellipse will be a circle
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [self.fillColor CGColor]);
    CGContextFillEllipseInRect(ctx, ellipseRect);
}

#pragma mark - Shared initialization

- (void)circleViewInitialization
{
    self.opaque = NO;
}

@end
