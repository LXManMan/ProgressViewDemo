//
//  ShipeViewController.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/27.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ShipeViewController.h"
#import "shipeAnimation.h"
#define HEIGHT                   [UIScreen mainScreen].bounds.size.height
#define WIDTH                    [UIScreen mainScreen].bounds.size.width
@interface ShipeViewController ()

@end

@implementation ShipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    shipeAnimation *animationView =[[shipeAnimation alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 160)];
    [self.view addSubview:animationView];
    self.slider.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
