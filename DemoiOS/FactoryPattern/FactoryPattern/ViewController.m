//
//  ViewController.m
//  FactoryPattern
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "DeviceFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    iPhoneDevice *iPhone = (iPhoneDevice *)[DeviceFactory deviceFactoryWithDevieType:kiPhone];
    [iPhone fingerprintIndetification];
    
}


@end
