//
//  CircleView.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/27.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "CircleView.h"
@interface CircleView()

@property(nonatomic,strong)CAShapeLayer *backLayer;
@property(nonatomic,strong)CAShapeLayer *foreLayer;
@property(nonatomic,strong)UIBezierPath *backPath;

@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)CAGradientLayer *gradientLayerLeft;
@end
@implementation CircleView
-(UILabel *)label
{
    if (!_label) {
        _label =[[UILabel alloc]initWithFrame:self.bounds];
        _label.center = self.center;
        _label.textAlignment = NSTextAlignmentCenter;
        
    }
    return _label;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUp];
        [self addSubview:self.label];
    }
    return self;
    
}
- (void)setUp
{
    self.backLayer =[CAShapeLayer layer];
    self.backLayer.fillColor  =[UIColor clearColor].CGColor;
    self.backLayer.frame = self.bounds;
    self.backLayer.lineWidth = 4;
    self.backLayer.strokeColor =[UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:self.backLayer];
    
    self.foreLayer =[CAShapeLayer layer];
    self.foreLayer.fillColor  =[UIColor clearColor].CGColor;
    self.foreLayer.frame = self.bounds;
    self.foreLayer.strokeColor =[UIColor redColor].CGColor;
    self.foreLayer.lineWidth = 4;
    [self.layer addSublayer:self.foreLayer];
    
    
    UIBezierPath *path=  [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2-2 startAngle:-M_PI_2 endAngle:M_PI *1.5 clockwise:YES];
    self.backPath = path;
    
    self.backLayer.path = self.backPath.CGPath;
    self.foreLayer.path = self.backPath.CGPath;
    self.foreLayer.strokeEnd = 0;
    
    
    self.gradientLayerLeft =[CAGradientLayer layer];
    self.gradientLayerLeft.frame = self.bounds;
    
    self.gradientLayerLeft.colors =@[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    self.gradientLayerLeft.locations = @[@0,@0.5,@1];
    self.gradientLayerLeft.startPoint = CGPointMake(0, 0);
    self.gradientLayerLeft.endPoint = CGPointMake(0, 1);
    [self.layer addSublayer:self.gradientLayerLeft];
  
    
    //设置mask
    [self.gradientLayerLeft setMask:self.foreLayer];
    
}
-(void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    self.foreLayer.strokeEnd = progressValue;
    self.label.text = [NSString stringWithFormat:@"%.f%%",progressValue *100];
}
@end
