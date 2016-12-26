//
//  NSString+DSLRSA.h
//  DSLTool
//
//  Created by 邓顺来 on 16/12/26.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DSLRSA)

+ (void)dsl_createRSAKeyPairWithKeySize:(int)keySize handle:(void (^)(SecKeyRef publicKeyRef, SecKeyRef privateKeyRef))handle;

@end
