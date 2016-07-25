//
//  AbastarctProxy.h
//  ProxyPattern
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbastarctProxy : NSProxy

@property (nonatomic , weak) id  delegate;

@end
