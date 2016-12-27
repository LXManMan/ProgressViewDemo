//
//  HubViewController.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/27.
//  Copyright © 2016年 漫漫. All rights reserved.
//
#define HEIGHT                   [UIScreen mainScreen].bounds.size.height
#define WIDTH                    [UIScreen mainScreen].bounds.size.width
#import "HubViewController.h"

#import "LXHubView.h"
@interface HubViewController ()

@end

@implementation HubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *iamgeView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH)];
    iamgeView.image =[UIImage imageNamed:@"dahai.jpg"];
    [self.view addSubview:iamgeView];
    LXHubView *loadingHubView = [[LXHubView alloc] initWithFrame:CGRectMake(130, 150, 150, 150)];
    [self.view addSubview:loadingHubView];

    [loadingHubView showHub];
    self.slider.hidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
