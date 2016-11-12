//
//  UIImage+DSLExtension.m
//  DSLTool
//
//  Created by 邓顺来 on 16/11/2.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "UIImage+DSLExtension.h"

@implementation UIImage (DSLExtension)

- (UIImage *)dsl_imageWithMultiple:(CGFloat)multiple
{
    CGFloat scale = self.scale;
    NSInteger width = self.size.width * multiple;
    NSInteger height = self.size.height * multiple;
    CGSize size = CGSizeMake(width, height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)dsl_imageWithOrientation:(UIImageOrientation)orientation
{
    return [UIImage imageWithCGImage:self.CGImage scale:self.scale orientation:orientation];
}

- (UIImage *)dsl_imageWithDegree:(CGFloat)degress
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.size.width / 2, self.size.height / 2);
    CGContextRotateCTM(context, degress * M_PI / 180);
    [self drawInRect:CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)dsl_imagaWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(2, 2), NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 2, 2));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)dsl_imagaWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
