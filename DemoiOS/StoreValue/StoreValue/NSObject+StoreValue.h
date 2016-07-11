//
//  NSObject+StoreValue.h
//  StoreValue
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (StoreValue)

- (void)storeValueWithKey:(NSString *)key;

+ (id)valueByKey:(NSString *)key;


@end
