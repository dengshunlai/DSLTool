//
//  NSDictionary+DSLExtension.h
//  DSLTool
//
//  Created by 邓顺来 on 16/11/23.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DSLExtension)

/**
 保证返回值的类型正确，
 例如key对应的值是NSNull，则返回@""
 */
- (NSString *)dsl_stringWithKey:(NSString *)key;
- (NSInteger)dsl_integerWithKey:(NSString *)key;
- (float)dsl_floatWithKey:(NSString *)key;
- (double)dsl_doubleWithKey:(NSString *)key;
- (BOOL)dsl_boolWithKey:(NSString *)key;
- (NSArray *)dsl_arrayWithKey:(NSString *)key;
- (NSDictionary *)dsl_dictionaryWithKey:(NSString *)key;

/**
 打印模型属性代码
 */
- (void)dsl_propertyCode;

/**
 用于sign生成：
 按参数名称的ASCII码的顺序排序，将排序好的参数名和参数值拼装在一起
 如：foo=1, bar=2, foo_bar=3, foobar=4，得到结果：bar2foo1foo_bar3foobar4
 */
- (NSString *)dsl_sortForSign;

@end
