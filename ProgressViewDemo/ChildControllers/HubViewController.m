//
//  HubViewController.m
//  ProgressViewDemo
//
//  Created by 漫漫 on 2018/5/16.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "HubViewController.h"
#import "LXHubView.h"
@interface HubViewController ()
@property (nonatomic,strong)LXHubView * hubView;
@end

@implementation HubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.slider.hidden = YES;
    
    self.hubView =[[LXHubView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:self.hubView];
    [self.hubView showHub];
    
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
