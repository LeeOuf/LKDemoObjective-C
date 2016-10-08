//
//  LKStarSlider.h
//  LKStarSlider
//
//  Created by Li,Ke(BBTD) on 16/10/8.
//  Copyright © 2016年 Ke Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LKStarSlider;
@protocol LKStarSliderDataSource <NSObject>
// 设置总星级数
- (NSInteger)numberOfStarsInStarSlider:(LKStarSlider *)starSlider;
@end

@protocol LKStarSliderDelegate <NSObject>
//@required

@optional
// 星级选中事件
- (void)starSlider:(LKStarSlider *)starSlider didSelectStarAtIndex:(NSInteger)index;
@end

@interface LKStarSlider : UISlider

@property (nonatomic, weak) id<LKStarSliderDataSource> dataSource;
@property (nonatomic, weak) id<LKStarSliderDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame andStarNum:(int)starNum;

@end
