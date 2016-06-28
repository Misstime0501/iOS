//
//  ViewController.m
//  EncoderUseJson
//
//  Created by LiChen on 6/28/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "HAUser.h"
#import "HAUser_Private.h"
#import "Person.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HAUser *user = [self user];
    NSLog(@"%@", user);
    NSLog(@"%@", [user encoder]);
    
    
    Person *person = [self person];
    NSLog(@"%@", person);
    NSLog(@"%@", [person encoder]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (HAUser *)user
{
    HAUser *user = [[HAUser alloc] init];
    user.userID = @"100";
    user.userName = @"lichen";
    user.phoneNumber = @"13123456789";
    user.emailAddress = @"lichen@gmail.com";
    
    return user;
}

- (Person *)person
{
    Person *person = [[Person alloc] init];
    person.userID = @"200";
    person.userName = @"liuchao";
    person.phoneNumber = @"13800138000";
    person.emailAddress = @"liuchao@gmail.com";
    person.school = @"su zhou you er yuan";
    return person;
}

- (NSData *)encoderUseJson:(NSObject *)object
{
    NSLog(@"%@", [encoderUseJson encoder:object]);
    return [encoderUseJson encoder:object];
}

- (void)decoderUseJson:(NSData *)data
{
    NSLog(@"%@", [encoderUseJson decoder:data]);
}


@end
