//
//  TCPProtocol.h
//  Delegate
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//


// 规范接口，筛选对象

#import <Foundation/Foundation.h>

@protocol TCPProtocol <NSObject>

@required
// 获取源端口号
- (NSInteger)sourcePort;

// 获取目的地端口号
- (NSInteger)destinationPort;

@end
