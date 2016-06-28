//
//  main.m
//  RuntimeDemo
//
//  Created by LiChen on 6/16/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "AppDelegate.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
