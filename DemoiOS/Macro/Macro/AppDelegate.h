//
//  AppDelegate.h
//  Macro
//
//  Created by LiChen on 16/7/8.
//  Copyright © 2016年 LiChen. All rights reserved.
//
//  日常所用宏



#import <UIKit/UIKit.h>

/**
 *  宏 与 const 的区别
 *
 *  1. 编译时刻不同，宏属于预编译，const 属于编译时刻
 *  2. 宏能定义代码，const 不能，多克红对于预编译会相对时间较长，影响效率，且调试慢， const 只会编译一次，缩短编译时间。
 *  3. 宏不会检查错误， const 会检查错误。
 */

// 获取屏幕宽高
#define SCREEN_WIDTH                                            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT                                           [UIScreen mainScreen].bounds.size.height

// 使用 ARC 和 MRC
#if  __has_feature(objc_arc)
// ARC
#else
// MRC
#endif

// 判断是真机还是模拟器
#if TARGET_OS_IPHONE
// iPhone 真机
#endif

#if TARGET_IPHONE_SIMULATOR
// iPhone 模拟器
#endif

// 获取通知中心
#define LRNotificationCenter                                    [NSNotificationCenter defaultCenter]

// 设置随机颜色
#define LRRandomColor                                           [UIColor colorWithRed:arc4random_uniform(256)/255.0 \
                                                                                green:arc4random_uniform(256)/255.0 \
                                                                                 blue:arc4random_uniform(256)/255.0 \
                                                                                alpha:1.0]

// 设置 RGB 颜色
#define LRRGBColor(r, g, b)                                     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 设置 RGBA 颜色
#define LRRGBAColor(r, g, b, a)                                 [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 设置透明色
#define LRClearColor                                            [UIColor clearColor]

// NSLog 输出宏
#ifdef DEBUG
#define LRLog(...)                                              NSLog(@"%s 第 %d 行 \n %@\n\n", __func__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define LRLog(...)
#endif

//弱引用
#define LRWeakSelf(type)                                        __weak typeof(type) weak##type = type

// 强引用
#define LRStrongSelf(type)                                      __strong typeof(type) type = weak##type

// 设置 view 圆角和边框
#define LRViewBorderRadius(View, Radius, Width, Color)          [View.layer setCornerRadius:(Radius)]\
                                                                [View.layer setMasksToBounds:YES]\
                                                                [View.layer setBorderWidth:(Width)]\
                                                                [View.layer setBorderColor:[Color CGColor]]

// 由角度转换弧度
#define LRDegreesToRadian(X)                                    (M_PI * (X) / 180.0)

// 由弧度转换角度
#define LRRadianToDegrees(radian)                               (radian * 180.0) / (M_PI)

// 获取 view 的 frame
#define kGetViewWidth(view)                                     view.frame.size.width
#define kGetViewHeight(view)                                    view.frame.size.height
#define kGetViewX(view)                                         view.frame.origin.x
#define kGetViewY(view)                                         view.frame.origin.y

// 获取图片资源
#define kGetImage(imageName)                                    [UIImage imageName:[NSString stringWithFormat:@"%@", imageName]]

// 获取当前语言
#define LRCurrentLanguage                                       ([[NSLocale preferredLanguages] objectAtIndex:0])


// 判断是否为 iPhone
#define IS_IPHONE                                               (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define IS_IPAD                                                 (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是否为ipod
#define IS_IPOD                                                 ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 判断是否为 iPhone 5SE
#define iPhone5SE                                               [[UIScreen mainScreen] bounds].size.width == 320.0f && \
                                                                [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为iPhone 6/6s
#define iPhone6_6s                                              [[UIScreen mainScreen] bounds].size.width == 375.0f && \
                                                                [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus                                      [[UIScreen mainScreen] bounds].size.width == 414.0f && \
                                                                [[UIScreen mainScreen] bounds].size.height == 736.0f

// 获取系统版本
#define IOS_SYSTEM_VERSION                                      [[[UIDevice currentDevice] systemVersion] floatValue]

// 判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER                                  (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))

// 沙河文件目录
//获取temp
#define kPathTemp                                               NSTemporaryDirectory()

//获取沙盒 Document
#define kPathDocument                                           [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache                                              [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock)                         static dispatch_once_t onceToken\
                                                                dispatch_once(&onceToken, onceBlock)\

//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock)                   dispatch_async(dispatch_get_main_queue(), mainQueueBlock)

//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock)        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl)







// 封装第三方的宏定义
// Toast (加载提示框)
// LRToast(@"网络加载失败");
#define LRToast(str)                                            CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle]; \
                                                                [kWindow  makeToast:str duration:0.6 position:CSToastPositionCenter style:style];\
                                                                kWindow.userInteractionEnabled = NO; \
                                                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
                                                                    kWindow.userInteractionEnabled = YES;\
                                                                });\

// MBProgressHUD (加载提示框)
// 加载
#define kShowNetworkActivityIndicator()                         [UIApplication sharedApplication].networkActivityIndicatorVisible = YES

// 收起加载
#define HideNetworkActivityIndicator()                          [UIApplication sharedApplication].networkActivityIndicatorVisible = NO

// 设置加载
#define NetworkActivityIndicatorVisible(x)                      [UIApplication sharedApplication].networkActivityIndicatorVisible = x

#define kWindow                                                 [UIApplication sharedApplication].keyWindow

#define kBackView                                               for (UIView *item in kWindow.subviews) \
                                                                { \
                                                                    if(item.tag == 10000) \
                                                                    { \
                                                                        [item removeFromSuperview]; \
                                                                        UIView * aView = [[UIView alloc] init]; \
                                                                        aView.frame = [UIScreen mainScreen].bounds; \
                                                                        aView.tag = 10000; \
                                                                        aView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3]; \
                                                                        [kWindow addSubview:aView]; \
                                                                    } \
                                                                } \

#define kShowHUDAndActivity                                     kBackView; \
                                                                [MBProgressHUD showHUDAddedTo:kWindow animated:YES]; \
                                                                kShowNetworkActivityIndicator()

#define kHiddenHUD                                              [MBProgressHUD hideAllHUDsForView:kWindow animated:YES]

#define kRemoveBackView                                         for (UIView *item in kWindow.subviews) \
                                                                { \
                                                                    if(item.tag == 10000) \
                                                                    { \
                                                                        [UIView animateWithDuration:0.4 animations:^{ \
                                                                            item.alpha = 0.0; \
                                                                        } completion:^(BOOL finished) { \
                                                                            [item removeFromSuperview]; \
                                                                        }]; \
                                                                    } \
                                                                } \

#define kHiddenHUDAndAvtivity                                   kRemoveBackView;kHiddenHUD;HideNetworkActivityIndicator()




// 最好以这种方法定义字符串
NSString *const REQUEST = @"";


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

