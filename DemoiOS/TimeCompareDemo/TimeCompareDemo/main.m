//
//  main.m
//  TimeCompareDemo
//
//  Created by LiChen on 6/3/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
        // function 1
        // 当前的时间
        NSDate *now = [NSDate date];
        
        // 加入时间间隔，创建一个时间。
        NSDate *anHourAgo = [now dateByAddingTimeInterval:-60*60];
        
        // 获取时间间隔
        
        NSTimeInterval timeBetween0 = [now timeIntervalSinceDate:anHourAgo];
        NSTimeInterval timeBetween1 = [anHourAgo timeIntervalSinceDate:now];
        
        // 经验证可以获取到时间差
        NSLog(@"%f", timeBetween0);
        NSLog(@"%f", timeBetween1);
        */
        
        
        
        /*
        // function 2
        // 以现在为起点，创建一个时间间隔
        NSDate *anHourAgo = [NSDate dateWithTimeIntervalSinceNow:-60*60];
        // 与现在的时间作比较，获取一个时间间隔
        NSTimeInterval interval = [anHourAgo timeIntervalSinceNow];
        
        NSLog(@"%f", interval);
        */
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // 创建日期格式化对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        NSString *strDate = [[NSString alloc] init];
        NSDate *date = [[NSDate alloc] init];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 转换格式必须与字符串的相同
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        // NSString 转 NSDate
        date = [formatter dateFromString:strDate];
        // NSDate 转 NSString
        strDate = [formatter stringFromDate:date];
        
        
        
        
        
    }
    return 0;
}
