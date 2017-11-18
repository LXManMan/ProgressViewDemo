//
//  AddShopViewController.m
//  ProgressViewDemo
//
//  Created by chenergou on 2017/11/18.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "AddShopViewController.h"

@interface AddShopViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIImageView *shopView;


@end

@implementation AddShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.shopView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    __weak AddShopViewController *weakSelf = self;
    [cell setShoppingButtonBlock:^(CGPoint centerPoint) {
        
        
        CGPoint startPoint = [weakSelf.tableview convertPoint:centerPoint toView:weakSelf.view];;
        CGPoint endpoint = weakSelf.shopView.center;
        AddToShopAnimation *animatinon =  [[AddToShopAnimation alloc]initWithStartPoint:startPoint entPoint:endpoint ViewController:weakSelf HostView:weakSelf.shopView];
        [animatinon startAnimation];
    }];
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, Device_Width, Device_Height-64-64)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView =[UIView new];
        [_tableview registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil]forCellReuseIdentifier:cellId];
        
    }
    return _tableview;
}
-(UIImageView *)shopView
{
    if (!_shopView) {
        _shopView  =[[UIImageView alloc]initWithFrame:CGRectMake(0, Device_Height -64, 64, 64)];
        _shopView.image =[UIImage imageNamed:@"购物车"];
        _shopView.userInteractionEnabled = YES;
    }
    return _shopView;
}
@end
