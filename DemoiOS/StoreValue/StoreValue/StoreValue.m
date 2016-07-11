//
//  StoreValue.m
//  StoreValue
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "StoreValue.h"
#import "FastCoder.h"

@implementation StoreValue

+ (StoreValue *)sharedInstance
{
    static StoreValue *storeValue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storeValue = [[StoreValue alloc] init];
    });
    return storeValue;
}

- (void)storeValue:(id)value withKey:(NSString *)key
{
    NSParameterAssert(value);
    NSParameterAssert(key);
    
    NSData *data = [FastCoder dataWithRootObject:value];
    if (data)
    {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    }
}

- (id)valueWithKey:(NSString *)key
{
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return [FastCoder objectWithData:data];
}

@end
