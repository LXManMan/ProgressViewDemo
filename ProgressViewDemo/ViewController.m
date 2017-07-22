//
//  ViewController.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/26.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "BasicViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableFooterView =[UIView new];
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSString *string = [NSString stringWithFormat:@"%@ViewController",self.datas[indexPath.row]];

     BasicViewController*vc =[NSClassFromString(string) new];
    vc.title = self.datas[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSMutableArray *)datas
{
    if (!_datas) {
        _datas =[NSMutableArray array];
        [_datas  addObject:@"Arc"];
        [_datas addObject:@"Arc2"];
        [_datas addObject:@"Round"];
        [_datas addObject:@"Hub"];
        [_datas addObject:@"Wave"];
        [_datas addObject:@"Shipe"];
        [_datas addObject:@"Radar"];
        [_datas addObject:@"AQiYi"];
    }
    return _datas;
}

@end
