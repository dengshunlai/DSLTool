//
//  DSLToolTests.m
//  DSLToolTests
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+DSLAES.h"
#import "NSDictionary+DSLExtension.h"
#import "NSString+DSLDate.h"
#import "NSString+DSLRSA.h"
#import "NSData+DSLExtension.h"
#import "DSLTool.h"

@interface DSLToolTests : XCTestCase

@property (strong, nonatomic) NSDictionary *json;

@end

@implementation DSLToolTests

- (void)setUp {
    [super setUp];
    _json = @{@"username":[NSNull null],
              @"phone":@"17630000000",
              @"age":@(25),
              @"address":@"深圳市",
              @"salary":@"10k",
              @"weight":@"102.25",
              @"height":@(168.88),
              @"isMale":@"1",
              @"parent":@[@{@"mum":@"qqq"},@{@"dad":@"ttt"}],
              @"school":@{@"name":@"xxx",@"grade":@"yyy"},
              @"isMarry":[NSNumber numberWithBool:NO],
              @"pi":[NSNumber numberWithFloat:3.1415]};
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAES {
    NSString *key = @"ajjka2361e669r2d";
    NSString *IV =  @"56zx1q3f025e0000";
    NSString *orignal = @"<中华人民共和国>a1";
    NSString *encrypt = [orignal dsl_aes128cbc_base64_encrypt:key iv:IV];
    NSLog(@"encrypt:%@",encrypt);
    NSString *decrypt = [encrypt dsl_aes128cbc_base64_decrypt:key iv:IV];
    NSLog(@"decrypt:%@",decrypt);
    NSAssert([orignal isEqualToString:decrypt], @"失败");
    
    encrypt = [orignal dsl_aes128cbc_hex_encrypt:key iv:IV];
    NSLog(@"encrypt:%@",encrypt);
    decrypt = [encrypt dsl_aes128cbc_hex_decrypt:key iv:IV];
    NSLog(@"decrypt:%@",decrypt);
    NSAssert([orignal isEqualToString:decrypt], @"失败");
}

- (void)testPropertyCode {
    [_json dsl_propertyCode];
}

- (void)testSafeDictionary {
    XCTAssert([[_json dsl_stringWithKey:@"name"] isKindOfClass:[NSString class]],@"");
    NSLog(@"%@",[_json dsl_stringWithKey:@"name"]);
    NSLog(@"%@",[_json dsl_stringWithKey:@"phone"]);
    
    NSLog(@"%ld",[_json dsl_integerWithKey:@"phone"]);
    NSLog(@"%ld",[_json dsl_integerWithKey:@"age"]);
    NSLog(@"%ld",[_json dsl_integerWithKey:@"salary"]);
    
    NSLog(@"%d",[_json dsl_boolWithKey:@"isMale"]);
    
    NSLog(@"%f",[_json dsl_doubleWithKey:@"weight"]);
    NSLog(@"%f",[_json dsl_doubleWithKey:@"height"]);
    
    NSLog(@"%@",[_json dsl_arrayWithKey:@"parent"]);
    NSLog(@"%@",[_json dsl_dictionaryWithKey:@"school"]);
    NSLog(@"%@",[_json dsl_arrayWithKey:@"height"]);
    NSLog(@"%@",[_json dsl_dictionaryWithKey:@"height"]);
}

- (void)testDateString {
    NSString *timestamp = [NSString stringWithFormat:@"%ld",lround([[NSDate date] timeIntervalSince1970])];
    NSLog(@"%@",timestamp);
    NSString *dateString = [NSString dsl_dateStringWithTimestamp:timestamp];
    NSLog(@"%@",dateString);
    
    NSLog(@"%@",[dateString dsl_timestamp]);
}

- (void)testRSA {
    __block SecKeyRef publicKey,privateKey;
    [NSString dsl_createRSAKeyPairWithKeySize:1024 handle:^(SecKeyRef publicKeyRef, SecKeyRef privateKeyRef) {
        publicKey = publicKeyRef;
        privateKey = privateKeyRef;
    }];
    NSLog(@"publicKey:%@",publicKey);
    NSLog(@"privateKey:%@",privateKey);
}

- (void)testUUID {
    //8-4-4-4-12
    NSString *uuid = [DSLTool uuid];
    NSLog(@"uuid:%@",uuid);
}

- (void)testGetDeviceName {
    NSString *name = [DSLTool deviceName];
    NSLog(@"device name :%@",name);
}

- (void)testImageType {
    NSString *type = [DSLTool typeForImageData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"placeholder" ofType:@"jpg"]]];
    //我将placeholder这张图的后缀强制改成jpg，但它的实际类型是png。
    //图片的类型不是由文件后缀决定的
    NSLog(@"image type :%@",type);
}

- (void)testSortForSign {
    NSDictionary *params = @{@"foo":@"1",
                             @"bar":@"2",
                             @"foo_bar":@(3),
                             @"foobar":@"4"};
    NSString *sign = [params dsl_sortForSign];
    NSLog(@"%@",sign);
    XCTAssert([sign isEqualToString:@"bar2foo1foo_bar3foobar4"]);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
