//
//  NSString+DSLDate.m
//  DSLTool
//
//  Created by 邓顺来 on 16/11/24.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSString+DSLDate.h"

@implementation NSString (DSLDate)

+ (NSString *)dsl_dateStringWithTimestamp:(NSString *)timestamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

- (NSString *)dsl_timestamp
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [dateFormatter dateFromString:self];
    NSString *timestamp = [NSString stringWithFormat:@"%ld",lround([date timeIntervalSince1970])];
    return timestamp;
}

@end
