//
//  GamePadDecorator.m
//  GamePlay
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "GamePadDecorator.h"

@implementation GamePadDecorator

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.gamePad = [[GamePad alloc] init];
    }
    return self;
}

- (void)up
{
    [self.gamePad up];
}

- (void)down
{
    [self.gamePad down];
}

- (void)left
{
    [self.gamePad left];
}

- (void)right
{
    [self.gamePad right];
}

- (void)select
{
    [self.gamePad select];
}

- (void)start
{
    [self.gamePad start];
}

- (void)commandA
{
    [self.gamePad commandA];
}

- (void)commandB
{
    [self.gamePad commandB];
}

- (void)commandX
{
    [self.gamePad commandX];
}

- (void)commandY
{
    [self.gamePad commandY];
}

@end
