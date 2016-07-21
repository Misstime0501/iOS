//
//  PhoneProtocol.h
//  FactoryPattern
//
//  Created by LiChen on 16/7/11.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PhoneProtocol <NSObject>

@required

/**
 *  打电话
 */
- (void)phoneCall;

/**
 *  发短信
 */
- (void)sendMessage;

@end
