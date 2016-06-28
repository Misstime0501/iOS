//
//  GcovUseDemoTests.m
//  GcovUseDemoTests
//
//  Created by LiChen on 6/1/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ViewController.h"

extern void __gcov_flush();


@interface GcovUseDemoTests : XCTestCase

@end

@implementation GcovUseDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSayHello
{
    [ViewController sayHello];
}



@end
