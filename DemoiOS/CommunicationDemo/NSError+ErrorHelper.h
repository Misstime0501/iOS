//
//  NSError+ErrorHelper.h
//  CommunicationDemo
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (ErrorHelper)

/**
 *  网络连接中出现的错误
 *
 *  @param errorCode 错误码
 *
 *  @return 错误信息字符串
 */
+ (NSString *)internetErrorCode:(NSInteger)errorCode;

/**
 *  网络请求成功，在返回信息中返回的错误
 *
 *  @param errorCode 错误码
 *
 *  @return 错误信息字符串
 */
+ (NSString *)responseStatusErrorCode:(NSInteger)errorCode;

/**
 *  由错误码和错误信息生成 Error
 *
 *  @param code        错误码
 *  @param information 错误信息
 *
 *  @return error
 */
+ (NSError *)createError:(NSUInteger)code information:(NSString *)information;

@end
