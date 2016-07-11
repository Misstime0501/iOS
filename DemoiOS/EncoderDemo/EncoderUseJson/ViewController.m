//
//  ViewController.m
//  EncoderUseJson
//
//  Created by LiChen on 6/28/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "HAUser.h"
#import "HAUser_Private.h"
#import "Person.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 创建 Person 对象
    Person *person = [self person];
    
    // 序列化
    NSData *personData = [person encoder];
    NSLog(@"序列化之后的二进制 Data = %@", personData);
    
    // 返序列化
    Person *newPerson = [Person getObject:personData];
    NSLog(@"以二进制 Data 反序列化得 Person = %@", newPerson);
    
    Dog *dog = [self dog];
    
    NSData *dogData = [dog encoder];
    NSLog(@"Dog 序列化后 = %@", dogData);
    
    Dog *newDog = [Dog getObject:dogData];
    NSLog(@"以 Data 反序列化的 newDog = %@", newDog);
    
    HAUser *user = newDog;
    NSLog(@"user = %@",user);
}

- (Person *)person
{
    Person *person = [[Person alloc] init];
    person.userID = @"200";
    person.userName = @"aoteman";
    person.phoneNumber = @"13800138000";
    person.emailAddress = @"aoteman@gmail.com";
    person.school = @"su zhou you er yuan";
    return person;
}

- (Dog *)dog
{
    Dog *dog = [[Dog alloc] initWithUser:[self person]];
    dog.age = @"15";
    dog.nickName = @"tai di";
    return dog;
}


- (HAUser *)user
{
    HAUser *user = [[HAUser alloc] init];
    user.userID = @"100";
    user.userName = @"aotewoman";
    user.phoneNumber = @"13123456789";
    user.emailAddress = @"aotewoman@gmail.com";
    
    return user;
}

- (NSData *)encoderUseJson:(NSObject *)object
{
    return [encoderUseJson encoder:object];
}

- (id)decoderUseJson:(NSData *)data
{
    return [encoderUseJson decoder:data];
}


@end
