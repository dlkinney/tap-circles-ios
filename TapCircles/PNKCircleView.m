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
        self.userInteractionEnabled = NO;
        self.opaque = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGFloat side = MIN( CGRectGetWidth(bounds), CGRectGetHeight(bounds) );
    
    CGFloat centerX = CGRectGetMidX(bounds);
    CGFloat centerY = CGRectGetMidY(bounds);
    CGRect ellipseRect = CGRectMake(centerX - 0.5*side,
                                    centerY - 0.5*side,
                                    side,
                                    side);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [self.fillColor CGColor]);
    CGContextFillEllipseInRect(ctx, ellipseRect);
}

@end
