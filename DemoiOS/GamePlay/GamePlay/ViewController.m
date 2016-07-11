//
//  ViewController.m
//  GamePlay
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "GamePad.h"
#import "GamePadDecorator.h"
#import "CheatGamePadDecorator.h"

#import "GamePad+Cheat.h"
#import "GamePad+Coin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    GamePad *gamePad = [[GamePad alloc] init];
    [gamePad up];
    [gamePad cheat];
    
    gamePad.coin = 10;
    NSLog(@"coin %ld", (long)gamePad.coin);
    
    
    GamePadDecorator *gamePadDecorator = [[GamePadDecorator alloc] init];
    [gamePadDecorator up];
    
    CheatGamePadDecorator *cheatPad = [[CheatGamePadDecorator alloc] init];
    [cheatPad cheat];
}

@end
