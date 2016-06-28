//
//  TestSession.m
//  PointerTest
//
//  Created by LiChen on 6/5/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "TestSession.h"



static TestSession *currentSession = nil;
static TestSession *staticSession = nil;


@implementation TestSession

@synthesize authUser = _authUser;
@synthesize authToken = _authToken;

- (instancetype)init
{
    if (self = [super init])
    {
        _authToken = [[NSString alloc] init];
        _authUser = [[TestUser alloc] init];
    }
    currentSession = self;
    return self;
}



- (void)setAuthToken:(NSString *)authToken
{
    _authToken = authToken;
//    [TestSession sharedSession];
//    currentSession.authToken = authToken;
}

- (void)setAuthUser:(NSString *)userID userName:(NSString *)userName
{
    _authUser.userID = userID;
    _authUser.userName = userName;
//    [TestSession sharedSession];
//    currentSession.authUser.userID = _authUser.userID;
//    currentSession.authUser.userName = _authUser.userName;
}


- (void)getInfo
{
    [self setAuthToken:@"00000"];
    [self setAuthUser:@"000000" userName:@"0000000"];
}


+ (TestSession *)sharedSession
{
    if (currentSession == nil)
    {
        currentSession = [[TestSession alloc] init];
    }
    return currentSession;
}



+ (void)setStaticSession:(TestSession *)session
{
    if (staticSession == nil)
    {
        staticSession = [[TestSession alloc] init];
    }
    staticSession = session;
}

+ (TestSession *)getStaticSession
{
    return staticSession;
}


@end
