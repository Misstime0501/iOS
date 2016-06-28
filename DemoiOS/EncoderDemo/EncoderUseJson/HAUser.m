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


- (NSData *)encoder
{
    return [encoderUseJson encoder:self];
}



//- (NSDictionary *)encoderToDic
//{
//    Class clazz ;
//    if (class != nil)
//    {
//        clazz = class;
//    }
//    else
//    {
//        clazz = [classInstance class];
//    }
//    
//    NSMutableDictionary *props = [NSMutableDictionary dictionary];
//    
//    u_int count;
//    objc_property_t* properties = class_copyPropertyList(clazz, &count);
//    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
//    NSMutableArray* valueArray = [NSMutableArray arrayWithCapacity:count];
//    
//    for (int i = 0; i < count ; i++)
//    {
//        objc_property_t property=properties[i];
//        const char *char_f = property_getName(property);
//        
//        NSString *proertyName = [NSString stringWithUTF8String:char_f];
//        id propertyValue = [self valueForKey:(NSString *)proertyName];
//        
//        if (propertyValue)
//        {
//            [props setObject:propertyValue forKey:proertyName];
//        }
//        
//        
//        //        objc_property_t prop=properties[i];
//        //
//        //        const char* propertyName = property_getName(prop);
//        //
//        //        [propertyArray addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
//        //
//        //        id value = [classInstance objectForKey:[NSString stringWithUTF8String:propertyName]];
//        //
//        //        id value =  [classInstance performSelector:NSSelectorFromString([NSString stringWithUTF8String:propertyName])];
//        //        if(value ==nil)
//        //        {
//        //            [valueArray addObject:@""];
//        //        }
//        //        else
//        //        {
//        //            [valueArray addObject:value];
//        //        }
//    }
//    free(properties);
//    //    NSDictionary* dtoDic = [NSDictionary dictionaryWithObjects:valueArray forKeys:propertyArray];
//    //    return dtoDic;
//    NSLog(@"props = %@", props);
//    return props;
//}
//
//
//
//+ (NSDictionary *)getDicFromObject:(id)classInstance class:(Class)class
//{
//    Class clazz ;
//    if (class != nil)
//    {
//        clazz = class;
//    }
//    else
//    {
//        clazz = [classInstance class];
//    }
//    
//    NSMutableDictionary *props = [NSMutableDictionary dictionary];
//    
//    u_int count;
//    objc_property_t* properties = class_copyPropertyList(clazz, &count);
//    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
//    NSMutableArray* valueArray = [NSMutableArray arrayWithCapacity:count];
//    
//    for (int i = 0; i < count ; i++)
//    {
//        objc_property_t property=properties[i];
//        const char *char_f = property_getName(property);
//        
//        NSString *proertyName = [NSString stringWithUTF8String:char_f];
//        id propertyValue = [self valueForKey:(NSString *)proertyName];
//        
//        if (propertyValue)
//        {
//            [props setObject:propertyValue forKey:proertyName];
//        }
//        
//        
//        //        objc_property_t prop=properties[i];
//        //
//        //        const char* propertyName = property_getName(prop);
//        //
//        //        [propertyArray addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
//        //
//        //        id value = [classInstance objectForKey:[NSString stringWithUTF8String:propertyName]];
//        //
//        //        id value =  [classInstance performSelector:NSSelectorFromString([NSString stringWithUTF8String:propertyName])];
//        //        if(value ==nil)
//        //        {
//        //            [valueArray addObject:@""];
//        //        }
//        //        else
//        //        {
//        //            [valueArray addObject:value];
//        //        }
//    }
//    free(properties);
//    //    NSDictionary* dtoDic = [NSDictionary dictionaryWithObjects:valueArray forKeys:propertyArray];
//    //    return dtoDic;
//    NSLog(@"props = %@", props);
//    return props;
//}

@end
