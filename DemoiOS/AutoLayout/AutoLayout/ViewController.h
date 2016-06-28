//
//  ViewController.h
//  AutoLayout
//
//  Created by LiChen on 6/23/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, NSLayoutAttribute) {
//    NSLayoutAttributeLeft = 1,//控件左边
//    NSLayoutAttributeRight,//控件右边
//    NSLayoutAttributeTop,
//    NSLayoutAttributeBottom,
//    NSLayoutAttributeLeading,//控件左边
//    NSLayoutAttributeTrailing,//控件右边
//    NSLayoutAttributeWidth,//控件的宽
//    NSLayoutAttributeHeight,//控件的高
//    NSLayoutAttributeCenterX,//竖直方向中点
//    NSLayoutAttributeCenterY,//水平方向中点
//    NSLayoutAttributeBaseline,
//    NSLayoutAttributeLastBaseline = NSLayoutAttributeBaseline,
//    NSLayoutAttributeFirstBaseline NS_ENUM_AVAILABLE_IOS(8_0),
//    
//    
//    NSLayoutAttributeLeftMargin NS_ENUM_AVAILABLE_IOS(8_0),
//    NSLayoutAttributeRightMargin NS_ENUM_AVAILABLE_IOS(8_0),
//    NSLayoutAttributeTopMargin NS_ENUM_AVAILABLE_IOS(8_0),
//    NSLayoutAttributeBottomMargin NS_ENUM_AVAILABLE_IOS(8_0),
//    NSLayoutAttributeLeadingMargin NS_ENUM_AVAILABLE_IOS(8_0),
//    NSLayoutAttributeTrailingMargin NS_ENUM_AVAILABLE_IOS(8_0),
//    NSLayoutAttributeCenterXWithinMargins NS_ENUM_AVAILABLE_IOS(8_0),
//    NSLayoutAttributeCenterYWithinMargins NS_ENUM_AVAILABLE_IOS(8_0),
//    
//    NSLayoutAttributeNotAnAttribute = 0
//};


@interface ViewController : UIViewController
{
    UIView *_redView;
    UIView *_blueView;
    UIView *_yellowView;
}

@property UIView *redView;
@property UIView *blueView;
@property UIView *yellowView;


@end

