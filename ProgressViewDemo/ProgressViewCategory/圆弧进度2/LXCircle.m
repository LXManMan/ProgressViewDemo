//
//  LXCircle.m
//  LXBezierPath
//
//  Created by zhongzhi on 2017/7/21.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXCircle.h"
#import "UIColor+Expanded.h"
#define LBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
@interface LXCircle()

@property(nonatomic,strong)UILabel *label;
@property(nonatomic,assign)CGFloat lineWidth;

@property(nonatomic,strong)CAShapeLayer *foreLayer;//蒙版layer
@end
@implementation LXCircle
-(instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _lineWidth = lineWidth;
    
        [self seup:frame];
    }
    return self;
}
-(void)seup:(CGRect) rect{
    
    //背景灰色
    CAShapeLayer *shapeLayer =[[CAShapeLayer alloc]init];
    
    shapeLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.width);
    shapeLayer.lineWidth = _lineWidth;
    
    shapeLayer.fillColor =[UIColor clearColor].CGColor;
    shapeLayer.strokeColor = LBColor(50, 50, 50, 1).CGColor;
    
    
    CGPoint center =  CGPointMake((rect.size.width )/2, (rect.size.width)/2);
    
    UIBezierPath *bezierPath =[UIBezierPath bezierPathWithArcCenter:center radius:(rect.size.width- _lineWidth)/2 startAngle:-0.5 *M_PI endAngle:1.5 *M_PI clockwise:YES];
    shapeLayer.path = bezierPath.CGPath;
    
    [self.layer addSublayer:shapeLayer];
    
    
    //渐变色，加蒙版，显示的蒙版的区域
    CAGradientLayer *gradientLayer =[[CAGradientLayer alloc]init];
    
    gradientLayer.frame = self.bounds;
    
    gradientLayer.colors = @[(id)[UIColor hexStringToColor:@"#5F98FC"].CGColor,(id)[UIColor hexStringToColor:@"#47BFFC"].CGColor];
    
    
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    [self.layer addSublayer:gradientLayer];

    
    self.foreLayer = [CAShapeLayer layer];
    self.foreLayer.frame = self.bounds;
    
    self.foreLayer.fillColor =[UIColor clearColor].CGColor;
    
    self.foreLayer.lineWidth = self.lineWidth;
    self.foreLayer.strokeColor = [UIColor redColor].CGColor;
    
    self.foreLayer.strokeEnd = 0;
    self.foreLayer.lineCap = kCALineCapRound;
    
    self.foreLayer.path = bezierPath.CGPath;
    
    gradientLayer.mask = self.foreLayer;
    
    
    self.label =[[UILabel alloc]initWithFrame:self.bounds];
    self.label.text  = @"";
    [self addSubview:self.label];
    
    self.label.font =[UIFont boldSystemFontOfSize:42];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor =[UIColor whiteColor];
}
-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    
    self.label.text = [NSString stringWithFormat:@"%.f%%",progress *100];
    self.foreLayer.strokeEnd = _progress;
}


@end
