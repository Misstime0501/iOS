//
//  BusinessCardAdapter.h
//  HelloiOSGame
//
//  Created by LiChen on 6/29/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "BusinessCardAdapterProtocol.h"

@interface BusinessCardAdapter : NSObject <BusinessCardAdapterProtocol>


/**
 *  输入对象
 */
@property (weak) id data;


/**
 *  与输入对象建立联系
 *
 *  @param data 输入对象
 *
 *  @return 实力对象
 */
- (instancetype)initWithData:(id)data;

@end
