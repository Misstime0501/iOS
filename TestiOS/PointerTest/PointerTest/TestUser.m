//
//  TestUser.m
//  PointerTest
//
//  Created by LiChen on 6/5/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "TestUser.h"

@implementation TestUser

@synthesize userID = _userID;
@synthesize userName = _userName;

- (instancetype)init
{
    if (self = [super init])
    {
        _userID = [[NSString alloc] init];
        _userName = [[NSString alloc] init];
    }
    return self;
}

@end
