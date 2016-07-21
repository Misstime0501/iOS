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
@synthesize headPortrait = _headPortrait;

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
        _headPortrait = [[UIImage alloc] init];
    }
    return self;
}







//- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary
//{
//    self = [super init];
//    if (self)
//    {
//        for (NSString *key in otherDictionary)
//        {
//            [self setValue:otherDictionary[key] forKey:key];
//        }
//    }
//    return self;
//}
//
//- (void)deserializate:(NSDictionary *)dictionary
//{
//    for (NSString *key in dictionary)
//    {
//        [self setValue:dictionary[key] forKey:key];
//    }
//}
//
//- (instancetype)initWithUser:(HAUser *)user
//{
//    self = [super init];
//    if (self)
//    {
//        _userID = user.userID;
//        _userName = user.userName;
//        _phoneNumber = user.phoneNumber;
//        _emailAddress = user.emailAddress;
//    }
//    return self;
//}



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
    _headPortrait = [[UIImage alloc] init];
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    if (self != nil && ![self isEqual:[NSNull null]])
    {
        Class class = [self class];
        while (class != [NSObject class])
        {
            unsigned int outCount, i;
            objc_property_t *properties = class_copyPropertyList(class, &outCount);
            for (i = 0; i<outCount; i++)
            {
                objc_property_t property = properties[i];
                const char* char_f =property_getName(property);
                
                NSString *propertyName = [NSString stringWithUTF8String:char_f];
                id propertyValue = [self valueForKey:(NSString *)propertyName];
                
                if ([propertyValue isKindOfClass:[UIImage class]])
                {
                    propertyValue = [self imageToString:propertyValue];
                }
                
                if (propertyValue)
                    [result setObject:propertyValue forKey:propertyName];
            }
            free(properties);
            class = [class superclass];
        }
    }
    return result;
}



- (NSData *)imageToData:(UIImage *)image
{
    return UIImageJPEGRepresentation(image, 1.0f);
}

