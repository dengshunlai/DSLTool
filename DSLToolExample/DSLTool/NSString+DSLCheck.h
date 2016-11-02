//
//  NSString+DSLCheck.h
//  Memory
//
//  Created by 邓顺来 on 16/11/1.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DSLCheck)

/**
 是否匹配正则

 @param regex 正则表达式

 @return BOOL
 */
- (BOOL)dsl_matchWithRegularExpression:(NSString *)regex;

/**
 是否全数字

 @return BOOL
 */
- (BOOL)dsl_is_number;

/**
 是否全数字、大小写字母

 @return BOOL
 */
- (BOOL)dsl_is_number_letter;

@end
