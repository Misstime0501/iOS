//
//  ViewController.m
//  AbstractFactory
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "FactoryManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    BaseFactory *factory = [FactoryManager factoryWithBrand:kGoogle];
    
    BasePhone *phone = [factory createPhone];
    BaseWatch *watch = [factory createWatch];
    
    NSLog(@"%@  %@", phone, watch);
}


@end