- (NSString *)dataToEncodeString:(NSData *)data
{
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (NSString *)imageToString:(UIImage *)image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

- (NSData *)encodeStringToData:(NSString *)string
{
    return [[NSData alloc] initWithBase64EncodedString:string
                                               options:NSDataBase64DecodingIgnoreUnknownCharacters];
}

- (UIImage *)dataToImage:(NSData *)data
{
    return [UIImage imageWithData:data];
}

- (UIImage *)stringToImage:(NSString *)string
{
    NSData *data   = [[NSData alloc] initWithBase64EncodedString:string
                                                         options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}


- (NSData *)encoder
{
    NSError *error;
    return [NSJSONSerialization dataWithJSONObject:[self dictionary]
                                           options:NSJSONWritingPrettyPrinted
                                             error:&error];
    
}

- (NSDictionary *)decoder:(NSData *)data
{
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&error];
    return dictionary;
}

- (id)object:(NSDictionary *)dictionary
{
    id copy = [[[self class] alloc] init];
    
    Class class = [self class];
    while (class != [NSObject class])
    {
        u_int count;
        objc_property_t *properties = class_copyPropertyList(class, &count);
        for (int i = 0; i < count; i++)
        {
            objc_property_t property = properties[i];
            const char *propertyName = property_getName(property);
//            const char *propertyAttributes = property_getAttributes(property);
            
            NSString * str = [NSString stringWithCString:property_getAttributes(property)
                                                encoding:NSUTF8StringEncoding];
            NSString *key = [NSString stringWithUTF8String:propertyName];
            
            if ([key isEqualToString:@"userID"])
            {
                id value = [dictionary valueForKey:@"object_id"];
                [copy setValue:value forKey:key];
            }
            else
            {
                id value = [dictionary valueForKey:key];
                if ([str rangeOfString:@"UIImage"].location !=NSNotFound)
                {
                    NSLog(@"str = %@", str);
                    value = [self stringToImage:value];
                }
                [copy setValue:value forKey:key];
            }
        }
        free(properties);
        class = [class superclass];
    }
    return copy;
}



//- (id)getObjectFromDic:(NSDictionary *)dic
//{
//    id copy = [[[self class] alloc] init];
//    NSDictionary *dictionary = [[NSDictionary alloc] init];
//    dictionary = dic;
//
//    Class class = [self class];
//    while (class != [NSObject class])
//    {
//        NSString *className = NSStringFromClass(class);
//        if ([dictionary objectForKey:className])
//        {
//            dictionary = [dictionary objectForKey:className];
//        }
//        u_int count;
//        objc_property_t *properties = class_copyPropertyList(class, &count);
//        for (int i = 0; i < count; i++)
//        {
//            objc_property_t property = properties[i];
//            const char *propertyName = property_getName(property);
//
//            NSString *key = [NSString stringWithUTF8String:propertyName];
//            id value = [dictionary valueForKey:key];
//            if (value)
//            {
//                if ([key isEqualToString:@"userID"])
//                {
//                    [copy setUserID:value];
//                }
//                else if ([key isEqualToString:@"userName"])
//                {
//                    [copy setUserName:value];
//                }
//                else if ([key isEqualToString:@"phoneNumber"])
//                {
//                    [copy setPhoneNumber:value];
//                }
//                else if ([key isEqualToString:@"emailAddress"])
//                {
//                    [copy setEmailAddress:value];
//                }
//                else
//                {
//                    [copy setValue:value forKey:key];
//                }
//            }
//        }
//        free(properties);
//        class = [class superclass];
//    }
//    return copy;
//}
//
//- (id)decoder:(NSData *)data object:(id)object
//{
//    NSError *error;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
//                                                        options:NSJSONReadingMutableContainers
//                                                          error:&error];
//    return [self getObjectFromDic:dic object:object];
//}
//
//
//- (id)decoder:(NSData *)data
//{
//    NSError *error;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
//                                                        options:NSJSONReadingMutableContainers
//                                                          error:&error];
//    return [self getObjectFromDic:dic object:self];
//}
//
//
//- (NSDictionary *)getDictionaryFromObject:(id)classInstance
//{
//    if (classInstance != nil && ![classInstance isEqual:[NSNull null]])
//    {
//        NSMutableArray *objectName = [[NSMutableArray alloc] init];
//        NSDictionary *returnDictionary = [[NSDictionary alloc] init];
//
//        Class clazz = [classInstance class];
//        while (![NSStringFromClass(clazz) isEqualToString:@"NSObject"])
//        {
//            [objectName addObject:NSStringFromClass(clazz)];
//            clazz = [clazz superclass];
//        }
//        if (objectName.count == 0)
//        {
//            returnDictionary = [self getDicFromObject:classInstance class:nil];
//        }
//        else
//        {
//            for (int i = (int)objectName.count ; i > 0; i--)
//            {
//                NSDictionary *dic = [self getDicFromObject:classInstance
//                                                     class:NSClassFromString([objectName objectAtIndex:i - 1])];
//                if (i != objectName.count)
//                {
//                    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithDictionary:dic];
//                    [mDic setObject:returnDictionary forKey:[objectName objectAtIndex:i]];
//                    returnDictionary = mDic;
//                }
//                else
//                {
//                    returnDictionary = dic;
//                }
//            }
//        }
//        return returnDictionary;
//    }
//    else
//    {
//        return nil;
//    }
//}
//
//- (NSDictionary *)getDicFromObject:(id)classInstance class:(Class)class
//{
//    Class clazz = [classInstance class];
//    if (class != nil)
//    {
//        clazz = class;
//    }
//    NSMutableDictionary *props = [NSMutableDictionary dictionary];
//    u_int count;
//    objc_property_t* properties = class_copyPropertyList(clazz, &count);
//    for (int i = 0; i < count ; i++)
//    {
//        objc_property_t property=properties[i];
//        const char *char_f = property_getName(property);
//
//        NSString *proertyName = [NSString stringWithUTF8String:char_f];
//        id propertyValue = [classInstance valueForKey:(NSString *)proertyName];
//
//        if (propertyValue)
//        {
//            [props setObject:propertyValue forKey:proertyName];
//        }
//    }
//    free(properties);
//    return props;
//}
//
//
//
//
//
//- (id)getObjectFromDic:(NSDictionary *)dic object:(id)object
//{
//    id copy = [[[object class] alloc] init];
//    NSDictionary *dictionary = [[NSDictionary alloc] init];
//    dictionary = dic;
//
//    Class class = [object class];
//    while (class != [NSObject class])
//    {
//        NSString *className = NSStringFromClass(class);
//        if ([dictionary objectForKey:className])
//        {
//            dictionary = [dictionary objectForKey:className];
//        }
//        u_int count;
//        objc_property_t *properties = class_copyPropertyList(class, &count);
//        for (int i = 0; i < count; i++)
//        {
//            objc_property_t property = properties[i];
//            const char *propertyName = property_getName(property);
//
//            NSString *key = [NSString stringWithUTF8String:propertyName];
//            id value = [dictionary valueForKey:key];
//            if (value)
//            {
//                if ([key isEqualToString:@"userID"])
//                {
//                    [copy setUserID:value];
//                }
//                else if ([key isEqualToString:@"userName"])
//                {
//                    [copy setUserName:value];
//                }
//                else if ([key isEqualToString:@"phoneNumber"])
//                {
//                    [copy setPhoneNumber:value];
//                }
//                else if ([key isEqualToString:@"emailAddress"])
//                {
//                    [copy setEmailAddress:value];
//                }
//                else
//                {
//                    [copy setValue:value forKey:key];
//                }
//            }
//        }
//        free(properties);
//        class = [class superclass];
//    }
//    return copy;
//}
//
//+ (id)getObject:(NSData *)data
//{
//    NSError *error;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
//                                                        options:NSJSONReadingMutableContainers
//                                                          error:&error];
//    id copy = [[[self class] alloc] init];
//    NSDictionary *dictionary = [[NSDictionary alloc] init];
//    dictionary = dic;
//
//    Class class = [self class];
//    while (class != [NSObject class])
//    {
//        NSString *className = NSStringFromClass(class);
//        if ([dictionary objectForKey:className])
//        {
//            dictionary = [dictionary objectForKey:className];
//        }
//        u_int count;
//        objc_property_t *properties = class_copyPropertyList(class, &count);
//        for (int i = 0; i < count; i++)
//        {
//            objc_property_t property = properties[i];
//            const char *propertyName = property_getName(property);
//
//            NSString *key = [NSString stringWithUTF8String:propertyName];
//            id value = [dictionary valueForKey:key];
//            if (value)
//            {
//                if ([key isEqualToString:@"userID"])
//                {
//                    [copy setUserID:value];
//                }
//                else if ([key isEqualToString:@"userName"])
//                {
//                    [copy setUserName:value];
//                }
//                else if ([key isEqualToString:@"phoneNumber"])
//                {
//                    [copy setPhoneNumber:value];
//                }
//                else if ([key isEqualToString:@"emailAddress"])
//                {
//                    [copy setEmailAddress:value];
//                }
//                else
//                {
//                    [copy setValue:value forKey:key];
//                }
//            }
//        }
//        free(properties);
//        class = [class superclass];
//    }
//    return copy;
//}
//
//
//- (id)getObjectFromDic:(NSDictionary *)dic
//{
//    id copy = [[[self class] alloc] init];
//    NSDictionary *dictionary = [[NSDictionary alloc] init];
//    dictionary = dic;
//
//    Class class = [self class];
//    while (class != [NSObject class])
//    {
//        NSString *className = NSStringFromClass(class);
//        if ([dictionary objectForKey:className])
//        {
//            dictionary = [dictionary objectForKey:className];
//        }
//        u_int count;
//        objc_property_t *properties = class_copyPropertyList(class, &count);
//        for (int i = 0; i < count; i++)
//        {
//            objc_property_t property = properties[i];
//            const char *propertyName = property_getName(property);
//
//            NSString *key = [NSString stringWithUTF8String:propertyName];
//            id value = [dictionary valueForKey:key];
//            if (value)
//            {
//                if ([key isEqualToString:@"userID"])
//                {
//                    [copy setUserID:value];
//                }
//                else if ([key isEqualToString:@"userName"])
//                {
//                    [copy setUserName:value];
//                }
//                else if ([key isEqualToString:@"phoneNumber"])
//                {
//                    [copy setPhoneNumber:value];
//                }
//                else if ([key isEqualToString:@"emailAddress"])
//                {
//                    [copy setEmailAddress:value];
//                }
//                else
//                {
//                    [copy setValue:value forKey:key];
//                }
//            }
//        }
//        free(properties);
//        class = [class superclass];
//    }
//    return copy;
//}


#pragma mark - runtime 进行序列化
//- (id)initWithCoder:(NSCoder *)coder
//{
//    NSLog(@"%s",__func__);
//    Class cls = [self class];
//    while (cls != [NSObject class]) {
//        /*判断是自身类还是父类*/
//        BOOL bIsSelfClass = (cls == [self class]);
//        unsigned int iVarCount = 0;
//        unsigned int propVarCount = 0;
//        unsigned int sharedVarCount = 0;
//        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
//        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
//        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
//
//        for (int i = 0; i < sharedVarCount; i++) {
//            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
//            NSString *key = [NSString stringWithUTF8String:varName];
//            id varValue = [coder decodeObjectForKey:key];
//            if (varValue) {
//                [self setValue:varValue forKey:key];
//            }
//        }
//        free(ivarList);
//        free(propList);
//        cls = class_getSuperclass(cls);
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)coder
//{
//    NSLog(@"%s",__func__);
//    Class cls = [self class];
//    while (cls != [NSObject class]) {
//        /*判断是自身类还是父类*/
//        BOOL bIsSelfClass = (cls == [self class]);
//        unsigned int iVarCount = 0;
//        unsigned int propVarCount = 0;
//        unsigned int sharedVarCount = 0;
//        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
//        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
//        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
//
//        for (int i = 0; i < sharedVarCount; i++) {
//            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
//            NSString *key = [NSString stringWithUTF8String:varName];
//            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
//            id varValue = [self valueForKey:key];
//            if (varValue) {
//                [coder encodeObject:varValue forKey:key];
//            }
//        }
//        free(ivarList);
//        free(propList);
//        cls = class_getSuperclass(cls);
//    }
//}
//
///*如果不实现copyWithZone:方法，则[personObject copy]时会崩溃*/
//- (id)copyWithZone:(NSZone *)zone
//{
//    NSLog(@"%s",__func__);
//    id copy = [[[self class] allocWithZone:zone] init];
//    Class cls = [self class];
//    while (cls != [NSObject class]) {
//        /*判断是自身类还是父类*/
//        BOOL bIsSelfClass = (cls == [self class]);
//        unsigned int iVarCount = 0;
//        unsigned int propVarCount = 0;
//        unsigned int sharedVarCount = 0;
//        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
//        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
//        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
//
//        for (int i = 0; i < sharedVarCount; i++) {
//            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
//            NSString *key = [NSString stringWithUTF8String:varName];
//            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
//            id varValue = [self valueForKey:key];
//            if (varValue) {
//                [copy setValue:varValue forKey:key];
//            }
//        }
//        free(ivarList);
//        free(propList);
//        cls = class_getSuperclass(cls);
//    }
//    return copy;
//}
//
///* 用来打印本类的所有变量(成员变量+属性变量)，所有层级父类的属性变量及其对应的值 */
//- (NSString *)description
//{
//    NSString  *despStr = @"";
//    Class cls = [self class];
//    while (cls != [NSObject class]) {
//        /*判断是自身类还是父类*/
//        BOOL bIsSelfClass = (cls == [self class]);
//        unsigned int iVarCount = 0;
//        unsigned int propVarCount = 0;
//        unsigned int sharedVarCount = 0;
//        Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/
//        objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/
//        sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;
//
//        for (int i = 0; i < sharedVarCount; i++) {
//            const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
//            NSString *key = [NSString stringWithUTF8String:varName];
//            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/
//            id varValue = [self valueForKey:key];
//            if (varValue) {
//                despStr = [despStr stringByAppendingString:[NSString stringWithFormat:@"%@: %@ n", key, varValue]];
//            }
//        }
//        free(ivarList);
//        free(propList);
//        cls = class_getSuperclass(cls);
//    }
//    return despStr;
//}
@end
