//
//  ClassModel.h
//  NSCopyingDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "BaseCopyObject.h"

@interface ClassModel : BaseCopyObject

@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSArray  *students;

@end
