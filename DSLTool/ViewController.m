//
//  ViewController.m
//  DSLTool
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "ViewController.h"
#import "DSLTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image1 = [UIImage imageNamed:@"1"];
    NSLog(@"%ld,%@,%f",CGImageGetWidth(image1.CGImage),NSStringFromCGSize(image1.size),image1.scale);
    UIImage *newImage = [DSLTool imageWithImage:image1 multiple:0.5];
    NSLog(@"%ld,%@,%f",CGImageGetWidth(newImage.CGImage),NSStringFromCGSize(newImage.size),newImage.scale);
    
    UIImageView *iv1 = [[UIImageView alloc] initWithImage:image1];
    iv1.frame = CGRectMake(100, 100, image1.size.width, image1.size.height);
    [self.view addSubview:iv1];
    
    UIImageView *iv2 = [[UIImageView alloc] initWithImage:newImage];
    iv2.frame = CGRectMake(100, 150, newImage.size.width, newImage.size.height);
    [self.view addSubview:iv2];
    
    UIImage *image2 = [DSLTool imageWithImage:image1 orientation:UIImageOrientationUpMirrored];
    UIImageView *iv3 = [[UIImageView alloc] initWithImage:image2];
    iv3.frame = CGRectMake(100, 200, image2.size.width, image2.size.height);
    [self.view addSubview:iv3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
