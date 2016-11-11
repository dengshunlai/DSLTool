//
//  UIImage+DSLExtension.h
//  DSLTool
//
//  Created by 邓顺来 on 16/11/2.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DSLExtension)

/**
 放大、缩小

 @param multiple 倍数

 @return UIImage
 */
- (UIImage *)dsl_imageWithMultiple:(CGFloat)multiple;

/**
 镜像

 @param orientation UIImageOrientation

 @return UIImage
 */
- (UIImage *)dsl_imageWithOrientation:(UIImageOrientation)orientation;

/**
 旋转

 @param degress 角度（非弧度）

 @return UIImage
 */
- (UIImage *)dsl_imageWithDegree:(CGFloat)degress;

@end
