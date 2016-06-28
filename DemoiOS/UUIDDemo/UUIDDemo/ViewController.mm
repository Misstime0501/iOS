//
//  ViewController.m
//  UUIDDemo
//
//  Created by LiChen on 6/21/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "ViewController.h"

// IDFA 所用
#import <AdSupport/AdSupport.h>

@interface ViewController ()

@end

@implementation ViewController

//http://www.ithao123.cn/content-8688001.html

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // IDFA (identifierForIdentifier) 广告标识符，是用于对外：例如广告推广，换量等跨应用的用户追踪
    /**
        是iOS 6中另外一个新的方法，提供了一个方法advertisingIdentifier，通过调用该方法会返回一个NSUUID实例，最后可以获得一个UUID，由系统存储着的。不过即使这是由系统存储的，但是有几种情况下，会重新生成广告标示符。如果用户完全重置系统（(设置程序 -> 通用 -> 还原 -> 还原位置与隐私) ，这个广告标示符会重新生成。另外如果用户明确的还原广告(设置程序-> 通用 -> 关于本机 -> 广告 -> 还原广告标示符) ，那么广告标示符也会重新生成。关于广告标示符的还原，有一点需要注意：如果程序在后台运行，此时用户“还原广告标示符”，然后再回到程序中，此时获取广 告标示符并不会立即获得还原后的标示符。必须要终止程序，然后再重新启动程序，才能获得还原后的广告标示符。
     在同一个设备上的所有App都会取到相同的值，是苹果专门给各广告提供商用来追踪用户而设的，用户可以在 设置|隐私|广告追踪 里重置此id的值，或限制此id的使用，故此id有可能会取不到值，但好在Apple默认是允许追踪的，而且一般用户都不知道有这么个设置，所以基本上用来监测推广效果，是戳戳有余了。
     
     注意：由于idfa会出现取不到的情况，故绝不可以作为业务分析的主id，来识别用户。
     */
    
    
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSLog(@"adId = %@", adId);
    
    // IDFV (identifierForVendor) Vindor标示符，适用于对内：例如分析用户在应用内的行为等。
    /**
     是给Vendor标识用户用的，每个设备在所属同一个Vender的应用里，都有相同的值。其中的Vender是指应用提供商，但准确点说，是通过BundleID的DNS反转的前两部分进行匹配，如果相同就是同一个Vender，例如对于com.somecompany.appone,com.somecompany.apptwo
     
     这两个BundleID来说，就属于同一个Vender，共享同一个idfv的值。和idfa不同的是，idfv的值是一定能取到的，所以非常适合于作为内部用户行为分析的主id，来标识用户，替代OpenUDID。
     
     注意：如果用户将属于此Vender的所有App卸载，则idfv的值会被重置，即再重装此Vender的App，idfv的值和之前不同。
     */
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"idfv = %@", idfv);
    
    // OPEN UDID
    /**
     每台iOS设备的OpenUDID是通过第一个带有OpenUDID SDK包的App生成，如果你完全删除全部带有OpenUDID SDK包的App（比如恢复系统等），那么OpenUDID会重新生成，而且和之前的值会不同，相当于新设备；
     
     优点是没有用到MAC地址；不同设备能够获取各自唯一的识别码，保证了唯一性，可以用于以往UDID的相关用途；从代码分析OpenUDID的获取，识别码获取方便并且保存谨慎。缺点是当将设备上所有使用了OpenUDID方案的应用程序删除，且设备关机重启，xcode彻底清除并重启，重装应用程序去获取OpenUDID，此时OpenUDID变化，与之前不一样了，所有OpenUDID应用卸载后，由UIPasteboard保存的数据即被清除，重装故会重新获取新的OpenUDID。
     
     那么当因为用户干预或者恶意程序，致使UIPasteboard数据清除，从而导致OpenUDID被删除，重装也会获取新的OpenUDID。
     */
    
//    unsigned char result[16];
//    const charchar *cStr = [[[NSProcessInfo processInfo] globallyUniqueString] UTF8String];
//    CC_MD5( cStr, strlen(cStr), result );
//    _openUDID = [NSString stringWithFormat:
//                 @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%08x",
//                 result[0], result[1], result[2], result[3],
//                 result[4], result[5], result[6], result[7],
//                 result[8], result[9], result[10], result[11],
//                 result[12], result[13], result[14], result[15],
//                 arc4random() % 4294967295];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
