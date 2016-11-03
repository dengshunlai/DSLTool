//
//  NSData+DSLAES.h
//  Memory
//
//  Created by 邓顺来 on 16/11/1.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DSLAES)

/**
 AES-128加密 cbc模式 PKCS7Padding补码

 @param key 密钥
 @param iv  密钥偏移

 @return 密文
 */
- (NSData *)dsl_aes128cbc_encrypt:(NSString *)key iv:(NSString *)iv;

/**
 AES-128解密 cbc模式 PKCS7Padding补码

 @param key 密钥
 @param iv  密钥偏移

 @return 原文
 */
- (NSData *)dsl_aes128cbc_decrypt:(NSString *)key iv:(NSString *)iv;

@end
