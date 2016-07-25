
//
//  NSError+ErrorHelper.m
//  CommunicationDemo
//
//  Created by LiChen on 16/7/25.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "NSError+ErrorHelper.h"
#import "MacroDefine.h"

@implementation NSError (ErrorHelper)


+ (NSString *)internetErrorCode:(NSInteger)errorCode
{
    switch (errorCode)
    {
        case 100:
            return @"请求者应当继续提出请求";
            break;
        case 101:
            return @"请求者已要求服务器切换协议，服务器已确认并准备切换";
            break;
        case 102:
            return @"请求处理中";
            break;
        case 200:
            return @"请求成功";
            break;
        case 201:
            return @"请求成功并且服务器创建了新的资源";
            break;
        case 202:
            return @"服务器已接受请求，但尚未处理";
            break;
        case 203:
            return @"服务器已成功处理了请求，但返回的信息可能来自另一来源";
            break;
        case 204:
            return @"服务器成功处理了请求，但没有返回任何内容";
            break;
        case 205:
            return @"服务器成功处理了请求，但没有返回任何内容，请重置表单";
            break;
        case 206:
            return @"服务器成功处理了部分 GET 请求";
            break;
        case 207:
            return @"多状态请求";
            break;
        case 208:
            return @"请求报告已发送";
            break;
        case 300:
            return @"多种选择请求";
            break;
        case 301:
            return @"请求的网页已永久移动到新位置";
            break;
        case 302:
            return @"临时移动";
            break;
        case 303:
            return @"查看其他位置";
            break;
        case 304:
            return @"未修改";
            break;
        case 305:
            return @"使用代理";
            break;
        case 307:
            return @"临时重定向";
            break;
        case 308:
            return @"永久重定向";
            break;
        case 400:
            return @"请求无效";
            break;
        case 401:
            return @"请求未经授权";
            break;
        case 402:
            return @"请求前需付款";
            break;
        case 403:
            return @"服务器收到请求，但是拒绝提供服务";
            break;
        case 404:
            return @"服务器找不到请求的网页";
            break;
        case 405:
            return @"禁用请求中指定的方法";
            break;
        case 406:
            return @"无法使用请求的内容特性响应请求的网页";
            break;
        case 407:
            return @"需要代理授权";
            break;
        case 408:
            return @"请求超时";
            break;
        case 409:
            return @"服务器在完成请求时发生冲突";
            break;
        case 410:
            return @"请求的资源已永久删除";
            break;
        case 411:
            return @"请求长度无效";
            break;
        case 412:
            return @"未满足前提条件";
            break;
        case 413:
            return @"请求实体过大";
            break;
        case 414:
            return @"请求的 URI 过长";
            break;
        case 415:
            return @"不支持的媒体类型";
            break;
        case 416:
            return @"请求范围不符合要求";
            break;
        case 417:
            return @"未满足期望值";
            break;
        case 421:
            return @"请求数量超出限定范围";
            break;
        case 422:
            return @"请求无效";
            break;
        case 423:
            return @"当前资源被锁定";
            break;
        case 424:
            return @"由于之前的某个请求发生的错误，导致当前请求失败";
            break;
        case 426:
            return @"请求前需升级";
            break;
        case 429:
            return @"请求数量过多";
            break;
        case 431:
            return @"请求头过大，请求失败";
            break;
        case 432:
            return @"用户不存在";
            break;
        case 433:
            return @"密码错误";
            break;
        case 434:
            return @"用户注册后未激活";
            break;
        case 435:
            return @"用户已存在，不可重复注册";
            break;
        case 436:
            return @"令牌过期";
            break;
        case 437:
            return @"已经激活";
            break;
        case 438:
            return @"动态激活码错误";
            break;
        case 439:
            return @"所传参数不必配";
            break;
        case 440:
            return @"密码长度有误";
            break;
        case 441:
            return @"未设置 AppID 和 AppKey";
            break;
        case 442:
            return @"未设置 AppSchema";
            break;
        case 443:
            return @"未设置正确的登录类型";
            break;
        case 444:
            return @"未设置正确的用户名";
            break;
        case 445:
            return @"输入的手机号码格式有误";
            break;
        case 446:
            return @"输入的邮箱格式有误";
            break;
        case 447:
            return @"未进行登录申请前无法进行验证码验证的申请";
            break;
        case 448:
            return @"未设置 USC 的 OpenID 端口";
            break;
        case 449:
            return @"未设置正确的联系方式";
            break;
        case 450:
            return @"验证码长度有误";
            break;
        case 452:
            return @"验证超时";
            break;
        case 500:
            return @"服务器发生不可预期的错误";
            break;
        case 501:
            return @"方法未实现";
            break;
        case 502:
            return @"网关错误";
            break;
        case 503:
            return @"服务不可用";
            break;
        case 504:
            return @"网关请求超时";
            break;
        case 505:
            return @"HTTP版本不支持";
            break;
        case 506:
            return @"服务器存在内部配置错误";
            break;
        case 507:
            return @"服务器无法存储完成请求所必须的内容";
            break;
        case 508:
            return @"请求内包含循环";
            break;
        case 510:
            return @"获取资源所需要的策略并没有没满足";
            break;
        case 511:
            return @"未进行身份验证";
            break;
        case -1001:
            return @"请求超时";
            break;
        case -1004:
            return @"无法连接到服务器";
            break;
        case 701:
            return @"QQ 授权出错";
            break;
        case 702:
            return @"微博授权出错";
        default:
            HABLog(@"Error = %ld", (long)errorCode);
            return @"未知异常";
            break;
    }
    return @"未知异常";
}


/**
 *  服务器连接成功返回的错误码
 *
 *  @param errorCode 错误码
 *
 *  @return 返回错误提示
 */
+ (NSString *)responseStatusErrorCode:(NSInteger)errorCode
{
    HABLog(@"当前错误值为 = %ld", (long)errorCode);
    switch (errorCode) {
        case 1:
            return @"未知错误";
            break;
        case 30:
            return @"请求参数错误";
            break;
        case 31:
            return @"未授权的访问";
            break;
        case 32:
            return @"登录名或密码错误";
            break;
        case 34:
            return @"邮箱未验证";
            break;
        case 35:
            return @"手机号码已被使用";
            break;
        case 36:
            return @"邮箱已被使用";
            break;
        case 37:
            return @"令牌错误或已过期";
            break;
        case 38:
            // 无效的 OTP，一般是 OTP 错误或过期 Invalid One Time Password
            return @"无效的 OTP";
            break;
        case 40:
            // 密码没有达到强度标准 Password must meet complexity requirements.
            return @"密码没有达到强度标准";
            break;
        case 50:
            // 无法向手机号码发送 OTP Fails to send message.
            return @"无法向手机号码发送 OTP";
            break;
        case 51:
            // 发送短信过于频繁 Send SMS OTP too frequently.
            return @"发送短信过于频繁";
            break;
        default:
            break;
    }
    return @"未知错误";
}


+ (NSError *)createError:(NSUInteger)code information:(NSString *)information
{
    NSUInteger errorCode = code;
    if (code == -1001 || [information isEqualToString:REQUEST_TIMED_OUT])
    {
        errorCode = 408;
    }
    NSError *error = [NSError errorWithDomain:DOMAIN_HUMBLEADMINBASE code:errorCode userInfo:@{ERROR_INFO:information}];
    return error;
}



@end
