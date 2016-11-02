//
//  NSString+DSLAES.h
//  Memory
//
//  Created by 邓顺来 on 16/11/1.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DSLAES)

/**
 AES-128加密 base64编码

 @param key 密钥
 @param iv  密钥偏移

 @return 密文
 */
- (NSString *)dsl_aes128cbc_base64_encrypt:(NSString *)key iv:(NSString *)iv;

/**
 AES-128解密 base64编码

 @param key 密钥
 @param iv  密钥偏移

 @return 原文
 */
- (NSString *)dsl_aes128cbc_base64_decrypt:(NSString *)key iv:(NSString *)iv;

/**
 AES-128加密 hex编码

 @param key 密钥
 @param iv  密钥偏移

 @return 密文
 */
- (NSString *)dsl_aes128cbc_hex_encrypt:(NSString *)key iv:(NSString *)iv;

/**
 AES-128解密 hex编码

 @param key 密钥
 @param iv  密钥偏移

 @return 原文
 */
- (NSString *)dsl_aes128cbc_hex_decrypt:(NSString *)key iv:(NSString *)iv;

@end
