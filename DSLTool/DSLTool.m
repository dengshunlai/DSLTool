//
//  DSLTool.m
//  DSLTool
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "DSLTool.h"
#import <sys/utsname.h>
#import "AppDelegate.h"

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
    NSString *str = [NSUUID UUID].UUIDString;
    return str;
}

+ (NSString *)deviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machine = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([machine isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([machine isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([machine isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([machine isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([machine isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([machine isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([machine isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([machine isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([machine isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([machine isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([machine isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([machine isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([machine isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([machine isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([machine isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([machine isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([machine isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([machine isEqualToString:@"iPhone9,1"]) return @"国行、日版、港行iPhone 7";
    if ([machine isEqualToString:@"iPhone9,2"]) return @"港行、国行iPhone 7 Plus";
    if ([machine isEqualToString:@"iPhone9,3"]) return @"美版、台版iPhone 7";
    if ([machine isEqualToString:@"iPhone9,4"]) return @"美版、台版iPhone 7 Plus";
    if ([machine isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([machine isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if ([machine isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([machine isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([machine isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([machine isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    if ([machine isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    if ([machine isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if ([machine isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([machine isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if ([machine isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([machine isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    if ([machine isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    if ([machine isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    if ([machine isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if ([machine isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if ([machine isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([machine isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if ([machine isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([machine isEqualToString:@"iPad3,6"]) return @"iPad 4";
    if ([machine isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if ([machine isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if ([machine isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([machine isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    if ([machine isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    if ([machine isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    if ([machine isEqualToString:@"i386"]) return @"iPhone Simulator";
    if ([machine isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    return machine;
}

+ (NSString *)typeForImageData:(NSData *)data
{
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52: {
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
        }
    }
    return nil;
}

+ (UIViewController *)topViewController {
    UIViewController *topVC = nil;
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIWindow *mainWindow = appDelegate.window;
    
    UIViewController *lastPresentedVC = mainWindow.rootViewController;
    while (lastPresentedVC.presentedViewController) {
        lastPresentedVC = lastPresentedVC.presentedViewController;
    }
    
    if ([lastPresentedVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nc = (UINavigationController *)lastPresentedVC;
        topVC = nc.visibleViewController;
    } else if ([lastPresentedVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tc = (UITabBarController *)lastPresentedVC;
        UIViewController *vc = tc.viewControllers[tc.selectedIndex];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nc = (UINavigationController *)vc;
            topVC = nc.visibleViewController;
        } else {
            topVC = vc;
        }
    } else {
        topVC = lastPresentedVC;
    }
    return topVC;
}

@end
