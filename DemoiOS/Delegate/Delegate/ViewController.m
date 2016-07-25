//
//  ViewController.m
//  Delegate
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "Customer.h"
#import "TCPProtocol.h"

@interface ViewController () <CustomerDelegate>

@property (nonatomic) NSInteger sourcePort;
@property (nonatomic) NSInteger destinationPort;

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    Customer *customer = [[Customer alloc] init];
    customer.delegate = self;
    
    [customer buyItemCount:@"5"];
    
}

- (void)customer:(Customer *)customer buyItemCount:(NSUInteger)count
{
    NSLog(@"%@ld", (long)count);
}


- (void)accessTCPData:(id <TCPProtocol>)data
{
    self.sourcePort      = [data sourcePort];
    self.destinationPort = [data destinationPort];
}

@end
