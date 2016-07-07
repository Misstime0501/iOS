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
{
    NSData *_data;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    HAUser *user = [self user];
    
    
    
    
    
    
    
    
    
    HAUser *user = [[HAUser alloc] init];
    user.userID = @"100";
    user.userName = @"lichen";
    user.phoneNumber = @"13123456789";
    user.emailAddress = @"lichen@gmail.com";
    
    HAUser *user2 = [[HAUser alloc] initWithUser:user];
    
    Person *person = [[Person alloc] initWithUser:user];
    person.school = @"人民大学";
    
    
    
    
    
    
    
    
    
    
    
    
//    Person *person = [self person];
    
    NSLog(@"person = %@", [person description]);
    
    
    NSLog(@"data0 = %@", [person serializeArchive]);
//    NSLog(@"data1 = %@", [person serializeArchive:person]);
//    
//    _data = [person serializeArchive:person];
//    
//    
//    NSMutableData *data2 = [NSMutableData data];
//    HASERIALIZE_ARCHIVE(person, @"Person", data2);
//    NSLog(@"data2 = %@", data2);

    
    
    
    
    
//    
    Person *thePerson0 = nil;
//
//    thePerson0 = [thePerson0 serializeUnarchive:thePerson0 data:data1];
//    NSLog(@"thePerson0 = %@", thePerson0);

    
    HASERIALIZE_UNARCHIVE(thePerson0, @"Person", [person serializeArchive]);
    NSLog(@"thePerson0 = %@", thePerson0);

    
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






- (IBAction)clickButton:(id)sender
{
    Person *thePerson = nil;
}



@end
