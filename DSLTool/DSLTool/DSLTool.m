//
//  DSLTool.m
//  DSLTool
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "DSLTool.h"

@implementation DSLTool

+ (UIImage *)imageWithImage:(UIImage *)image multiple:(CGFloat)multiple
{
    CGFloat scale = image.scale;
    NSInteger width = image.size.width * multiple;
    NSInteger height = image.size.height * multiple;
    CGSize size = CGSizeMake(width, height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image orientation:(UIImageOrientation)orientation
{
    return [UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:orientation];
}

@end
