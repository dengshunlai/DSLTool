//
//  NSString+DSLHash.m
//  Memory
//
//  Created by 邓顺来 on 16/11/1.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSString+DSLHash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (DSLHash)

- (NSString *)dsl_MD5
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    NSMutableString *md5 = @"".mutableCopy;
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5 appendFormat:@"%02x",bytes[i]];
    }
    return md5;
}

@end
