//
//  LKPagingScrollView.m
//  LKPagingView
//
//  Created by Li,Ke(BBTD) on 2019/5/20.
//  Copyright © 2019年 Li,Ke. All rights reserved.
//

#import "LKPagingScrollView.h"
#import "UIView+Extension.h"

@implementation LKPagingScrollView

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([self panBack:gestureRecognizer])
    {
        return NO;
    }
    return YES;
}

- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.panGestureRecognizer)
    {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state || UIGestureRecognizerStatePossible == state)
        {
            CGPoint location = [gestureRecognizer locationInView:self];
            if (point.x > 0 && location.x < self.width && self.contentOffset.x <= 0)
            {
                return YES;
            }
        }
    }
    return NO;
}

@end
