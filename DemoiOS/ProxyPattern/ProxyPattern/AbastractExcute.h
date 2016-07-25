//
//  AbastractExcute.h
//  ProxyPattern
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbastractExcute : NSObject


+ (instancetype)shareInstance;


- (void)nullExcute:(NSArray *)infos;

@end
