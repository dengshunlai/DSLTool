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
    UIImage *image2 = [DSLTool imageWithImage:image1 multiple:0.5];
    NSLog(@"%ld,%@,%f",CGImageGetWidth(image2.CGImage),NSStringFromCGSize(image2.size),image2.scale);
    
    UIImageView *iv1 = [[UIImageView alloc] initWithImage:image1];
    iv1.frame = CGRectMake(100, 100, image1.size.width, image1.size.height);
    [self.view addSubview:iv1];
    
    UIImageView *iv2 = [[UIImageView alloc] initWithImage:image2];
    iv2.frame = CGRectMake(100, 150, image2.size.width, image2.size.height);
    [self.view addSubview:iv2];
    
    UIImage *image3 = [DSLTool imageWithImage:image1 orientation:UIImageOrientationUpMirrored];
    UIImageView *iv3 = [[UIImageView alloc] initWithImage:image3];
    iv3.frame = CGRectMake(100, 200, image3.size.width, image3.size.height);
    [self.view addSubview:iv3];
    
    UIImage *image4 = [DSLTool imageWithImage:image1 degree:90];
    UIImageView *iv4 = [[UIImageView alloc] initWithImage:image4];
    iv4.frame = CGRectMake(100, 250, image4.size.width, image4.size.height);
    [self.view addSubview:iv4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
