//
//  SubscriptionServiceCenter.h
//  ObserverPattern
//
//  Created by LiChen on 16/6/30.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

// 协议
#import "SubscriptionServiceCenterProtocol.h"


@interface SubscriptionServiceCenter : NSObject

#pragma mark - 维护订阅信息
/**
 *  创建订阅号
 *
 *  @param subscriptionNumber 订阅号码
 */
+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber;

/**
 *  删除订阅号
 *
 *  @param subscriptionNumber 订阅号码
 */
+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber;


#pragma mark - 维护客户信息
/**
 *  添加客户到具体的订阅号当中
 *
 *  @param customer           客户
 *  @param subscriptionNumber 订阅号码
 */
+ (void)addCustomer:(id <SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber;

/**
 *  从具体的订阅号当中移除客户
 *
 *  @param customer           客户
 *  @param subscriptionNumber 订阅号码
 */
+ (void)removeCustomer:(id <SubscriptionServiceCenterProtocol>)customer withSubscriptionNumber:(NSString *)subscriptionNumber;


#pragma mark - 发送消息
/**
 *  发送消息到具体的订阅号当中
 *
 *  @param message            消息
 *  @param subscriptionNumber 订阅号码
 */
+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber;




@end
