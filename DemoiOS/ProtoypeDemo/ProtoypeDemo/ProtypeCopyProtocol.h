//
//  ProtypeCopyProtocol.h
//  ProtoypeDemo
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtypeCopyProtocol <NSObject>

@required


/**
 *  复制自己
 *
 *  @return 返回一个拷贝样本
 */
- (id)clone;

@end
