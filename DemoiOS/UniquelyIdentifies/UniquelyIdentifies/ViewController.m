//
//  ViewController.m
//  UniquelyIdentifies
//
//  Created by LiChen on 16/7/18.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"

//获取Open UDID
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>
#import <AdSupport/AdSupport.h>
#import "FCUUID.h"
#include "OpenUDID.h"

// http://blog.sina.com.cn/s/blog_44fa172f0102vwm1.html

//  iOS平台UDID方案比较
// http://www.cocoachina.com/ios/20130715/6597.html

// iOS唯一标示符引导
// http://www.cocoachina.com/ios/20130422/6040.html

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"获取 IDFA = %@", [self getIDFA]);
    NSLog(@"获取 IDFV = %@", [self getIDFV]);
    NSLog(@"获取 CFUUID = %@", [self getCFUUID]);
    NSLog(@"获取 NSUUID = %@", [self getNSUUID]);

    NSLog(@"获取第三方 FCUUID = %@", [self getFCUUID]);
    NSLog(@"获取第三方 OpenUDID = %@", [self getOpenUDID]);
    
}

/**
 *  IDFA    广告标识符
 *
 *  每个设备只有一个IDFA，不同APP在同一设备上获取IDFA的结果是一样的
 *  设备重启不会产生新的IDFA
 *  但IDFA存在重新生成的情况:
 *      用户完全重置系统(设置程序 -> 通用 -> 还原 -> 还原位置与隐私)
 *      用户明确还原广告(设置程序-> 通用 -> 关于本机 -> 广告 -> 还原广告标示符)
 *
 *  Appstore禁止不使用广告而采集IDFA的app上架。
 */
- (NSString *)getIDFA
{
    NSString *IDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return IDFA;
}

/**
 *  IDFV
 *
 *  根据vendor的值，如果vendor相同，则返回同一字符串；如果vendor不同，则返回不同的字符串。
 *  根据xcode文档解释，正常情况下，会根据App Store提供的数据进行判断。
    但是如果app不是通过app store进行安装的(如企业应用或开发调试阶段)，那么会根据bundle ID判断。
 *  如：com.example.app1和com.example.app2,只有最后的后缀不同，所以会产生相同的vendor ID
 *
 */
- (NSString *)getIDFV
{
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return idfv;
}

/**
 *  跟CFUUID一样，这个值系统也不会存储，每次调用的时候都会获得一个新的唯一标示符。
 */
- (NSString *)getNSUUID
{
    NSString *nsuuid = [[NSUUID UUID] UUIDString];
    return nsuuid;
}

/**
 *  每次调用CFUUIDCreate，系统都会返回一个新的唯一标示符。
 */
- (NSString *)getCFUUID
{
    CFUUIDRef cfuuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *cfuuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, cfuuid));
    return cfuuidString;
}


/**
 *  FCUUID
 */
- (NSString *)getFCUUID
{
    NSString *fcuuid = [FCUUID uuid];
    return fcuuid;
}


/**
 *  OpenUDID
 */
- (NSString *)getOpenUDID
{
    NSString *openUDID = [OpenUDID value];
    return openUDID;
}


//- (NSString *)getOpenUDID
//{
//    unsigned char result[16];
//    const char *cStr = [[[NSProcessInfo processInfo] globallyUniqueString] UTF8String];
//    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
//    NSString *openUDID = [NSString stringWithFormat:
//                          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%08lx",
//                          result[0], result[1], result[2], result[3],
//                          result[4], result[5], result[6], result[7],
//                          result[8], result[9], result[10], result[11],
//                          result[12], result[13], result[14], result[15],
//                          (long)(arc4random() % 4294967295)];
//    return openUDID;
//}

@end
