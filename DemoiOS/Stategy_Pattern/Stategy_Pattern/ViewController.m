//
//  ViewController.m
//  Stategy_Pattern
//
//  Created by LiChen on 16/7/7.
//  Copyright © 2016年 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+inits.h"
#import "CustomField.h"
#import "UIView+SetRect.h"
#import "RegExCategories.h"
#import "UIInfomationView.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) CustomField *emailField;

@property (nonatomic, strong) CustomField *phoneNumberField;

- (NSString *)validateEmailInput:(UITextField *)input;

- (NSString *)validatePhoneNumberInput:(UITextField *)input;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}






- (NSString *)validateEmailInput:(UITextField *)input
{
    NSString *outString = nil;
    if (input.text.length <= 0)
    {
        outString = @"没有输入"；
    }
    else
    {
        BOOL isMatch = [input.text isMatch:RX(@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")];
        if (isMatch == NO)
        {
            outString = @"请输入正确的邮箱";
        }
        else
        {
            outString = nil;
        }
    }
    return outString;
}

- (NSString *)



@end
