//
//  AQiYiViewController.m
//  ProgressViewDemo
//
//  Created by 刘新新 on 2017/7/22.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "AQiYiViewController.h"
#import "AQYAnimationView.h"

@interface AQiYiViewController ()
@property(nonatomic,strong)AQYAnimationView *aqyAnimationView;

@end

@implementation AQiYiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.slider.hidden = YES;
    UIView *backView=[UIView new];
    backView.backgroundColor=[UIColor blackColor];
    backView.frame=CGRectMake(0, 64, self.view.frame.size.width, 200);
    [self.view addSubview:backView];
    UIImageView *backImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loadinglogo"]];
    backImageView.frame=CGRectMake(0, 0, self.view.frame.size.width*0.7, self.view.frame.size.width/3*0.7);
    backImageView.center=backView.center;
    
    [self.view addSubview:backImageView];
    
    
    
    
    self.aqyAnimationView =[[AQYAnimationView alloc]initWithFrame:CGRectMake(backImageView.x +60, CGRectGetMaxY(backImageView.frame), 18,18)];
    self.aqyAnimationView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:self.aqyAnimationView];

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
