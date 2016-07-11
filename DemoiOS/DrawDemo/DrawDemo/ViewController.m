//
//  ViewController.m
//  DrawDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "Circle.h"
#import "Rectangle.h"
#import "ShapeMaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    Circle *circle  = [Circle new];
//    circle.radius   = 10.f;
//    [circle draw];
//    
//    Rectangle *rectangle = [Rectangle new];
//    rectangle.width      = 10.f;
//    rectangle.height     = 20.f;
//    [rectangle draw];
    
    [ShapeMaker drawCircleWithParas:@{@"radius" : @"10.f"}];
    [ShapeMaker drawRectangleWithParas:@{@"width" : @"10.f", @"height" : @"20.f"}];
}

@end
