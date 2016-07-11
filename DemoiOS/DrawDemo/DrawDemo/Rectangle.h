//
//  Rectangle.h
//  DrawDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "Shape.h"
#import <UIKit/UIKit.h>

@interface Rectangle : Shape

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

- (void)draw;

@end
