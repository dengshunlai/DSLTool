//
//  NSString+DSLDate.h
//  DSLTool
//
//  Created by 邓顺来 on 16/11/24.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DSLDate)

/**
 时间戳转时间字符串

 @param timestamp 标准时间戳

 @return 时间字符串
 */
+ (NSString *)dsl_dateStringWithTimestamp:(NSString *)timestamp;

/**
 时间字符串转时间戳

 @return 标准时间戳
 */
- (NSString *)dsl_timestamp;

@end
