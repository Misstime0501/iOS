//
//  ViewController.m
//  ProxyPattern
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "ConcreteProxy.h"


@interface ViewController () <MessageProtocol>

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    ConcreteProxy *proxy = [ConcreteProxy alloc];
    proxy.delegate       = self;
    
    [proxy helloWorld];
}

- (void)helloWorld
{
    NSLog(@"xxxxxxxxx");
}


@end
