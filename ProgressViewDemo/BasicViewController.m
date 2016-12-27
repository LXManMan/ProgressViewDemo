//
//  BasicViewController.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/26.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.slider =[[UISlider alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height - 100, self.view.frame.size.width -100, 30)];
    [self.slider setMaximumValue:1.0];
    [self.slider setMinimumValue:0.0];
//    self.slider.value = 0.5;
    [self.view addSubview:self.slider];
    self.view.backgroundColor =[UIColor whiteColor];
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
