//
//  UserInfoManagerCenter.m
//  SingletonPattern
//
//  Created by LiChen on 16/7/8.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "UserInfoManagerCenter.h"

static UserInfoManagerCenter *center = nil;

@implementation UserInfoManagerCenter

// 不推荐
//+ (void)initialize
//{
//    static UserInfoManagerCenter *center = nil;
//    if (self == [UserInfoManagerCenter class])
//    {
//        center = [[UserInfoManagerCenter alloc] init];
//    }
//}

// 多线程同时调用可能出现冲突
//+ (instancetype)managerCenter
//{
//    static UserInfoManagerCenter *center = nil;
//    if (center == nil)
//    {
//        center = [[UserInfoManagerCenter alloc] init];
//    }
//    return center;
//}

+ (instancetype)managerCenter
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        center = (UserInfoManagerCenter *)@"UserInfoManagerCenter";
        center = [[UserInfoManagerCenter alloc] init];
    });
    
    // 防止子类使用
    NSString *classString = NSStringFromClass([self class]);
    if ([classString isEqualToString:@"UserInfoManagerCenter"] == NO)
    {
        NSParameterAssert(nil);
    }
    
    return center;
}

// 是该类无法被 init
- (instancetype)init
{
    NSString *string = (NSString *)center;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:@"UserInfoManagerCenter"])
    {
        self = [super init];
        if (self) {
            
        }
        return self;
    }
    else
    {
        return nil;
    }
}

@end
