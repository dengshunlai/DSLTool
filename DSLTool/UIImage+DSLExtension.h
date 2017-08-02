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

/**
 根据颜色创建图像
 
 @param color 图像颜色
 
 @return UIImage
 */
+ (UIImage *)dsl_imagaWithColor:(UIColor *)color;

/**
 根据颜色创建图像
 
 @param color 图像颜色
 @param size  图像大小
 
 @return UIImage
 */
+ (UIImage *)dsl_imagaWithColor:(UIColor *)color size:(CGSize)size;

/**
 重新渲染图片为某种单一的颜色

 @param color 图片颜色
 @return UIImage
 */
- (UIImage *)dsl_imageWithColor:(UIColor *)color;


/**
 模糊效果

 @param blurRadius 模糊半径，参考值20

 @return UIImage
 */
- (UIImage *)dsl_blurWithRadius:(CGFloat)blurRadius;

/**
 light模糊

 @param blurRadius 模糊半径

 @return UIImage
 */
- (UIImage *)dsl_lightBlurWithRadius:(CGFloat)blurRadius;

/**
 extraLight模糊

 @param blurRadius 模糊半径

 @return UIImage
 */
- (UIImage *)dsl_extraLightBlurWithRadius:(CGFloat)blurRadius;

/**
 dark模糊

 @param blurRadius 模糊半径

 @return UIImage
 */
- (UIImage *)dsl_darkBlurWithRadius:(CGFloat)blurRadius;

/**
 完整模糊算法

 @param blurRadius            模糊半径
 @param tintColor             颜色
 @param saturationDeltaFactor 饱和度
 @param maskImage             mask

 @return UIImage
 */
- (UIImage *)dsl_blurWithRadius:(CGFloat)blurRadius
                      tintColor:(UIColor *)tintColor
          saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                      maskImage:(UIImage *)maskImage;

@end
