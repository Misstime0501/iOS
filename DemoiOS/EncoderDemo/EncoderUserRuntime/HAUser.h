//
//  UserPropertiesObject.h
//  humbleadminbase
//
//  Created by LiChen on 16/3/2.
//  Copyright © 2016年 HRWY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


#define HASERIALIZE_ARCHIVE(__objToBeArchived__, __key__, __data__)    \
\
NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:__data__];   \
[archiver encodeObject:__objToBeArchived__ forKey:__key__];    \
[archiver finishEncoding];

#define HASERIALIZE_UNARCHIVE(__objToStoreData__, __key__, __data__)   \
NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:__data__];  \
__objToStoreData__ = [unarchiver decodeObjectForKey:__key__];  \
[unarchiver finishDecoding]

/**
 *  可信 ID 对象类
 */
@interface HAUser : NSObject

/**
 *  用户的 UserID 信息
 */
@property (atomic, retain, readonly) NSString *userID;
/**
 *  用户注册后得以用户名
 */
@property (atomic, retain, readonly) NSString *userName;
/**
 *  用户的手机号码信息
 */
@property (atomic, retain, readonly) NSString *phoneNumber;

/**
 *  用户的邮箱信息
 */
@property (atomic, retain, readonly) NSString *emailAddress;

/**
 *  初始化对象
 *
 *  @return 返回初始化对象
 */
- (instancetype)init;





@end


