//
//  TestUser.h
//  PointerTest
//
//  Created by LiChen on 6/5/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestUser : NSObject


@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) NSString *userName;

- (instancetype)init;


@end
