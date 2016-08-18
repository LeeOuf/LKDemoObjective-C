//
//  LKStarRatingView.m
//  LKStarRating
//
//  Created by Ke Li on 16/8/18.
//  Copyright © 2016年 Ke Li. All rights reserved.
//

#import "LKStarRatingView.h"

@interface LKStarRatingView ()
@property (nonatomic, strong) NSMutableArray* starBtnArrary;
@end

@implementation LKStarRatingView
@synthesize starEnable = _starEnable;
@synthesize starRating = _starRating;
@synthesize dataSource = _dataSource;
@synthesize delegate = _delegate;

@synthesize starBtnArrary = _starBtnArrary;

- (void)setStarEnable:(BOOL)starEnable {
    _starEnable = starEnable;
    for (UIButton *button in _starBtnArrary) {
        button.enabled = _starEnable;
    }
}

- (void)setStarRating:(NSInteger)starRating {
    [self setSelectedBtns:starRating];
}

//- (instancetype)initWithFrame:(CGRect)frame andStarNum:(int)starNum {
//    self = [super initWithFrame:frame];
//    if (self) {
//        _starBtnArrary = [NSMutableArray arrayWithCapacity:starNum];
//        CGFloat starH = self.frame.size.height;
//        
//        for (int i = 0; i < starNum; i++) {
//            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            
//            button.tag = i + 1;
//            button.frame = CGRectMake((starH * 1.2) * i, 0, starH, starH);
//            button.adjustsImageWhenHighlighted = NO;
//            button.backgroundColor = [UIColor clearColor];
//            [button setImage:[UIImage imageNamed:@"lk_star_empty"] forState:UIControlStateNormal];
//            [button setImage:[UIImage imageNamed:@"lk_star_full"] forState:UIControlStateSelected];
//            [button addTarget:self action:@selector(starBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//            [self addSubview:button];
//            
//            [_starBtnArrary addObject:button];
//        }
//        
//    }
//    return self;
//}

- (void)layoutSubviews {
    if (_dataSource && [_dataSource respondsToSelector:@selector(numberOfStarsInStarRatingView:)]) {
        NSInteger starNum = [_dataSource numberOfStarsInStarRatingView:self];
        _starBtnArrary = [NSMutableArray arrayWithCapacity:starNum];
        CGFloat starH = self.frame.size.height;
        
        BOOL respondsToUnselectedImage = [_dataSource respondsToSelector:@selector(starRatingView:unselectedImageForStarAtIndex:)];
        BOOL respondsToSelectedImage = [_dataSource respondsToSelector:@selector(starRatingView:selectedImageForStarAtIndex:)];
        
        for (int i = 0; i < starNum; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            button.tag = i + 1;
            button.frame = CGRectMake((starH * 1.2) * i, 0, starH, starH);
            button.adjustsImageWhenHighlighted = NO;
            button.backgroundColor = [UIColor clearColor];
            
            // 设置按钮状态对应样式
            UIImage *unselectedImage = [UIImage imageNamed:@"lk_star_empty"];
            if (respondsToUnselectedImage) {
                unselectedImage = [_dataSource starRatingView:self unselectedImageForStarAtIndex:i];
            }
            [button setImage:unselectedImage forState:UIControlStateNormal];
            
            UIImage *selectedImage = [UIImage imageNamed:@"lk_star_full"];
            if (respondsToSelectedImage) {
                selectedImage = [_dataSource starRatingView:self selectedImageForStarAtIndex:i];
            }
            [button setImage:selectedImage forState:UIControlStateSelected];
            
            // 设置按钮动作
            [button addTarget:self action:@selector(starBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:button];
            [_starBtnArrary addObject:button];
        }
    }
}

- (void)starBtnClicked:(UIButton *)sender {
    [self setSelectedBtns:sender.tag];
    
    if (_delegate && [_delegate respondsToSelector:@selector(starRatingView:didSelectStarAtIndex:)]) {
        [_delegate starRatingView:self didSelectStarAtIndex:sender.tag];
    }
}

- (void)setSelectedBtns:(NSInteger)index {
    for (UIButton *button in _starBtnArrary) {
        if (index >= button.tag) {
            button.selected = YES;
        } else {
            button.selected = NO;
        }
    }
}
@end
