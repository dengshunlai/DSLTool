//
//  NSString+DSLHash.h
//  Memory
//
//  Created by 邓顺来 on 16/11/1.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DSLHash)

/**
 32位十六进制MD5

 @return MD5
 */
- (NSString *)dsl_MD5;

@end
