//
//  GamePad.h
//  GamePlay
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GamePad : NSObject

/**
 *  上下左右操作
 */
- (void)up;
- (void)down;
- (void)left;
- (void)right;

/**
 *  选择和开始操作
 */
- (void)select;
- (void)start;

/**
 *  按钮 A + B + X + Y
 */
- (void)commandA;
- (void)commandB;
- (void)commandX;
- (void)commandY;

@end
