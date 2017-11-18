//
//  AddToShopAnimation.h
//  贝塞尔曲线之加入购物车
//
//  Created by chuanglong02 on 17/1/5.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AddToShopAnimation : NSObject
-(instancetype)initWithStartPoint:(CGPoint)startPoint entPoint:(CGPoint)endPoint ViewController:(UIViewController *)viewController HostView:(UIView *)shopView;
-(void)startAnimation;
@end
