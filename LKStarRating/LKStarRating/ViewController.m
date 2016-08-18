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

- (void)viewDidLoad {
    [super viewDidLoad];
 
    starRatringView = [[LKStarRatingView alloc] initWithFrame:CGRectMake(15, (self.view.frame.size.height - 40) / 2, self.view.frame.size.width - 15 * 2, 40)];
    starRatringView.dataSource = self;
    starRatringView.delegate = self;
    starRatringView.starEnable = NO;
    starRatringView.starRating = 3;
    [self.view addSubview:starRatringView];
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
