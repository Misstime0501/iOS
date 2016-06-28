//
//  ViewController.m
//  SinaDemo
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SNSLogin:(id)sender {
    
    [WeiboSDK registerApp:@"2548122881"];

    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"http://wanpaiapp.com/oauth/callback/sina";
    request.scope = @"all";
    request.userInfo = @{@"SSO":@"SinaDemo"};
    [WeiboSDK sendRequest:request];
}





@end
