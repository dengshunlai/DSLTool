//
//  NSString+DSLRSA.m
//  DSLTool
//
//  Created by 邓顺来 on 16/12/26.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSString+DSLRSA.h"
#import <Security/SecKey.h>

@implementation NSString (DSLRSA)

+ (void)dsl_createRSAKeyPairWithKeySize:(int)keySize handle:(void (^)(SecKeyRef publicKeyRef, SecKeyRef privateKeyRef))handle
{
    OSStatus status = 0;
    SecKeyRef publicKeyRef = NULL;
    SecKeyRef privateKeyRef = NULL;
    status = SecKeyGeneratePair((CFDictionaryRef)@{(id)kSecAttrKeyType:(id)kSecAttrKeyTypeRSA,(id)kSecAttrKeySizeInBits:@(keySize)},
                                &publicKeyRef,
                                &privateKeyRef);
    if (handle) {
        handle(publicKeyRef,privateKeyRef);
    }
}

@end
