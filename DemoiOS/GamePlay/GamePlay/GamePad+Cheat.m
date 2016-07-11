//
//  GamePad+Cheat.m
//  GamePlay
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "GamePad+Cheat.h"

@implementation GamePad (Cheat)


- (void)cheat
{
    [self up];
    [self down];
    [self up];
    [self down];
    [self left];
    [self right];
    [self left];
    [self right];
    [self commandA];
    [self commandB];
    [self commandA];
    [self commandB];
}

@end
