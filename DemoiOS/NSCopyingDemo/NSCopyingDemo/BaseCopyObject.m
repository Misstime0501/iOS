//
//  BaseCopyObject.m
//  NSCopyingDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "BaseCopyObject.h"

@implementation BaseCopyObject

- (id)copyWithZone:(NSZone *)zone
{
    BaseCopyObject *copyObject = [[self class] allocWithZone:zone];
    
    // 赋值操作的作业
    [self copyOperationWithObject:copyObject];

    
    return copyObject;
}


- (void)copyOperationWithObject:(id)object
{
    
}

@end
