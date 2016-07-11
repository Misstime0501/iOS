//
//  UserInfoManagerCenter.h
//  SingletonPattern
//
//  Created by LiChen on 16/7/8.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoManagerCenter : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

+ (instancetype)managerCenter;

@end
