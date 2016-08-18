//
//  LKStarRatingView.h
//  LKStarRating
//
//  Created by Ke Li on 16/8/18.
//  Copyright © 2016年 Ke Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LKStarRatingView;
@protocol LKStarRatingViewDataSource <NSObject>
@required
// 设置总星级数
- (NSInteger)numberOfStarsInStarRatingView:(LKStarRatingView *)starRatingView;

@optional
// 设置星级未选中时图片
- (UIImage *)starRatingView:(LKStarRatingView *)starRatingView unselectedImageForStarAtIndex:(NSInteger)index;
// 设置星级选中时图片
- (UIImage *)starRatingView:(LKStarRatingView *)starRatingView selectedImageForStarAtIndex:(NSInteger)index;
@end

@protocol LKStarRatingViewDelegate <NSObject>
//@required

@optional
// 星级选中事件
- (void)starRatingView:(LKStarRatingView *)starRatingView didSelectStarAtIndex:(NSInteger)index;
@end

@interface LKStarRatingView : UIView
@property (nonatomic) BOOL starEnable;          // 是否可点击选择星级
@property (nonatomic) NSInteger starRating;     // 当前星级
@property (nonatomic, weak) id<LKStarRatingViewDataSource> dataSource;
@property (nonatomic, weak) id<LKStarRatingViewDelegate> delegate;

//- (instancetype)initWithFrame:(CGRect)frame andStarNum:(int)starNum;

@end
