//
//  DSLTool.h
//  DSLTool
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSLTool : NSObject

/**
 检测app是否有新版本，
 直接调用会被苹果拒绝，可以让后台写个开关接口，等app上线后再打开这个方法

 @param block 是否有新版本，app下载URL，app信息
 */
+ (void)checkAppVersionWithBlock:(void (^)(BOOL isNeedUpdate, NSURL *appDownloadURL, NSDictionary *appStoreAppInfo))block;

/**
 生成uuid
 */
+ (NSString *)uuid;

/**
 返回设备名称
 */
+ (NSString *)deviceName;

/**
 获取图片的实际类型，返回nil表示未知类型
 */
+ (NSString *)typeForImageData:(NSData *)data;

@end
