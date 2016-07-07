//
//  BusinessCardAdapter.m
//  HelloiOSGame
//
//  Created by LiChen on 6/29/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "BusinessCardAdapter.h"

@implementation BusinessCardAdapter

- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self)
    {
        self.data = data;
    }
    return self;
}


- (NSString *)name
{
    return nil;
}

- (UIColor *)lineColor
{
    return nil;
}

- (NSString *)phoneNumber
{
    return nil;
}


@end
