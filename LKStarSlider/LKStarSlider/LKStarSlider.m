//
//  LKStarSlider.m
//  LKStarSlider
//
//  Created by Li,Ke(BBTD) on 16/10/8.
//  Copyright © 2016年 Ke Li. All rights reserved.
//

#import "LKStarSlider.h"

@interface LKStarSlider ()

@property (nonatomic, weak) UIImage *STAR_ON;
@property (nonatomic, weak) UIImage *STAR_OFF;

@end

@implementation LKStarSlider

- (void)layoutSubviews {
    if (_dataSource && [_dataSource respondsToSelector:@selector(numberOfStarsInStarSlider:)]) {
        float offsetCenter = self.frame.size.height;
        for (int i = 0; i < [_dataSource numberOfStarsInStarSlider:self]; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, offsetCenter, offsetCenter)];
        }
    }
}

@end
