//
//  UserPropertiesObject_Private.h
//  humbleadminbase
//
//  Created by LiChen on 16/3/2.
//  Copyright © 2016年 HRWY. All rights reserved.
//

#import "HAUser.h"
#import <objc/runtime.h>


static HAUser *kHAUser = nil;


#define HASERIALIZE_ARCHIVE(__objToBeArchived__, __key__, __data__)    \
NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:__data__];   \
[archiver encodeObject:__objToBeArchived__ forKey:__key__];    \
[archiver finishEncoding];

#define HASERIALIZE_UNARCHIVE(__objToStoreData__, __key__, __data__)   \
NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:__data__];  \
__objToStoreData__ = [unarchiver decodeObjectForKey:__key__];  \
[unarchiver finishDecoding]

@interface HAUser ()
{
    
}

/**
 *  单例初始化对象
 *
 *  @return 返回单例的对象
 */
+ (HAUser *)sharedHAUser;

/**
 *  设置用户的 UserID
 *
 *  @param userID 传入的 UserID
 */
- (void)setUserID:(NSString *)userID;

/**
 *  设置用户的用户名
 *
 *  @param userName 用户名
 */
- (void)setUserName:(NSString *)userName;

/**
 *  设置用户的手机号码
 *
 *  @param phoneNumber 传入的手机号码
 */
- (void)setPhoneNumber:(NSString *)phoneNumber;

/**
 *  设置用户的邮箱地址
 *
 *  @param emailAddress 传入的邮箱地址
 */
- (void)setEmailAddress:(NSString *)emailAddress;

/**
 *  获取用户的 UserID
 *
 *  @return 返回用户的 UserID
 */
- (NSString *)getUserID;

/**
 *  获取用户的用户名
 *
 *  @return 返回用户的用户名
 */
- (NSString *)getUserName;

/**
 *  获取用户的手机号码
 *
 *  @return 返回用户的手机号码
 */
- (NSString *)getPhoneNumber;

/**
 *  获取用户的邮箱地址
 *
 *  @return 返回用户的邮箱地址
 */
- (NSString *)getEmailAddress;

/**
 *  重置 UserPropertiesObject 中的值
 */
- (void)resetHAUser;


//- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary;
//
//- (void)deserializate:(NSDictionary *)dictionary;


- (NSDictionary *)dictionary;
- (NSData *)encoder;
- (NSDictionary *)decoder:(NSData *)data;
- (id)object:(NSDictionary *)dictionary;



- (NSString *)imageToString:(UIImage *)image;

- (UIImage *)stringToImage:(NSString *)string;


//- (NSDictionary *)getDictionaryFromObject:(id)classInstance;
//
//
//- (id)getObjectFromDic:(NSDictionary *)dic object:(id)object;
//
//
//
//- (id)getObjectFromDic:(NSDictionary *)dic;


@end