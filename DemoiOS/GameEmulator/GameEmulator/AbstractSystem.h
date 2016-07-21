//
//  AbstractSystem.h
//  GameEmulator
//
//  Created by LiChen on 16/7/12.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractImplementor.h"

@interface AbstractSystem : NSObject

/**
 *  执行者
 */
@property (nonatomic, strong) AbstractImplementor *implementor;

/**
 *  加载系统
 */
- (void)loadSystem;

/**
 *  上 下 左 右 a b - 按钮
 */
- (void)command_up;
- (void)command_down;
- (void)command_left;
- (void)command_right;

- (void)command_a;
- (void)command_b;

@end
