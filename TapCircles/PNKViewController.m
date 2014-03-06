//
//  PNKViewController.m
//  TapCircles
//
//  Created by Personal on 3/6/14.
//  Copyright (c) 2014 Pink Hop. All rights reserved.
//

#import "PNKViewController.h"

#import "PNKCircleView.h"


@interface PNKViewController ()

@end


@implementation PNKViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)handleTap:(id)sender
{
    UITapGestureRecognizer *gestureRecognizer = sender;
    NSUInteger touchCount = [gestureRecognizer numberOfTouches];
    for (NSUInteger i=0; i<touchCount; ++i) {
        CGPoint center = [gestureRecognizer locationOfTouch:i inView:self.view];
        [self showCircleAtPoint:center];
    }
}

- (void)showCircleAtPoint:(CGPoint)center
{
    CGFloat startEdgeLength = 15;
    CGFloat stopEdgeLength = (UIUserInterfaceIdiomPhone == UI_USER_INTERFACE_IDIOM()) ? 120 : 200;
    
    PNKCircleView *circle = [[PNKCircleView alloc] initWithFrame:CGRectZero];
    circle.center = center;
    circle.bounds = CGRectMake(0,0, startEdgeLength,startEdgeLength);
    circle.fillColor = [UIColor colorWithRed:0.353f green:0.647f blue:0.941f alpha:1];
    [self.view addSubview:circle];
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         circle.alpha = 0;
                         circle.bounds = CGRectMake(0,0, stopEdgeLength,stopEdgeLength);
                     } completion:^(BOOL finished) {
                         [circle removeFromSuperview];
                     }];
}

@end
