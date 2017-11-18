//
//  AddToShopAnimation.m
//  贝塞尔曲线之加入购物车
//
//  Created by chuanglong02 on 17/1/5.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "AddToShopAnimation.h"

@implementation AddToShopAnimation
{
    CGPoint _startPoint;
    CGPoint _endPoint;
    UIView *_shopView;
    UIViewController *_viewController;
}
-(instancetype)initWithStartPoint:(CGPoint)startPoint entPoint:(CGPoint)endPoint ViewController:(UIViewController *)viewController HostView:(UIView *)shopView
{
    self = [super init];
    if (self) {
        
        _startPoint = startPoint;
        _endPoint = endPoint;
        _shopView = shopView;
        _viewController = viewController;
    }
    
    return self;
        

}
-(void)startAnimation
{
    //起点
    
    //控点
    CGPoint controlPoint = CGPointMake(_endPoint.x, _startPoint.y);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_startPoint];
    [path addQuadCurveToPoint:_endPoint controlPoint:controlPoint];
    
    CAShapeLayer *layer =[CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.lineWidth = 3.0f;
    layer.shouldRasterize = YES;//抗锯齿
    [_viewController.view.layer addSublayer:layer];
    
    //创建关键帧
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //动画时间
    animation.duration = 1;
    animation.path = path.CGPath
    ;
    //当动画完成，停留到结束位置
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_shopView.layer addAnimation:animation forKey:nil];
    path = nil;

}
@end
