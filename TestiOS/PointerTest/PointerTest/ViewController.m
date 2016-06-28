//
//  ViewController.m
//  PointerTest
//
//  Created by LiChen on 6/5/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadView
{
    [super loadView];
    _currentSession = [TestSession sharedSession];
}

- (IBAction)setInfo:(id)sender {
    
    // 初始化 Session 方法
    TestSession *session0 = [[TestSession alloc] init];
    _currentSession = session0;
    [session0 setAuthToken:@"000000000000"];
    [session0 setAuthUser:@"00000000000" userName:@"0000000000000000"];
    
    
    [TestSession setStaticSession:session0];
    
    
    
    TestSession *session1 = [[TestSession alloc] init];
    _currentSession = session1;
    [session1 setAuthToken:@"11111111111"];
    [session1 setAuthUser:@"1111111111111" userName:@"11111111111111"];
}

- (IBAction)getInfo:(id)sender {
    NSLog(@"currentSession = %@", _currentSession);
    NSLog(@"staticSession = %@", [TestSession getStaticSession]);
}

@end
