//
//  ViewController.m
//  DSLTool
//
//  Created by 邓顺来 on 16/9/28.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+DSLExtension.h"
#import "DSLTool.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) UIImage *netBar;
@property (strong, nonatomic) UIImageView *netBarIV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self checkVersion:nil];
    
    UIImage *image1 = [UIImage imageNamed:@"1"];
    NSLog(@"%ld,%@,%f",CGImageGetWidth(image1.CGImage),NSStringFromCGSize(image1.size),image1.scale);
    UIImage *image2 = [image1 dsl_imageWithMultiple:0.5];
    NSLog(@"%ld,%@,%f",CGImageGetWidth(image2.CGImage),NSStringFromCGSize(image2.size),image2.scale);
    
    UIImageView *iv1 = [[UIImageView alloc] initWithImage:image1];
    iv1.frame = CGRectMake(20, 70, image1.size.width, image1.size.height);
    [self.view addSubview:iv1];
    
    UIImageView *iv2 = [[UIImageView alloc] initWithImage:image2];
    iv2.frame = CGRectMake(100, 70, image2.size.width, image2.size.height);
    [self.view addSubview:iv2];
    
    UIImage *image3 = [image1 dsl_imageWithOrientation:UIImageOrientationUpMirrored];
    UIImageView *iv3 = [[UIImageView alloc] initWithImage:image3];
    iv3.frame = CGRectMake(180, 70, image3.size.width, image3.size.height);
    [self.view addSubview:iv3];
    
    UIImage *image4 = [image1 dsl_imageWithDegree:45];
    UIImageView *iv4 = [[UIImageView alloc] initWithImage:image4];
    iv4.frame = CGRectMake(260, 70, image4.size.width, image4.size.height);
    [self.view addSubview:iv4];
    
    
    UIImage *search = [UIImage imageNamed:@"search"];
    UIImageView *searchIV = [[UIImageView alloc] initWithImage:search];
    searchIV.frame = CGRectMake(20, 140, search.size.width, search.size.height);
    [self.view addSubview:searchIV];
    
    UIImage *search1 = [search dsl_imageWithColor:[UIColor orangeColor]];
    UIImageView *searchIV1 = [[UIImageView alloc] initWithImage:search1];
    searchIV1.frame = CGRectMake(100, 140, search1.size.width, search1.size.height);
    [self.view addSubview:searchIV1];
    
    UIImage *search2 = [search dsl_imageWithColor:[UIColor purpleColor]];
    UIImageView *searchIV2 = [[UIImageView alloc] initWithImage:search2];
    searchIV2.frame = CGRectMake(180, 140, search2.size.width, search2.size.height);
    [self.view addSubview:searchIV2];
    
    
    _netBar = [UIImage imageNamed:@"netBar.jpg"];
    _netBarIV = [[UIImageView alloc] init];
    _netBarIV.contentMode = UIViewContentModeScaleAspectFill;
    _netBarIV.clipsToBounds = YES;
    _netBarIV.frame = CGRectMake(20, 200, 300, 200);
    [self.view addSubview:_netBarIV];
    [self changeBlurRadius:_slider];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeBlurRadius:(UISlider *)sender {
    UIImage *blurNetBar = [_netBar dsl_blurWithRadius:sender.value];
//    UIImage *blurNetBar = [_netBar dsl_lightBlurWithRadius:sender.value];
//    UIImage *blurNetBar = [_netBar dsl_extraLightBlurWithRadius:sender.value];
//    UIImage *blurNetBar = [_netBar dsl_darkBlurWithRadius:sender.value];
    _netBarIV.image = blurNetBar;
}

- (IBAction)checkVersion:(UIButton *)sender {
    [DSLTool checkAppVersionWithBlock:^(BOOL isNeedUpdate, NSURL *appDownloadURL, NSDictionary *appStoreAppInfo) {
        if (isNeedUpdate) {
            //do something
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"发现新版本" message:@"请下载新版本" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //go to app store
                [[UIApplication sharedApplication] openURL:appDownloadURL];
                //不更新不给用，关闭程序
                exit(0);
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

@end
