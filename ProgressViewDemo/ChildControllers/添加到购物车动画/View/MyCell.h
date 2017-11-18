//
//  MyCell.h
//  贝塞尔曲线之加入购物车
//
//  Created by chuanglong02 on 17/1/3.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ShoppingButtonBlock)(CGPoint centerPoint);

@interface MyCell : UITableViewCell<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;

//设置添加购物车回调
- (void)setShoppingButtonBlock:(ShoppingButtonBlock)block;
@end
