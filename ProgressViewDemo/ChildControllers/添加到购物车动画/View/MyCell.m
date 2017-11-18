//
//  MyCell.m
//  贝塞尔曲线之加入购物车
//
//  Created by chuanglong02 on 17/1/3.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "MyCell.h"
#import "ViewController.h"
#define LBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LBRandomColor LBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@implementation MyCell
{
    ShoppingButtonBlock _shoppingButtonBlock;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.button.backgroundColor = LBRandomColor;
}
- (IBAction)btnClick:(UIButton *)sender {
    
    [self layoutIfNeeded];//获得frame
    
    CGPoint carButtonCenter = sender.center;
    
    //把button在cell坐标转化为在tableView上的坐标
    CGPoint point = [self convertPoint:carButtonCenter toView:self.superview.superview];
    
    //回调
    if (_shoppingButtonBlock)
    {
        _shoppingButtonBlock(point);
    }

   
}
-(void)setShoppingButtonBlock:(ShoppingButtonBlock)block
{
    _shoppingButtonBlock = block;
}

@end
