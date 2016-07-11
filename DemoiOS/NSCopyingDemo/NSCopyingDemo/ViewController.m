//
//  ViewController.m
//  NSCopyingDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"
#import "ClassModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    StudentModel *stu1 = [[StudentModel alloc] init];
    stu1.name          = @"奥特曼";
    
    StudentModel *stu2 = stu1.copy;
    
    NSLog(@"%@ %@", stu1, stu2);
    
    ClassModel *class1   = [[ClassModel alloc] init];
    class1.className     = @"班级 1";
    class1.students      = @[stu1, stu2];
    
    ClassModel *class2   = class1.copy;
    
    NSLog(@"%@ %@", class1, class2);
}



@end
