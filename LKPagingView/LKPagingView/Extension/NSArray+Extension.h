//
//  NSArray+Extension.h
//  LKPagingView
//
//  Created by Li,Ke(BBTD) on 2019/5/20.
//  Copyright © 2019年 Li,Ke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSArray (Extension)

/**
 获取Array元素
 
 @param index index:数组下标，如果index大于总数会返回nil
 @return 返回的数据指针 or nil
 */
- (id)safeObjectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray (Extension)

/**
 安全添加一个数据
 
 @param anObject anObject:待添加的obj
 */
- (void)safeAddObject:(id)anObject;

/**
 安全移除一个数据
 
 @param object 数据
 */
- (void)safeRemoveObject:(id)object;

/**
 安全插入函数
 
 @param anObject anObject:待添加的obj
 @param index index: 插入的位置
 @return 插入成功还是失败
 */
- (bool)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

/**
 安全移除函数
 
 @param index index: 要移除的元素下标
 @return 移除成功还是失败
 */
- (bool)safeRemoveObjectAtIndex:(NSUInteger)index;

@end
