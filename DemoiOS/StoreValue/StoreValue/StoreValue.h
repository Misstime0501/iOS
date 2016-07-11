//
//  StoreValue.h
//  StoreValue
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreValue : NSObject

+ (StoreValue *)sharedInstance;

- (void)storeValue:(id)value withKey:(NSString *)key;

- (id)valueWithKey:(NSString *)key;

@end
