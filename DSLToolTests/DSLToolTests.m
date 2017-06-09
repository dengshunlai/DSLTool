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

- (void)testAES
{
    NSString *key = @"we76sdf898sdfs";
    NSString *IV = @"8sad6sdf7s9dfd";
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

- (void)testPropertyCode
{
    [_json dsl_propertyCode];
}

- (void)testSafeDictionary
{
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

- (void)testDateString
{
    NSString *timestamp = [NSString stringWithFormat:@"%ld",lround([[NSDate date] timeIntervalSince1970])];
    NSLog(@"%@",timestamp);
    NSString *dateString = [NSString dsl_dateStringWithTimestamp:timestamp];
    NSLog(@"%@",dateString);
    
    NSLog(@"%@",[dateString dsl_timestamp]);
}

- (void)testRSA
{
    __block SecKeyRef publicKey,privateKey;
    [NSString dsl_createRSAKeyPairWithKeySize:1024 handle:^(SecKeyRef publicKeyRef, SecKeyRef privateKeyRef) {
        publicKey = publicKeyRef;
        privateKey = privateKeyRef;
    }];
    NSLog(@"publicKey:%@",publicKey);
    NSLog(@"privateKey:%@",privateKey);
}

- (void)testUUID
{
    //8-4-4-4-12
    NSString *uuid = [DSLTool uuid];
    NSLog(@"uuid:%@",uuid);
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
