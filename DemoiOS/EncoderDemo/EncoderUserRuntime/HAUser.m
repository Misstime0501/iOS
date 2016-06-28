//
//  UserPropertiesObject.m
//  humbleadminbase
//
//  Created by LiChen on 16/3/2.
//  Copyright © 2016年 HRWY. All rights reserved.
//

#import "HAUser_Private.h"

@implementation HAUser

@synthesize userID = _userID;
@synthesize userName = _userName;
@synthesize phoneNumber = _phoneNumber;
@synthesize emailAddress = _emailAddress;

+ (HAUser *)sharedHAUser
{
    if (kHAUser == nil)
    {
        kHAUser = [[HAUser alloc] init];
    }
    return kHAUser;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _userID = [[NSString alloc] init];
        _userName = [[NSString alloc] init];
        _phoneNumber = [[NSString alloc] init];
        _emailAddress = [[NSString alloc] init];
    }
    return self;
}

- (void)setUserID:(NSString *)userID
{
    _userID = userID;
}

- (NSString *)getUserID
{
    return _userID;
}

- (void)setUserName:(NSString *)userName
{
    _userName = userName;
}

- (NSString *)getUserName
{
    return _userName;
}

- (void)setPhoneNumber:(NSString *)phoneNumber
{
    _phoneNumber = phoneNumber;
}

- (NSString *)getPhoneNumber
{
    return _phoneNumber;
}

- (void)setEmailAddress:(NSString *)emailAddress
{
    _emailAddress = emailAddress;
}

- (NSString *)getEmailAddress
{
    return _emailAddress;
}

- (void)resetHAUser
{
    _userID = [[NSString alloc] init];
    _userName = [[NSString alloc] init];
    _phoneNumber = [[NSString alloc] init];
    _emailAddress = [[NSString alloc] init];
}



- (id)initWithCoder:(NSCoder *)coder
{
    NSLog(@"%s",__func__);
    Class cls = [self class];
    while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
        
        for (int i = 0; i < sharedVarCount; i++) {
            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            id varValue = [coder decodeObjectForKey:key];
            if (varValue) {
                [self setValue:varValue forKey:key];
            }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    NSLog(@"%s",__func__);
    Class cls = [self class];
    while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
        
        for (int i = 0; i < sharedVarCount; i++) {
            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
            id varValue = [self valueForKey:key];
            if (varValue) {
                [coder encodeObject:varValue forKey:key];
            }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
}

/*如果不实现copyWithZone:方法，则[personObject copy]时会崩溃*/
- (id)copyWithZone:(NSZone *)zone
{
    NSLog(@"%s",__func__);
    id copy = [[[self class] allocWithZone:zone] init];
    Class cls = [self class];
    while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
        
        for (int i = 0; i < sharedVarCount; i++) {
            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
            id varValue = [self valueForKey:key];
            if (varValue) {
                [copy setValue:varValue forKey:key];
            }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
    return copy;
}

/* 用来打印本类的所有变量(成员变量+属性变量)，所有层级父类的属性变量及其对应的值 */
- (NSString *)description
{
    NSString  *despStr = @"";
    Class cls = [self class];
    while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL bIsSelfClass = (cls == [self class]);
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int sharedVarCount = 0;
        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
        
        for (int i = 0; i < sharedVarCount; i++) {
            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
            id varValue = [self valueForKey:key];    
            if (varValue) {  
                despStr = [despStr stringByAppendingString:[NSString stringWithFormat:@"%@: %@ n", key, varValue]];  
            }    
        }    
        free(ivarList);  
        free(propList);  
        cls = class_getSuperclass(cls);  
    }    
    return despStr;  
}


@end
