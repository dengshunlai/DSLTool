//
//  DSLTool.m
//  DSLTool
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "DSLTool.h"

@implementation DSLTool

+ (void)checkAppVersionWithBlock:(void (^)(BOOL isNeedUpdate, NSURL *appDownloadURL, NSDictionary *appStoreAppInfo))block
{
    NSDictionary *appInfo = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = appInfo[@"CFBundleShortVersionString"];
    NSString *bundleId = appInfo[@"CFBundleIdentifier"];
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=%@",bundleId]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if (![json[@"results"] count]) {
                    block(NO, nil, nil);
                    return ;
                }
                NSDictionary *result = json[@"results"][0];
                NSURL *appDownloadURL = [NSURL URLWithString:result[@"trackViewUrl"]];
                NSString *appStoreAppVersion = result[@"version"];
                if ([appStoreAppVersion compare:currentVersion options:NSNumericSearch] == NSOrderedDescending) {
                    block(YES, appDownloadURL, result);
                    return ;
                }
                block(NO, appDownloadURL, result);
            } else {
                block(NO, nil, nil);
            }
        });
    }];
    [task resume];
}

+ (NSString *)uuid
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return uuid;
}

@end
