//
//  StudentModel.m
//  ProtoypeDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel


- (id)clone
{
    StudentModel *student = [[[self class] alloc] init];
    
    student.name        = self.name;
    student.age         = self.age;
    student.address     = self.address;
    student.totalScore  = self.totalScore;
}

@end
