//
//  SubscriptionServiceCenterProtocol.h
//  ObserverPattern
//
//  Created by LiChen on 16/6/30.
//  Copyright © 2016年 LiChen. All rights reserved.
//

// 限制客户的协议

#import <Foundation/Foundation.h>

@protocol SubscriptionServiceCenterProtocol <NSObject>

- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber;

@end
