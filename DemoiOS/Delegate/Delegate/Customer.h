//
//  Customer.h
//  Delegate
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@class Customer;

@protocol CustomerDelegate <NSObject>

// 必须实现的方法
@required
// 顾客买卖行为
- (void)customer:(Customer *)customer buyItemCount:(NSUInteger)count;

// 可以实现也可以不实现
@optional

@end



@interface Customer : NSObject

// 避免循环引用 weak
@property (nonatomic, weak) id <CustomerDelegate> delegate;

- (void)buyItemCount:(NSUInteger)count;

@end
