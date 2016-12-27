//
//  WaveViewController.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/27.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "WaveViewController.h"
#import "LXWaveProgress.h"
@interface WaveViewController ()
{
    LXWaveProgress *_waveProgress;
}
@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _waveProgress = [[LXWaveProgress alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _waveProgress.center = self.view.center;
    [self.view addSubview:_waveProgress];
    _waveProgress.progress = 0.0f;

    [self.slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    
}
-(void)changeValue:(UISlider *)slider
{
    _waveProgress.progress = slider.value;
    
}



@end
