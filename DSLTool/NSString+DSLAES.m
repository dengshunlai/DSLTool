//
//  NSString+DSLAES.m
//  Memory
//
//  Created by 邓顺来 on 16/11/1.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSString+DSLAES.h"
#import "NSData+DSLAES.h"
#import "NSData+DSLExtension.h"

@implementation NSString (DSLAES)

- (NSString *)dsl_aes128cbc_base64_encrypt:(NSString *)key iv:(NSString *)iv;
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:strlen(cstr)];
    //对数据进行加密
    NSData *aes = [data dsl_aes128cbc_encrypt:key iv:iv];
    //base64编码
    if (aes && aes.length > 0) {
        NSString *base64 = [aes base64EncodedStringWithOptions:0];
        return base64;
    }
    return nil;
}

- (NSString *)dsl_aes128cbc_base64_decrypt:(NSString *)key iv:(NSString *)iv;
{
    NSData *aes = [[NSData alloc] initWithBase64EncodedString:self options:0];
    //对数据进行解密
    NSData *result = [aes dsl_aes128cbc_decrypt:key iv:iv];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)dsl_aes128cbc_hex_encrypt:(NSString *)key iv:(NSString *)iv;
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:strlen(cstr)];
    //对数据进行加密
    NSData *aes = [data dsl_aes128cbc_encrypt:key iv:iv];
    //hex编码
    if (aes && aes.length > 0) {
        return [aes dsl_hex];
    }
    return nil;
}

- (NSString *)dsl_aes128cbc_hex_decrypt:(NSString *)key iv:(NSString *)iv;
{
    //转换为Data
    NSMutableData *aes = [NSMutableData dataWithCapacity:self.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    for (int i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i * 2];
        byte_chars[1] = [self characterAtIndex:i * 2 + 1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [aes appendBytes:&whole_byte length:1];
    }
    //对数据进行解密
    NSData *result = [aes dsl_aes128cbc_decrypt:key iv:iv];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
