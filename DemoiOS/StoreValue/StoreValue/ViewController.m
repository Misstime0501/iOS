//
//  ViewController.m
//  StoreValue
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "StoreValue.h"
#import "StudentModel.h"
#import "InfoModel.h"
#import "NSObject+StoreValue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    StudentModel *student = [[StudentModel alloc] init];
    student.name          = @"lichen";
    NSArray *array        = @[[InfoModel new], [InfoModel new], [InfoModel new]];
    student.datas         = array;
    
//    [[StoreValue sharedInstance] storeValue:student withKey:@"FastCoding"];
//    StudentModel *tmpStudent = [[StoreValue sharedInstance] valueWithKey:@"FastCoding"];
//   
    [student storeValueWithKey:@"FastCoding"];
    StudentModel *tmpStudent = [StudentModel valueByKey:@"FastCoding"];
    
    NSLog(@"%@", tmpStudent.name);
    NSLog(@"%@", tmpStudent.datas);
}

@end
