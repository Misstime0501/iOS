//
//  FactoryManager.m
//  AbstractFactory
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "FactoryManager.h"

@implementation FactoryManager


+ (BaseFactory *)factoryWithBrand:(EFactoryType)factoryType
{
    BaseFactory *factory = nil;
    
    if (factoryType == kApple)
    {
        factory = [[AppleFactory alloc] init];
    }
    else if (factoryType == kGoogle)
    {
        factory = [[GoogleFactory alloc] init];
    }
    return factory;
}

@end
