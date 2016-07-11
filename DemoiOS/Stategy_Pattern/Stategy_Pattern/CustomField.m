//
//  CustomField.m
//  Stategy_Pattern
//
//  Created by LiChen on 16/7/7.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "CustomField.h"

@implementation CustomField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, self.frame.size.height)];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.font = [UIFont fontWithName:@"Avenir-Book" size:12.f];
    self.layer.borderWidth = 0.5f;
}



@end
