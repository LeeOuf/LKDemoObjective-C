//
//  LKStarRatingView.h
//  LKStarRating
//
//  Created by Ke Li on 16/8/18.
//  Copyright © 2016年 Ke Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LKStarRatingView;
@protocol LKStarRatingViewDelegate <NSObject>
//@required

@optional
//// 设置
//- (UIImage *)
// 星级选中事件
- (void)starRatingView:(LKStarRatingView *)starRatingView starRatingSelected:(NSInteger)index;
@end

@interface LKStarRatingView : UIView
@property (nonatomic) BOOL starEnable;          // 是否可点击选择星级
@property (nonatomic) NSInteger starRating;     // 当前星级
@property (nonatomic, weak) id<LKStarRatingViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame andStarNum:(int)starNum;

@end
