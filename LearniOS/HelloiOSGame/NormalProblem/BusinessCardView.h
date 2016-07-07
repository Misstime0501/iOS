//
//  BusinessCardView.h
//  HelloiOSGame
//
//  Created by LiChen on 6/29/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCardAdapterProtocol.h"

#define BUSINESS_FRAME  CGRectMake(0, 0, 200, 130)

@interface BusinessCardView : UIView

@property (strong) NSString *name;

@property (strong) UIColor *lineColor;

@property (strong) NSString *phoneNumber;


- (void)loadData:(id <BusinessCardAdapterProtocol>)data;


@end
