//
//  NSDictionary+DSLExtension.m
//  DSLTool
//
//  Created by 邓顺来 on 16/11/23.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "NSDictionary+DSLExtension.h"

@implementation NSDictionary (DSLExtension)

- (NSString *)dsl_stringWithKey:(NSString *)key
{
    id string = [self objectForKey:key];
    if ([string isKindOfClass:[NSString class]]) {
        return string;
    }
    return @"";
}

- (NSInteger)dsl_integerWithKey:(NSString *)key
{
    id number = [self objectForKey:key];
    if ([number isKindOfClass:[NSNumber class]] || [number isKindOfClass:[NSString class]]) {
        return [number integerValue];
    }
    return 0;
}

- (float)dsl_floatWithKey:(NSString *)key
{
    id number = [self objectForKey:key];
    if ([number isKindOfClass:[NSNumber class]] || [number isKindOfClass:[NSString class]]) {
        return [number floatValue];
    }
    return 0;
}

- (double)dsl_doubleWithKey:(NSString *)key
{
    id number = [self objectForKey:key];
    if ([number isKindOfClass:[NSNumber class]] || [number isKindOfClass:[NSString class]]) {
        return [number doubleValue];
    }
    return 0;
}

- (BOOL)dsl_boolWithKey:(NSString *)key
{
    id number = [self objectForKey:key];
    if ([number isKindOfClass:[NSNumber class]] || [number isKindOfClass:[NSString class]]) {
        return [number boolValue];
    }
    return false;
}

- (NSArray *)dsl_arrayWithKey:(NSString *)key
{
    id array = [self objectForKey:key];
    if ([array isKindOfClass:[NSArray class]]) {
        return array;
    }
    return @[];
}

- (NSDictionary *)dsl_dictionaryWithKey:(NSString *)key
{
    id dictionary = [self objectForKey:key];
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        return dictionary;
    }
    return @{};
}

- (void)dsl_propertyCode {
    NSMutableString *codes = [NSMutableString string];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *code = @"";
        if ([obj isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property (strong ,nonatomic) NSString *%@;",key];
        } else if ([obj isKindOfClass:[NSArray class]]) {
            code = [NSString stringWithFormat:@"@property (strong ,nonatomic) NSArray *%@;",key];
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            code = [NSString stringWithFormat:@"@property (strong ,nonatomic) NSDictionary *%@;",key];
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            NSNumber *number = (NSNumber *)obj;
            if (strcmp(number.objCType, @encode(int)) == 0) {
                code = [NSString stringWithFormat:@"@property (assign, nonatomic) NSInteger %@;",key];
            }
            if (strcmp(number.objCType, @encode(long long)) == 0) {
                code = [NSString stringWithFormat:@"@property (assign, nonatomic) NSInteger %@;",key];
            }
            if (strcmp(number.objCType, @encode(bool)) == 0) {
                code = [NSString stringWithFormat:@"@property (assign, nonatomic) BOOL %@;",key];
            }
            if (strcmp(number.objCType, @encode(float)) == 0) {
                code = [NSString stringWithFormat:@"@property (assign, nonatomic) CGFloat %@;",key];
            }
            if (strcmp(number.objCType, @encode(double)) == 0) {
                code = [NSString stringWithFormat:@"@property (assign, nonatomic) CGFloat %@;",key];
            }
        } else {
            code = [NSString stringWithFormat:@"@property (strong, nonatomic) NSNull *%@;",key];
        }
        [codes appendFormat:@"\n%@",code];
    }];
    NSLog(@"%@",codes);
}

- (NSString *)dsl_sortForSign {
    NSMutableString *sign = @"".mutableCopy;
    NSArray *keys = self.allKeys;
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    for (NSInteger i = 0; i < keys.count; i++) {
        NSString *key = keys[i];
        id value = self[keys[i]];
        if ([value isKindOfClass:[NSNumber class]]) {
            value = [value stringValue];
        }
        [sign appendFormat:@"%@%@",key,value];
    }
    return sign;
}

@end
