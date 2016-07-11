//
//  BaseCopyObject.h
//  NSCopyingDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCopyObject : NSObject <NSCopying>

/**
 *  == 子类不要重载 ==
 *
 *  @return 复制的对象
 */
- (id)copyWithZone:(NSZone *)zone;

/**
 *  == 由子类重载实现 ==
 *
 *  复制（赋值操作）
 *
 *  @param object 已经赋值的对象
 */
- (void)copyOperationWithObject:(id)object;

@end
