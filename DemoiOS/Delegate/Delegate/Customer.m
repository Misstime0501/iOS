//
//  Customer.m
//  Delegate
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "Customer.h"

@implementation Customer


- (void)buyItemCount:(NSUInteger)count
{
    // 是否存在，是否相应某种方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(customer:buyItemCount:)])
    {
        [self.delegate customer:self buyItemCount:count];
    }
}
@end
