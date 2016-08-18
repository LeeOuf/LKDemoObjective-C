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
 
    starRatringView = [[LKStarRatingView alloc] initWithFrame:CGRectMake(15, (self.view.frame.size.height - 40) / 2, self.view.frame.size.width - 15 * 2, 40) andStarNum:5];
    starRatringView.starEnable = YES;
    starRatringView.starRating = 3;
    starRatringView.delegate = self;
    [self.view addSubview:starRatringView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)starRatingView:(LKStarRatingView *)starRatingView starRatingSelected:(NSInteger)index {
    NSLog(@"Select %d star rating!", (int)index);
}

@end
