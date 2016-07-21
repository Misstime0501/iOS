//
//  FactoryManager.h
//  AbstractFactory
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFactory.h"
#import "AppleFactory.h"
#import "GoogleFactory.h"

typedef enum : NSUInteger {
    kApple,
    kGoogle,
} EFactoryType;

@interface FactoryManager : NSObject

/**
 *  获取工厂
 *
 *  @param factoryType 工厂类型
 *
 *  @return 工厂
 */
+ (BaseFactory *)factoryWithBrand:(EFactoryType)factoryType;

@end
