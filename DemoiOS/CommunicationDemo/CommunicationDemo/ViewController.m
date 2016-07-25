//
//  ViewController.m
//  CommunicationDemo
//
//  Created by LiChen on 16/7/24.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "Communication.h"

#define SERVER_REQUEST_USC_PATH                                     @"http://hecd-1.humbleadmin.com"
#define SERVER_REQUEST_API_TYPE                                     @"/api/"

#define SERVER_REQUEST_VERSION                                      @"v1.01"

#define SERVER_REQUEST_SMS_OTP                                      @"/requestSMSOTP"


#define SERVER_REQUEST_USERS                                        @"/users"
#define SERVER_REQUSET_USERID                                       @"/"




#define APP_ID                                                      @"X-HA-AppID"
#define APP_KEY                                                     @"X-HA-AppKey"
#define APP_SESSION                                                 @"X-HA-Session"
#define APP_ACCESS                                                  @"X-HA-Access"



#define REQUEST_KEY_TIME_TO_LIVE                                    @"ttl"
#define REQUEST_KEY_PHONE                                           @"phone"
#define REQUEST_KEY_LOGIN_NAME                                      @"loginname"
#define REQUEST_KEY_EVENT                                           @"event"

#define REQUEST_EVENT_OF_AUTH                                       @"auth"



#define TEST_APP_ID                                          @"kjLzuM6BripEGyPsjZc3zZs71468569398"
#define TEST_APP_KEY                                         @"cee98596e3ee445ab0823397a659d1e9"


#define TEST_PHONE_NUMBER                                    @"15110167466"
#define TEST_EMPTY_STR                                       @""

#define TEST_USER_NAME_EMAIL_USER                            @"aoteman"
#define TEST_USER_NAME_PHONE_USER                            @"aotewoman"
#define TEST_STATIC_EMAIL                                    @"2135254722@qq.com"
#define TEST_STATIC_PHONE                                    @"18501306547"
#define TEST_EMAIL                                           @"2137525849@qq.com"
#define TEST_PASSWORD                                        @"11111111"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *server_path = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@",
                                               SERVER_REQUEST_USC_PATH,
                                               SERVER_REQUEST_API_TYPE,
                                               SERVER_REQUEST_VERSION,
                                               SERVER_REQUEST_SMS_OTP]];
    
    NSDictionary *server_head = @{@"Content-Type" : @"application/json" ,
                                        @"Accept" : @"application/json" ,
                                           APP_ID : TEST_APP_ID ,
                                          APP_KEY : TEST_APP_KEY
                                  };
    
    NSDictionary *server_body = @{REQUEST_KEY_TIME_TO_LIVE:@"15" ,
                                         REQUEST_KEY_PHONE:TEST_PHONE_NUMBER ,
                                         REQUEST_KEY_EVENT:REQUEST_EVENT_OF_AUTH
                                  };
    
    NSData *server_body_data = [NSJSONSerialization dataWithJSONObject:server_body
                                                               options:NSJSONWritingPrettyPrinted
                                                                 error:nil];
    
    Communication *communication = [[Communication alloc] init];
    [communication communication:server_path
                   requestHeader:server_head
                     requestBody:server_body_data
                   requestMethod:@"POST"
                           block:^(BOOL succeeded,
                                   NSDictionary *bodyInformation,
                                   NSDictionary *headerInformation,
                                   NSError *error)
    {
        NSLog(@"block.....");
    }];
}

- (void)succ:(NSDictionary *)dictionary
{
    NSLog(@"succ.......");
}

- (void)fail:(NSError *)error
{
    NSLog(@"fail.......");
}


@end
