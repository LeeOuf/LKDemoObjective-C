//
//  ViewController.m
//  LKStarRating
//
//  Created by Ke Li on 16/8/18.
//  Copyright © 2016年 Ke Li. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize starRatringView = _starRatringView;

- (void)viewDidLoad {
    [super viewDidLoad];
 
    _starRatringView = [[LKStarRatingView alloc] initWithFrame:CGRectMake(15, (self.view.frame.size.height - 40) / 2, self.view.frame.size.width - 15 * 2, 40)];
    _starRatringView.starEnable = YES;
    _starRatringView.starRating = 3;
    [self.view addSubview:_starRatringView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _starRatringView.dataSource = self;
    _starRatringView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    _starRatringView.dataSource = nil;
    _starRatringView.delegate = nil;
}

- (void)dealloc {
    if (_starRatringView) {
        _starRatringView = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfStarsInStarRatingView:(LKStarRatingView *)starRatingView {
    return 5;
}

- (UIImage *)starRatingView:(LKStarRatingView *)starRatingView unselectedImageForStarAtIndex:(NSInteger)index {
    UIImage *image = [UIImage imageNamed:@"lk_star_empty"];
    return image;
}

- (UIImage *)starRatingView:(LKStarRatingView *)starRatingView selectedImageForStarAtIndex:(NSInteger)index {
    UIImage *image = [UIImage imageNamed:@"lk_star_full"];
    return image;
}

- (void)starRatingView:(LKStarRatingView *)starRatingView didSelectStarAtIndex:(NSInteger)index {
    NSLog(@"Select %d star rating!", (int)index);
}

@end
