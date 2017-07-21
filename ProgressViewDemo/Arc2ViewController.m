//
//  Arc2ViewController.m
//  ProgressViewDemo
//
//  Created by zhongzhi on 2017/7/21.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "Arc2ViewController.h"
#import "LXCircle.h"

#import "UIColor+Expanded.h"
@interface Arc2ViewController ()
{
    LXCircle *_pathView;
}
@end

@implementation Arc2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor blackColor];
    
    self.slider.hidden = YES;
    
    LXCircle *pathView =[[LXCircle alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 30, self.view.frame.size.width - 30) lineWidth:30];
    pathView.center = self.view.center;
    
    pathView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:pathView];
    
    _pathView  = pathView;
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(pathView.frame) + 50, self.view.bounds.size.width - 2*50, 30)];
    [slider addTarget:self action:@selector(sliderMethod:) forControlEvents:UIControlEventValueChanged];
    [slider setMaximumValue:1];
    [slider setMinimumValue:0];
    [slider setMinimumTrackTintColor:[UIColor hexStringToColor:@"#5F98FC"]];
    [self.view addSubview:slider];

}
-(void)sliderMethod:(UISlider*)slider
{
    _pathView.progress = slider.value;
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
