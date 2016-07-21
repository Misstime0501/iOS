//
//  ViewController.m
//  NSNumberDemo
//
//  Created by LiChen on 16/7/12.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    // 抽象类，抽象对象为 nil
    NSLog(@"%@", [[NSNumber alloc] init]);
    NSLog(@"%@", [NSNumber numberWithBool:YES]);
    
    NSNumber *number        = [NSNumber numberWithInt:100];
    NSNumber *floatValue    = [NSNumber numberWithFloat:100.f];
    
    NSLog(@"%c", [number charValue]);
    NSLog(@"%c", [floatValue charValue]);
    
}


@end
