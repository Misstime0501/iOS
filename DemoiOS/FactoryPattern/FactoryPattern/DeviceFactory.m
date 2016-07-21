//
//  DeviceFactory.m
//  FactoryPattern
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "DeviceFactory.h"

@implementation DeviceFactory

+ (BaseDevice <PhoneProtocol> *)deviceFactoryWithDevieType:(EDevieType)type
{
    BaseDevice <PhoneProtocol> *device = nil;
    
    
    if (type == kiPhone)
    {
        device = [[iPhoneDevice alloc] init];
    }
    else if (type = kAndroid)
    {
        device = [[AndroidDevice alloc] init];
    }
    else if (type = kNokia)
    {
        device = [[NokiaDevice alloc] init];
    }
    return device;
}

@end
