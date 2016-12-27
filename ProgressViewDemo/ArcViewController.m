//
//  ArcViewController.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/26.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ArcViewController.h"
#import "ArcProgress.h"
@interface ArcViewController ()
@property(nonatomic,strong)ArcProgress *progress;
@end

@implementation ArcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   self.progress =[[ArcProgress alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 200, 200, 200)];
//    self.progress.backgroundColor =[UIColor brownColor];
    [self.view addSubview:self.progress];
    [self.slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
  
}
-(void)changeValue:(UISlider *)slider
{
    self.progress.progress = slider.value;
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
