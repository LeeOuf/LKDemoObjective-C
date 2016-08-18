//
//  ViewController.h
//  LKStarRating
//
//  Created by Ke Li on 16/8/18.
//  Copyright © 2016年 Ke Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKStarRatingView.h"

@interface ViewController : UIViewController<LKStarRatingViewDataSource, LKStarRatingViewDelegate>
@property (nonatomic, strong) LKStarRatingView *starRatringView;
@end

