//
//  DeviceFactory.h
//  FactoryPattern
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDevice.h"
#import "iPhoneDevice.h"
#import "AndroidDevice.h"
#import "NokiaDevice.h"

typedef enum : NSUInteger {
    kiPhone         = 0x11,
    kAndroid,
    kNokia,
} EDevieType;

@interface DeviceFactory : NSObject

/**
 *  根据用户提交的指令创建出具体的手机
 *
 *  @param type 创建的指令
 *
 *  @return 具体的手机
 */
+ (BaseDevice <PhoneProtocol> *)deviceFactoryWithDevieType:(EDevieType)type;

@end
