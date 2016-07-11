//
//  SubscriptionServiceCenter.m
//  ObserverPattern
//
//  Created by LiChen on 16/6/30.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "SubscriptionServiceCenter.h"

static NSMutableDictionary *_subscriptionDictionary = nil;

@implementation SubscriptionServiceCenter

// 第一次调用实现，之后再也不会调用
+ (void)initialize
{
    if (self == [SubscriptionServiceCenter class])
    {
        _subscriptionDictionary = [NSMutableDictionary dictionary];
    }
}


+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable == nil) {
        
        hashTable = [NSHashTable weakObjectsHashTable];
        [_subscriptionDictionary setObject:hashTable forKey:subscriptionNumber];
    }
}

+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable)
    {
        [_subscriptionDictionary removeObjectForKey:subscriptionNumber];
    }
}

+ (void)addCustomer:(id<SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(customer);
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable addObject:customer];
}


+ (void)removeCustomer:(id<SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable removeObject:customer];
}

+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber
{
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable)
    {
        // 迭代器
        NSEnumerator *enumerator = [hashTable objectEnumerator];
        id <SubscriptionServiceCenterProtocol> object = nil;
        while (object = [enumerator nextObject])
        {
            // 检查一个对象是否实现了某种方法
            if ([object respondsToSelector:@selector(subscriptionMessage:subscriptionNumber:)])
            {
                [object subscriptionMessage:message subscriptionNumber:subscriptionNumber];
            }
        }
    }
}




+ (NSHashTable *)existSubscriptionNumber:(NSString *)subscriptionNumber
{
    return [_subscriptionDictionary objectForKey:subscriptionNumber];
}

@end
