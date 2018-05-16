//
//  RoationViewController.m
//  ProgressViewDemo
//
//  Created by 漫漫 on 2018/5/16.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "RoationViewController.h"
#import "LXRoationView.h"
@interface RoationViewController ()
@property (nonatomic,strong)LXRoationView * animationView;
@end

@implementation RoationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.slider.hidden = YES;
    
    self.animationView =[[LXRoationView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.animationView.backgroundColor = [UIColor hexStringToColor:@"#333333" andAlpha:0.7];
    self.animationView.center  =self.view.center;
    [self.view addSubview:self.animationView];
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
