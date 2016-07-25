//
//  MessageProtocol.h
//  ProxyPattern
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MessageProtocol <NSObject>

@optional

- (void)helloWorld;
- (void)goodBye;

@end
