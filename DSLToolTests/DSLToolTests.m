//
//  DSLToolTests.m
//  DSLToolTests
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+DSLAES.h"

@interface DSLToolTests : XCTestCase

@end

@implementation DSLToolTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
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
