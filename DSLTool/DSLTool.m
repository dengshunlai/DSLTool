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
    //iPhone
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
    if ([machine isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([machine isEqualToString:@"iPhone9,1"]) return @"iPhone 7"; //国行、日版、港行
    if ([machine isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus"; //国行、港行
    if ([machine isEqualToString:@"iPhone9,3"]) return @"iPhone 7"; //美版、台版
    if ([machine isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus"; //美版、台版
    if ([machine isEqualToString:@"iPhone10,1"]) return @"iPhone 8"; //国行(A1863)、日行(A1906)
    if ([machine isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus"; //国行(A1864)、日行(A1898)
    if ([machine isEqualToString:@"iPhone10,3"]) return @"iPhone X"; //国行(A1865)、日行(A1902)
    if ([machine isEqualToString:@"iPhone10,4"]) return @"iPhone 8"; //美版(Global/A1905)
    if ([machine isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus"; //美版(Global/A1897)
    if ([machine isEqualToString:@"iPhone10,6"]) return @"iPhone X";//美版(Global/A1901)
    if ([machine isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if ([machine isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if ([machine isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if ([machine isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if ([machine isEqualToString:@"iPhone12,1"]) return @"iPhone 11";
    if ([machine isEqualToString:@"iPhone12,3"]) return @"iPhone 11 Pro";
    if ([machine isEqualToString:@"iPhone12,5"]) return @"iPhone 11 Pro Max";
    if ([machine isEqualToString:@"iPhone12,8"]) return @"iPhone SE"; //(2nd generation)
    if ([machine isEqualToString:@"iPhone13,1"]) return @"iPhone 12 mini";
    if ([machine isEqualToString:@"iPhone13,2"]) return @"iPhone 12";
    if ([machine isEqualToString:@"iPhone13,3"]) return @"iPhone 12 Pro";
    if ([machine isEqualToString:@"iPhone13,4"]) return @"iPhone 12 Pro Max";
    if ([machine isEqualToString:@"iPhone14,2"]) return @"iPhone 13 Pro";
    if ([machine isEqualToString:@"iPhone14,3"]) return @"iPhone 13 Pro Max";
    if ([machine isEqualToString:@"iPhone14,4"]) return @"iPhone 13 mini";
    if ([machine isEqualToString:@"iPhone14,5"]) return @"iPhone 13";
    if ([machine isEqualToString:@"iPhone14,6"]) return @"iPhone SE"; //(2nd generation)
    if ([machine isEqualToString:@"iPhone14,7"]) return @"iPhone 14";
    if ([machine isEqualToString:@"iPhone14,8"]) return @"iPhone 14 Plus";
    if ([machine isEqualToString:@"iPhone15,2"]) return @"iPhone 14 Pro";
    if ([machine isEqualToString:@"iPhone15,3"]) return @"iPhone 14 Pro Max";
    if ([machine isEqualToString:@"iPhone15,4"]) return @"iPhone 15";
    if ([machine isEqualToString:@"iPhone15,5"]) return @"iPhone 15 Plus";
    if ([machine isEqualToString:@"iPhone16,1"]) return @"iPhone 15 Pro";
    if ([machine isEqualToString:@"iPhone16,2"]) return @"iPhone 15 Pro Max";
    if ([machine isEqualToString:@"iPhone17,3"]) return @"iPhone 16";
    if ([machine isEqualToString:@"iPhone17,4"]) return @"iPhone 16 Plus";
    if ([machine isEqualToString:@"iPhone17,1"]) return @"iPhone 16 Pro";
    if ([machine isEqualToString:@"iPhone17,2"]) return @"iPhone 16 Pro Max";
    //iPod
    if ([machine isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if ([machine isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([machine isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([machine isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([machine isEqualToString:@"iPod5,1"]) return @"iPod Touch (5 Gen)";
    if ([machine isEqualToString:@"iPod7,1"]) return @"iPod Touch (6 Gen)";
    if ([machine isEqualToString:@"iPod9,1"]) return @"iPod Touch (7 Gen)";
    //iPad
    if ([machine isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([machine isEqualToString:@"iPad1,2"]) return @"iPad 3G";
    if ([machine isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
    if ([machine isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([machine isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
    if ([machine isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([machine isEqualToString:@"iPad2,5"]) return @"iPad Mini (WiFi)";
    if ([machine isEqualToString:@"iPad2,6"]) return @"iPad Mini";
    if ([machine isEqualToString:@"iPad2,7"]) return @"iPad Mini (GSM+CDMA)";
    if ([machine isEqualToString:@"iPad3,1"]) return @"iPad 3 (WiFi)";
    if ([machine isEqualToString:@"iPad3,2"]) return @"iPad 3 (GSM+CDMA)";
    if ([machine isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([machine isEqualToString:@"iPad3,4"]) return @"iPad 4 (WiFi)";
    if ([machine isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([machine isEqualToString:@"iPad3,6"]) return @"iPad 4 (GSM+CDMA)";
    if ([machine isEqualToString:@"iPad4,1"]) return @"iPad Air (WiFi)";
    if ([machine isEqualToString:@"iPad4,2"]) return @"iPad Air (Cellular)";
    if ([machine isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([machine isEqualToString:@"iPad4,4"]) return @"iPad Mini 2 (WiFi)";
    if ([machine isEqualToString:@"iPad4,5"]) return @"iPad Mini 2 (Cellular)";
    if ([machine isEqualToString:@"iPad4,6"]) return @"iPad Mini 2";
    if ([machine isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    if ([machine isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    if ([machine isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    if ([machine isEqualToString:@"iPad5,1"]) return @"iPad Mini 4 (WiFi)";
    if ([machine isEqualToString:@"iPad5,2"]) return @"iPad Mini 4 (LTE)";
    if ([machine isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if ([machine isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if ([machine isEqualToString:@"iPad6,3"]) return @"iPad Pro 9.7";
    if ([machine isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7";
    if ([machine isEqualToString:@"iPad6,7"]) return @"iPad Pro 12.9";
    if ([machine isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9";
    if ([machine isEqualToString:@"iPad6,11"]) return @"iPad 5th";
    if ([machine isEqualToString:@"iPad6,12"]) return @"iPad 5th";
    if ([machine isEqualToString:@"iPad7,1"]) return @"iPad Pro 12.9 2nd";
    if ([machine isEqualToString:@"iPad7,2"]) return @"iPad Pro 12.9 2nd";
    if ([machine isEqualToString:@"iPad7,3"]) return @"iPad Pro 10.5";
    if ([machine isEqualToString:@"iPad7,4"]) return @"iPad Pro 10.5";
    if ([machine isEqualToString:@"iPad7,5"]) return @"iPad 6th";
    if ([machine isEqualToString:@"iPad7,6"]) return @"iPad 6th";
    if ([machine isEqualToString:@"iPad8,1"]) return @"iPad Pro 11";
    if ([machine isEqualToString:@"iPad8,2"]) return @"iPad Pro 11";
    if ([machine isEqualToString:@"iPad8,3"]) return @"iPad Pro 11";
    if ([machine isEqualToString:@"iPad8,4"]) return @"iPad Pro 11";
    if ([machine isEqualToString:@"iPad8,5"]) return @"iPad Pro 12.9 3rd";
    if ([machine isEqualToString:@"iPad8,6"]) return @"iPad Pro 12.9 3rd";
    if ([machine isEqualToString:@"iPad8,7"]) return @"iPad Pro 12.9 3rd";
    if ([machine isEqualToString:@"iPad8,8"]) return @"iPad Pro 12.9 3rd";
    if ([machine isEqualToString:@"iPad8,9"]) return @"iPad Pro 11 2nd";
    if ([machine isEqualToString:@"iPad8,10"]) return @"iPad Pro 11 2nd";
    if ([machine isEqualToString:@"iPad8,11"]) return @"iPad Pro 12.9 4rd";
    if ([machine isEqualToString:@"iPad8,12"]) return @"iPad Pro 12.9 4rd";
    if ([machine isEqualToString:@"iPad13,4"]) return @"iPad Pro 11 3rd";
    if ([machine isEqualToString:@"iPad13,5"]) return @"iPad Pro 11 3rd";
    if ([machine isEqualToString:@"iPad13,6"]) return @"iPad Pro 11 3rd";
    if ([machine isEqualToString:@"iPad13,7"]) return @"iPad Pro 11 3rd";
    if ([machine isEqualToString:@"iPad13,8"]) return @"iPad Pro 12.9 5rd";
    if ([machine isEqualToString:@"iPad13,9"]) return @"iPad Pro 12.9 5rd";
    if ([machine isEqualToString:@"iPad13,10"]) return @"iPad Pro 12.9 5rd";
    if ([machine isEqualToString:@"iPad13,11"]) return @"iPad Pro 12.9 5rd";
    if ([machine isEqualToString:@"iPad16,3"]) return @"iPad Pro 11 M4";
    if ([machine isEqualToString:@"iPad16,4"]) return @"iPad Pro 11 M4";
    if ([machine isEqualToString:@"iPad16,5"]) return @"iPad Pro 13 M4";
    if ([machine isEqualToString:@"iPad16,6"]) return @"iPad Pro 13 M4";
    //simulator
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
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = [self findNextViewControllerFrom:vc];
    return topVC;
}

+ (UIViewController *)findNextViewControllerFrom:(UIViewController *)vc {
    //递归
    UIViewController *nextVC;
    if ([vc presentedViewController]) {
        // 当前视图是被presented出来的
        nextVC = [vc presentedViewController];
        nextVC = [self findNextViewControllerFrom:nextVC];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        nextVC = [(UITabBarController *)vc selectedViewController];
        nextVC = [self findNextViewControllerFrom:nextVC];
    } else if ([vc isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        nextVC = [(UINavigationController *)vc visibleViewController];
        nextVC = [self findNextViewControllerFrom:nextVC];
    } else {
        // 根视图为非导航类
        nextVC = vc;
    }
    return nextVC;
}

+ (CGFloat)statusBarHeight {
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (UIEdgeInsets)safeAreaInsets {
    if (@available(iOS 11, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets;
    }
    return UIEdgeInsetsZero;
}

+ (CGFloat)safeAreaBottom {
    if (@available(iOS 11, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    }
    return 0;
}

+ (CGFloat)safeAreaTop {
    CGFloat height = 0;
    if (@available(iOS 11, *)) {
        height = [UIApplication sharedApplication].keyWindow.safeAreaInsets.top;
    } else {
        height = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    return height;
}

+ (CGFloat)navAddTopHeight {
    return 44 + [self safeAreaTop];
}

+ (CGFloat)tabbarAddBottomHeight {
    return 49 + [self safeAreaBottom];
}

+ (UIWindow *)getKeyWindow {
    return UIApplication.sharedApplication.keyWindow;
}

+ (UIWindow *)getTopWindow {
    UIWindow *window = nil;
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (NSInteger i = windows.count - 1; i >= 0; i--) {
        UIWindow *aWindow = windows[i];
        if (aWindow.isHidden && CGRectEqualToRect(aWindow.bounds, [UIScreen mainScreen].bounds)) {
            window = aWindow;
        }
    }
    return window;
}

+ (UIWindow *)getMainWindow {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return appDelegate.window;
}

@end
