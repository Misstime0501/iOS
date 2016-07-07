//
//  encoderUseJson.m
//  EncoderDemo
//
//  Created by LiChen on 6/27/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "encoderUseJson.h"
#import <objc/runtime.h>

@implementation encoderUseJson

+ (NSDictionary *)getDictionaryFromObject:(id)classInstance
{
    NSMutableArray *objectName = [[NSMutableArray alloc] init];
    NSDictionary *returnDictionary = [[NSDictionary alloc] init];
    
    Class clazz = [classInstance class];
    while (![NSStringFromClass(clazz) isEqualToString:@"NSObject"])
    {
        [objectName addObject:NSStringFromClass(clazz)];
        clazz = [clazz superclass];
    }
    if (objectName.count == 0)
    {
        returnDictionary = [encoderUseJson getDicFromObject:classInstance class:nil];
    }
    else
    {
        for (int i = (int)objectName.count ; i > 0; i--)
        {
            NSDictionary *dic = [encoderUseJson getDicFromObject:classInstance
                                                           class:NSClassFromString([objectName objectAtIndex:i - 1])];
            if (i != objectName.count)
            {
                NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithDictionary:dic];
                [mDic setObject:returnDictionary forKey:[objectName objectAtIndex:i]];
                returnDictionary = mDic;
            }
            else
            {
                returnDictionary = dic;
            }
        }
    }
    return returnDictionary;
}

+ (NSDictionary *)getDicFromObject:(id)classInstance class:(Class)class
{
    Class clazz = [classInstance class];
    if (class != nil)
    {
        clazz = class;
    }
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    u_int count;
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    for (int i = 0; i < count ; i++)
    {
        objc_property_t property=properties[i];
        const char *char_f = property_getName(property);
        
        NSString *proertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [classInstance valueForKey:(NSString *)proertyName];
        
        if (propertyValue)
        {
            [props setObject:propertyValue forKey:proertyName];
        }
    }
    free(properties);
    return props;
}






+ (NSData *)encoder:(id)object
{
    NSError *error;
    return [NSJSONSerialization dataWithJSONObject:[encoderUseJson getDictionaryFromObject:object]
                                           options:NSJSONWritingPrettyPrinted
                                             error:&error];
}

+ (id)decoder:(NSData *)data
{
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:data
                                           options:NSJSONReadingMutableContainers
                                             error:&error];
}


@end
