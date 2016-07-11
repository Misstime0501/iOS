//
//  NSObject+StoreValue.m
//  StoreValue
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "NSObject+StoreValue.h"

#import "StoreValue.h"

@implementation NSObject (StoreValue)

- (void)storeValueWithKey:(NSString *)key
{
    [[StoreValue sharedInstance] storeValue:self withKey:key];
}

+ (id)valueByKey:(NSString *)key
{
    return [[StoreValue sharedInstance] valueWithKey:key];
}

@end
