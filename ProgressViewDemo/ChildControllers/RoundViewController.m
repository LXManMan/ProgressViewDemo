//
//  RoundViewController.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/26.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "RoundViewController.h"
#import "CircleView.h"
#define KHeight [[UIScreen mainScreen]bounds].size.height
#define kWidth [[UIScreen mainScreen]bounds].size.width
@interface RoundViewController ()
@property(nonatomic,strong)CircleView *circleView;

@end

@implementation RoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.circleView =[[CircleView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    self.circleView.center = self.view.center;
    [self.view addSubview:self.circleView];
    [self.slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    
}
-(void)changeValue:(UISlider *)slider
{
    self.circleView.progressValue = slider.value;
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
