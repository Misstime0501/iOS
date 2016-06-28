//
//  ViewController.m
//  EncoderUserRuntime
//
//  Created by LiChen on 6/28/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "HAUser_Private.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [self person];
    NSLog(@"Before archiver : %@", [person description]);
    NSMutableData *data = [NSMutableData data];
    HASERIALIZE_ARCHIVE(person, @"Person", data);
    NSLog(@"data = %@", data);
    
    Person *thePerson = nil;
    HASERIALIZE_UNARCHIVE(thePerson, @"Person", data);
    NSLog(@"-------------------------------------------");
    NSLog(@"the person = %@", thePerson);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
