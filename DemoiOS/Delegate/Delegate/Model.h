//
//  Model.h
//  Delegate
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TCPProtocol.h"

@interface Model : NSObject <TCPProtocol>

// 获取源端口号
- (NSInteger)sourcePort;

// 获取目的地端口号
- (NSInteger)destinationPort;

@end
