//
//  ArcProgress.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/26.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ArcProgress.h"
@interface ArcProgress()
@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)CAShapeLayer *shapeLayer;
@end
@implementation ArcProgress

-(UILabel *)lable
{
    if (!_lable) {
        _lable =[[UILabel alloc]init];
        _lable.textAlignment = NSTextAlignmentCenter;
    }
    return _lable;
}
- (void)layoutSubviews
{
    //必须写
    [super layoutSubviews];
    
    
    self.lable.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    //设置Label文字居中并添加
    self.lable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.lable];
    
    
}
-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    
    //修改 文字
    
    self.lable.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];

    [self.shapeLayer removeFromSuperlayer];
    // 圆心
    CGPoint point = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    //起点位置
    CGFloat startAngle = - M_PI /2;
    
    //结束位置
    CGFloat endAngle = self.progress *M_PI *2 + startAngle;
    
    
    UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:point radius:self.bounds.size.width/2 startAngle:startAngle endAngle:endAngle clockwise:1];
    
     //画一根到 圆心的线
    [path addLineToPoint:point];
    
    
    //通过layer绘制
    CAShapeLayer *layer =[CAShapeLayer layer];
    
    
    layer.path = path.CGPath;
    
    layer.fillColor =[UIColor colorWithRed:0.47 green:0.83 blue:0.98 alpha:1].CGColor;
    
    [self.layer addSublayer:layer];
    
    self.shapeLayer = layer;
    
}
@end
