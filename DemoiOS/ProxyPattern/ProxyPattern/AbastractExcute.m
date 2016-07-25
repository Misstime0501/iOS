//
//  AbastractExcute.m
//  ProxyPattern
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "AbastractExcute.h"

@implementation AbastractExcute

+ (instancetype)shareInstance
{
    static  AbastractExcute *excute = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        excute = [[AbastractExcute alloc] init];
    });
    return excute;
}

- (void)nullExcute:(NSArray *)infos
{
    NSLog(@"infos = %@", infos);
}


@end
