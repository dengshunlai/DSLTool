//
//  NSData+DSLAES.m
//  Memory
//
//  Created by 邓顺来 on 16/11/1.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSData+DSLAES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (DSLAES)

- (NSData *)dsl_aes128cbc_encrypt:(NSString *)key iv:(NSString *)iv
{
    char keyPtr[kCCKeySizeAES128+1];//+1 末位的'\0'
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding ,
                                          keyPtr, kCCBlockSizeAES128,
                                          [iv UTF8String],
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    NSData *AES;
    if (cryptStatus == kCCSuccess) {
        AES = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    return AES;
}

- (NSData *)dsl_aes128cbc_decrypt:(NSString *)key iv:(NSString *)iv
{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding ,
                                          keyPtr, kCCBlockSizeAES128,
                                          [iv UTF8String],
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    NSData *AES;
    if (cryptStatus == kCCSuccess) {
        AES = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    return AES;
}

@end
