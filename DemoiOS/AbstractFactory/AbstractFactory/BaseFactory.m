//
//  BaseFactory.m
//  AbstractFactory
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "BaseFactory.h"

@implementation BaseFactory

- (BasePhone *)createPhone
{
    NSParameterAssert(nil);
    return nil;
}


- (BaseWatch *)createWatch
{
    NSParameterAssert(nil);
    return nil;
}

@end
