//
//  Communication.m
//  CommunicationDemo
//
//  Created by LiChen on 16/7/24.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "Communication.h"
#import "NSError+ErrorHelper.h"
#import "MacroDefine.h"


@interface Communication ()
{
    NSString                *_requestType;      /// 请求类型
    NSURLSessionDataTask    *_task;             /// 用于请求的 task
    
    NSUInteger              _requestIntStatus;   /// 返回的错误码
    NSString                *_requestStrStatus;  /// 返回的错误字符串
    
}

@end

@implementation Communication

@synthesize didFinishSelector;
@synthesize didFailSelector;

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setDidFinishSelector:@selector(requestFinished:)];
        [self setDidFailSelector:@selector(requestFailed:)];
    }
    return self;
}


- (void)communication:(NSURL *)requestPath
        requestHeader:(NSDictionary *)requestHeader
          requestBody:(NSData *)requestBody
        requestMethod:(NSString *)requestMethod
                block:(blockInformation)block
{
    [self communication:requestPath
          requestHeader:requestHeader
            requestBody:requestBody
          requestMethod:requestMethod
         didFinshSelect:nil
          didFailSelect:nil
                  block:^(BOOL succeeded,
                          NSDictionary *bodyInformation,
                          NSDictionary *headerInformation,
                          NSError *error)
    {
        block(succeeded, bodyInformation, headerInformation, error);
    }];
}

- (void)communication:(NSURL *)requestPath
        requestHeader:(NSDictionary *)requestHeader
          requestBody:(NSData *)requestBody
        requestMethod:(NSString *)requestMethod
       didFinshSelect:(SEL)succSelect
        didFailSelect:(SEL)failSelect
                block:(blockInformation)block
{
    // 停止之前的请求
    [self stopRequest];
    // 重置
    [self resetTask];
    
    _requestStrStatus = EMPTY_STR;
    _requestIntStatus = INIT_INT_VALUE;
    
    
    
    // 设置请求的服务器地址 和 超时限制
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestPath
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:TIME_OUT];
    // 设置请求 Header
    for (NSString *key in requestHeader)
    {
        [request addValue:requestHeader[key] forHTTPHeaderField:key];
    }
    
    // 设置请求的 Body
    [request setHTTPBody:requestBody];
    
    // 请求方法
    [request setHTTPMethod:requestMethod];
    
    // 单例 session
    NSURLSession *session = [NSURLSession sharedSession];
    
    _task = [session dataTaskWithRequest:request
                       completionHandler:^(NSData * _Nullable data,
                                           NSURLResponse * _Nullable response,
                                           NSError * _Nullable error)
    {
        // 获取 返回 的 response 的信息
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        // 头文件中返回的状态码   即网络状态
        NSInteger state = [httpResponse statusCode];
        _requestIntStatus = state;
        
        // 是否可以相应获取所有头信息的方法，从而判断返回的 response 是否为 nil
        if ([response respondsToSelector:@selector(allHeaderFields)])
        {
            // 返回体信息
            NSDictionary *bodyDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:NSJSONReadingAllowFragments
                                                                             error:nil];
            // 请求成功时，携带的状态码
            int status = 0;
            // 为状态码赋值
            if (bodyDictionary != nil && ![bodyDictionary isEqual:[NSNull null]])
            {
                status = [[bodyDictionary objectForKey:REQUEST_STATUS] intValue];
            }
        
            // 体信息中包含了状态码，且状态码的值为不等于零的错误信息
            if (status != 0)
            {
                NSError * error = [self functionForRequestFailed:state codeStatus:status];
                block(NO, nil, nil, error);
            }
            else if (state != 200 && state != 201)
            {
                NSError * error = [self functionForRequestFailed:state codeStatus:0];
                block(NO, nil, nil, error);
            }
            else
            {
                NSDictionary *headerDictionary = [httpResponse allHeaderFields];
                
                [self functionForRequestSussed:bodyDictionary];
                block(YES, bodyDictionary, headerDictionary, nil);
            }
        }
        else if (error != nil)
        {
            NSError * error = [self functionForRequestFailed:state codeStatus:0];
            block(NO, nil, nil, error);
        }
    }];
    [_task resume];
    
    dispatch_queue_t queue = dispatch_queue_create("tk.bourne.communicationQueue", nil);
    dispatch_async(queue, ^{
        while ([self checkStr:_requestStrStatus])
        {
            [NSThread sleepForTimeInterval:0.5];
        }
    });
}


- (void)requestFinished:(Communication *)dictionary
{
//    IMP imp = [self  methodForSelector:[self didFinishSelector]];
//    void (*func)(id, SEL, NSDictionary *) = (void *)imp;
//    func(self, [self didFinishSelector], dictionary);
    
//    [self performSelector:[self didFinishSelector] withObject:dictionary];
}

- (void)requestFailed:(Communication *)error
{
//    IMP imp = [self  methodForSelector:[self didFailSelector]];
//    void (*func)(id, SEL, NSError *) = (void *)imp;
//    func(self, [self didFailSelector], error);
    
//    [self performSelector:[self didFailSelector] withObject:error];
}


- (NSError *)functionForRequestFailed:(NSUInteger)internetState codeStatus:(NSUInteger)codeStatus
{
    NSError *error;
    
    if (codeStatus == 0)
    {
        error = [NSError errorWithDomain:DOMAIN_HUMBLEADMINBASE
                                    code:internetState
                                userInfo:@{}];
    }
    else
    {
        NSString *information = [NSError responseStatusErrorCode:codeStatus];
        error = [NSError errorWithDomain:DOMAIN_HUMBLEADMINBASE
                                    code:internetState
                                userInfo:@{ERROR_INFO : information}];
    }
    
    if (internetState == 200 || internetState == 201)
    {
        _requestStrStatus = [error.userInfo objectForKey:ERROR_INFO];
    }
    else
    {
        _requestStrStatus = [NSError responseStatusErrorCode:internetState];
    }
    
    error = [NSError createError:_requestIntStatus information:_requestStrStatus];
    
//    [self requestFailed:error];
    
    return error;
}


- (void)functionForRequestSussed:(NSDictionary *)dictionary
{
    _requestStrStatus = REQUEST_SUCC_STATUS;
    
//    [self requestFinished:dictionary];
}


- (void)resetRequestType:(NSString *)trustType
{
    if (_requestType != nil)
    {
        _requestType = nil;
    }
    _requestType = [[NSString alloc] initWithFormat:@"%@", trustType];
}

- (void)stopRequest
{
    if (_task != nil)
    {
        [_task cancel];
    }
}

- (void)resetTask
{
    if (_task != nil)
    {
        _task = nil;
    }
}


- (BOOL)checkStr:(NSString *)str
{
    if (str == nil)
    {
        return NO;
    }
    else if ([str isEqualToString:@""])
    {
        return NO;
    }
    return YES;
}




@end
