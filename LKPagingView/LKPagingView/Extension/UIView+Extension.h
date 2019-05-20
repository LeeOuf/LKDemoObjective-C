//
//  UIView+Extension.h
//  LKPagingView
//
//  Created by Li,Ke(BBTD) on 2019/5/20.
//  Copyright © 2019年 Li,Ke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/*!
 @brief 初始坐标
 */
@property (nonatomic, assign) CGPoint origin;
/*!
 @brief View大小
 */
@property (nonatomic, assign) CGSize size;
/*!
 @brief 顶部坐标值
 */
@property (nonatomic, assign) CGFloat top;
/*!
 @brief 左部坐标值
 */
@property (nonatomic, assign) CGFloat left;
/*!
 @brief 底部坐标值
 */
@property (nonatomic, assign) CGFloat bottom;
/*!
 @brief 右部坐标值
 */
@property (nonatomic, assign) CGFloat right;
/*!
 @brief 宽度值
 */
@property (nonatomic, assign) CGFloat width;
/*!
 @brief 高度值
 */
@property (nonatomic, assign) CGFloat height;
/*!
 @brief 中心点X坐标
 */
@property (nonatomic, assign) CGFloat x;
/*!
 @brief 中心点Y坐标
 */
@property (nonatomic, assign) CGFloat y;

@end
