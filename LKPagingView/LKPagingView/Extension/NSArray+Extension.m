//
//  NSArray+Extension.m
//  LKPagingView
//
//  Created by Li,Ke(BBTD) on 2019/5/20.
//  Copyright © 2019年 Li,Ke. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if ( index >= self.count )
    {
        return nil;
    }
    
    return [self objectAtIndex:index];
}

@end

@implementation NSMutableArray (Extension)

- (void)safeAddObject:(id)anObject
{
    if (anObject)
    {
        [self addObject:anObject];
    }
}

- (void)safeRemoveObject:(id)object
{
    if (object)
    {
        [self removeObject:object];
    }
}

-(bool)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if ( index > self.count && index != 0)
    {
        return NO;
    }
    
    if (!anObject)
    {
        return NO;
    }
    
    [self insertObject:anObject atIndex:index];
    
    return YES;
}

- (bool)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if ( index >= self.count )
    {
        return NO;
    }
    
    [self removeObjectAtIndex:index];
    
    return YES;
}

- (bool)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if ( index >= self.count )
    {
        return NO;
    }
    
    if (!anObject)
    {
        return NO;
    }
    
    [self replaceObjectAtIndex:index withObject:anObject];
    
    return YES;
}

@end
