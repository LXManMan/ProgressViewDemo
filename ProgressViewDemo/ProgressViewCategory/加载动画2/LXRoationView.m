//
//  LXRoationView.m
//  ProgressViewDemo
//
//  Created by 漫漫 on 2018/5/16.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "LXRoationView.h"
@interface LXRoationView()<CAAnimationDelegate>
@property(nonatomic,strong)CAShapeLayer *layer1;
@property(nonatomic,strong)CAShapeLayer *layer2;
@end
@implementation LXRoationView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initilize];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self initilize];
        
        
    }
    return self;
}
-(void)initilize{
    
    //线宽可以自己设置
    CGFloat lineWidth = 10;
    CGPoint point =  CGPointMake(self.width/2, self.height/2);
    UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:point radius:(self.width - lineWidth)/2 startAngle:0 endAngle:2 *M_PI clockwise:YES];
    
    self.layer1 =[[CAShapeLayer alloc]init];
    self.layer1.frame = self. bounds;
    self.layer1.strokeColor = [UIColor hexStringToColor:@"#55a34a"].CGColor;
    self.layer1.fillColor =[UIColor clearColor].CGColor;
    self.layer1.lineWidth = lineWidth;
    self.layer1.strokeEnd = 0;
    self.layer1.lineCap = kCALineCapRound;
    
    
    self.layer1.path = path.CGPath;
    
    [self.layer addSublayer:self.layer1];
    
    UIBezierPath *path2 =[UIBezierPath bezierPathWithArcCenter:point radius:(self.width - lineWidth)/2 startAngle:M_PI endAngle:3 *M_PI clockwise:YES];
    self.layer2 =[[CAShapeLayer alloc]init];
    self.layer2.frame = self. bounds;
    self.layer2.strokeColor = [UIColor hexStringToColor:@"#55a34a"].CGColor;
    self.layer2.fillColor =[UIColor clearColor].CGColor;
    self.layer2.lineWidth = lineWidth;
    self.layer2.strokeEnd = 0.00 ;
    self.layer2.lineCap = kCALineCapRound;
    
    self.layer2.path = path2.CGPath;
    
    [self.layer addSublayer:self.layer2];
    
    
    [self animationFirst];
    
}
-(void)animationFirst{
    
    [self addAnimation:self.layer1 animationValue:@"layoneAnimation"];
    [self addAnimation:self.layer2 animationValue:@"layTwoAnimation"];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([[anim valueForKey:@"animationName"] isEqualToString:@"layoneAnimation"]) {
        
        [self addAnimation:self.layer1 animationValue:@"layoneAnimation"];
    }
    if ([[anim valueForKey:@"animationName"] isEqualToString:@"layTwoAnimation"]) {
        
        
        [self addAnimation:self.layer2 animationValue:@"layTwoAnimation"];
    }
    
}

-(void)addAnimation:(CAShapeLayer *)parentLayer animationValue:(NSString *)animationValue{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    parentLayer.strokeStart=0;
    //设置strokeEnd的最终值，动画的fromValue为0，
    parentLayer.strokeEnd= 0;
    CAKeyframeAnimation *animation1 =[CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    animation1.values = @[@0.00,@0.05,@0.7,@0.8,@1,@0.05];
    animation1.keyTimes = @[@0.00,@0.05,@0.7,@0.8,@0.9,@1];
    
    CAKeyframeAnimation *animation2 =[CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
    animation2.values = @[@0.00,@0.3,@0.4,@1,@0.05];
    animation2.keyTimes = @[@0.00,@0.7,@0.8,@0.9,@1];
    group.animations = @[animation1,animation2];
    
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.repeatCount = INT_MAX;
    
    group.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    group.duration = 5;
    group.delegate = self;
    [group setValue:animationValue forKey:@"animationName"];
    
    [parentLayer addAnimation:group forKey:@"animationName"];
    
    
}

@end
