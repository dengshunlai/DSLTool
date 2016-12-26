//
//  NSData+DSLExtension.m
//  DSLTool
//
//  Created by 邓顺来 on 16/12/27.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSData+DSLExtension.h"

@implementation NSData (DSLExtension)

- (NSString *)dsl_hex
{
    Byte *datas = (Byte *)[self bytes];
    NSMutableString *hex = [NSMutableString stringWithCapacity:self.length * 2];
    for(int i = 0; i < self.length; i++){
        [hex appendFormat:@"%02x", datas[i]];
    }
    return hex;
}

@end
