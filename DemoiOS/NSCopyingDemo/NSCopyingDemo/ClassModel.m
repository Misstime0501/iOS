//
//  ClassModel.m
//  NSCopyingDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ClassModel.h"

@implementation ClassModel

- (void)copyOperationWithObject:(ClassModel *)object
{
    object.className = self.className;
    
    // 数组浅拷贝
//    object.students  = self.students;
    
    // 数组深拷贝
    // 数组，字典，集合拷贝的时候都以这种方式拷贝，并且每一个对象都可以实现 copy 协议
    object.students = [[NSArray alloc] initWithArray:self.students copyItems:YES];
    
}

@end
