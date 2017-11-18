//
//  RadarViewController.m
//  ProgressViewDemo
//
//  Created by zhongzhi on 2017/7/21.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "RadarViewController.h"
#import "UIView+RadarAnimation.h"


#define LBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
@interface RadarViewController ()

@end

@implementation RadarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 112, 112);
    button.center = self.view.center;
    
    [button setTitle:@"  查看 \n 英雄榜" forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = 0;//这句话很重要，不加这句话加上换行符也没用
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor =[UIColor clearColor];
    [self.view addSubview:button];
    button.radarColor = LBColor(237, 174, 130, 1);
    button.radarBorderColor = LBColor(237, 174, 130, 0.5);
    
    [button addRadarAnimation];
    
    self.slider.hidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
