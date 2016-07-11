//
//  ShapeMaker.h
//  DrawDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Circle.h"


@interface ShapeMaker : NSObject

+ (void)drawCircleWithParas:(NSDictionary *)paras;

+ (void)drawRectangleWithParas:(NSDictionary *)paras;


@end
