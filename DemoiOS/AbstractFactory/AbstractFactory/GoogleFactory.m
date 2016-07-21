//
//  GoogleFactory.m
//  AbstractFactory
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "GoogleFactory.h"
#import "AndroidWatch.h"
#import "Android.h"

@implementation GoogleFactory

- (BasePhone *)createPhone
{
    return [[Android alloc] init];
}


- (BaseWatch *)createWatch
{
    return [[AndroidWatch alloc] init];;
}

@end
