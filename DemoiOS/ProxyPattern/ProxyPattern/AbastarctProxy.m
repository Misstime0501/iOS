//
//  AbastarctProxy.m
//  ProxyPattern
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "AbastarctProxy.h"
#import "AbastractExcute.h"
#import <objc/runtime.h>

@implementation AbastarctProxy

// 验证方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    if ([self.delegate respondsToSelector:sel])
    {
        return [self.delegate methodSignatureForSelector:sel];
    }
    else
    {
        AbastractExcute *excute = [AbastractExcute shareInstance];
        return [excute methodSignatureForSelector:NSSelectorFromString(@"nullExcute:")];
    }
}

// 派发信息
- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL selector = [invocation selector];
    if ([self.delegate respondsToSelector:selector])
    {
        [invocation setTarget:self.delegate];
        [invocation invoke];
    }
    else
    {
        
        NSString *selectorString = NSStringFromSelector(invocation.selector);
        
        invocation.selector = NSSelectorFromString(@"nullExcute:");
        AbastractExcute *excute = [AbastractExcute shareInstance];
        [invocation setTarget:excute];
        
        const char *className = class_getName([self class]);
        NSArray *infos = nil;
        
        if (self.delegate)
        {
            infos = @[[NSString stringWithUTF8String:className], selectorString, @""];
        }
        else
        {
            infos = @[[NSString stringWithUTF8String:className], selectorString];
        }
        [invocation setArgument:&infos atIndex:2];
        [invocation invoke];
    }
}

@end
