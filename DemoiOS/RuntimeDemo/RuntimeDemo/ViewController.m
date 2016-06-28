//
//  ViewController.m
//  RuntimeDemo
//
//  Created by LiChen on 6/16/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MetaClassTest *metaClass = [[MetaClassTest alloc] init];
    [metaClass ex_registerClassPair];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
