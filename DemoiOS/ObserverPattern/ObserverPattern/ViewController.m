//
//  ViewController.m
//  ObserverPattern
//
//  Created by LiChen on 16/6/30.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "SubscriptionServiceCenterProtocol.h"
#import "SubscriptionServiceCenter.h"

static NSString *SCIENCE = @"SCIENCE";

@interface ViewController ()  <SubscriptionServiceCenterProtocol>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 创建订阅号
    [SubscriptionServiceCenter createSubscriptionNumber:SCIENCE];
    
    // 添加订阅用户到指定刊物
    [SubscriptionServiceCenter addCustomer:self
                    withSubscriptionNumber:SCIENCE];
    
    // 发送消息
    [SubscriptionServiceCenter sendMessage:@"V1.0"
                      toSubscriptionNumber:SCIENCE];
}

- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber
{
    NSLog(@"%@ %@", message , subscriptionNumber);
}


@end
