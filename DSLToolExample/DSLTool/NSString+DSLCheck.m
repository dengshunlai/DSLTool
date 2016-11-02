//
//  NSString+DSLCheck.m
//  Memory
//
//  Created by 邓顺来 on 16/11/1.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSString+DSLCheck.h"

@implementation NSString (DSLCheck)

- (BOOL)dsl_matchWithRegularExpression:(NSString *)regex
{
    NSRange range = [self rangeOfString:regex options:NSRegularExpressionSearch];
    return range.location != NSNotFound;
}

- (BOOL)dsl_is_number
{
    return [self dsl_matchWithRegularExpression:@"^\\d+$"];
}

- (BOOL)dsl_is_number_letter
{
    return [self dsl_matchWithRegularExpression:@"^[0-9a-zA-Z]+$"];
}

@end
