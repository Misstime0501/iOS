//
//  AppleFactory.m
//  AbstractFactory
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "AppleFactory.h"
#import "iPhone.h"
#import "iWatch.h"

@implementation AppleFactory

- (BasePhone *)createPhone
{
    return [[iPhone alloc] init];
}


- (BaseWatch *)createWatch
{
    return [[iWatch alloc] init];;
}


@end
