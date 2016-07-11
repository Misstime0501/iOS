//
//  StudentModel.h
//  ProtoypeDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProtypeCopyProtocol.h"

@interface StudentModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSNumber *totalScore;

- (id)clone;
@end
