//
//  DSLTool.h
//  DSLTool
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSLTool : NSObject

+ (UIImage *)imageWithImage:(UIImage *)image multiple:(CGFloat)multiple;

+ (UIImage *)imageWithImage:(UIImage *)image orientation:(UIImageOrientation)orientation;

+ (UIImage *)imageWithImage:(UIImage *)image degree:(CGFloat)degress;

@end
