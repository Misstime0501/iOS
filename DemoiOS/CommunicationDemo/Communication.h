//
//  Communication.h
//  CommunicationDemo
//
//  Created by LiChen on 16/7/24.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Communication;

@protocol CommunicationDelegate <NSObject>

@optional

- (void)requestFinished:(Communication *)request;
- (void)requestFailed:(Communication *)request;

@end

#pragma mark -

typedef void(^blockInformation)(BOOL succeeded,
                                NSDictionary *bodyInformation,
                                NSDictionary *headerInformation,
                                NSError *error);

#pragma mark -

@interface Communication : NSObject
{
    
    // Called on the delegate (if implemented) when the request completes successfully. Default is requestFinished:
    SEL didFinishSelector;
    
    // Called on the delegate (if implemented) when the request fails. Default is requestFailed:
    SEL didFailSelector;
}

#pragma mark -

- (instancetype)init;

- (void)communication:(NSURL *)requestPath
        requestHeader:(NSDictionary *)requestHeader
          requestBody:(NSData *)requestBody
        requestMethod:(NSString *)requestMethod
       didFinshSelect:(SEL)succSelect
        didFailSelect:(SEL)failSelect
                block:(blockInformation)block;


- (void)communication:(NSURL *)requestPath
        requestHeader:(NSDictionary *)requestHeader
          requestBody:(NSData *)requestBody
        requestMethod:(NSString *)requestMethod
                block:(blockInformation)block;

#pragma mark -

@property (assign) SEL didFinishSelector;
@property (assign) SEL didFailSelector;

@end
