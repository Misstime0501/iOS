//
//  ShapeMaker.m
//  DrawDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ShapeMaker.h"

@implementation ShapeMaker


- (void)drawCircleWithParas:(NSDictionary *)paras
{
    Circle *circle  = [Circle new];
    circle.radius   = 10.f; // paras 中取
    [circle draw];
}

- (void)drawRectangleWithParas:(NSDictionary *)paras
{
    Rectangle *rectangle = [Rectangle new];
    rectangle.width      = 10.f;
    rectangle.height     = 20.f;
    [rectangle draw];
}

@end
