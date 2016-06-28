//
//  TestSession.h
//  PointerTest
//
//  Created by LiChen on 6/5/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestUser.h"

@interface TestSession : NSObject

@property (nonatomic, strong, readonly) NSString *authToken;
@property (nonatomic, strong, readonly) TestUser *authUser;

- (instancetype)init;

- (void)setAuthToken:(NSString *)authToken;
- (void)setAuthUser:(NSString *)userID userName:(NSString *)userName;


- (void)getInfo;

+ (TestSession *)sharedSession;

+ (void)setStaticSession:(TestSession *)session;
+ (TestSession *)getStaticSession;




@end
