//
//  ViewController.m
//  ProtoypeDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    StudentModel *stu1 = [[StudentModel alloc] init];
    stu1.name               = @"奥特曼";
    stu1.age                = @(19);
    stu1.address            = @"火星";
    stu1.totalScore         = @(100);
    
    
    StudentModel *stu2 = [[StudentModel alloc] init];
    stu2.name               = @"奥特乌曼";
    stu2.age                = @(19);
    stu2.address            = @"火星";
    stu2.totalScore         = @(100);
    
    
    StudentModel *stu3  = [stu1 clone];
    stu3.name           = @"小怪兽";
    
}
@end
