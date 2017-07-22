//
//  AQYAnimationView.m
//  testDemo
//
//  Created by 刘新新 on 2017/7/22.
//  Copyright © 2017年 刘新新. All rights reserved.
//

#import "AQYAnimationView.h"
#define KAnimationDuration 0.7
@interface AQYAnimationView ()<CAAnimationDelegate>
@property(nonatomic,strong)CAShapeLayer *shapeLayer;
@property(nonatomic,strong)UIImageView *imageView;
@end
@implementation AQYAnimationView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
    }
    return self;
}
-(void)setUp{
    
    CGPoint point =  CGPointMake(self.width/2, self.height/2);
    UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:point radius:(self.width - 1)/2 startAngle:-0.5 *M_PI endAngle:1.5 *M_PI clockwise:YES];

    self.shapeLayer =[[CAShapeLayer alloc]init];
    self.shapeLayer.frame = self. bounds;
    
    self.shapeLayer.strokeColor = [UIColor hexStringToColor:@"#94BF3F"].CGColor;
    self.shapeLayer.fillColor =[UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth = 1;
    self.shapeLayer.lineCap = kCALineCapRound;
    
 
    self.shapeLayer.path = path.CGPath;
    
    [self.layer addSublayer:self.shapeLayer];
    
    
  
    self.imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 9, 9)];
    self.imageView.center = point;
    self.imageView.image =[UIImage imageNamed:@"三角形"];
    
    [self addSubview:self.imageView];
    [self animationOne];

}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([[anim valueForKey:@"animationName"] isEqualToString:@"AnimationEnd"]) {
        
        [self animationTwo];
        [self rotationAnimation];
    }
    if ([[anim valueForKey:@"animationName"] isEqualToString:@"AnimationStart"]) {
        
   
        [self.shapeLayer removeAllAnimations];
        [self animationOne];
    }
    
}
-(void)animationOne{
    
    self.shapeLayer.strokeStart=0;
    //设置strokeEnd的最终值，动画的fromValue为0，strokeEnd的最终值为0.98
    self.shapeLayer.strokeEnd=0.98;
    CABasicAnimation *basicAnimationOne=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimationOne.fromValue=@(0);
    
    basicAnimationOne.duration= KAnimationDuration;
    
    basicAnimationOne.delegate=self;
    [basicAnimationOne setValue:@"AnimationEnd" forKey:@"animationName"];
    
    [self.shapeLayer addAnimation:basicAnimationOne forKey:@"animationName"];
}
-(void)animationTwo{
    
    self.shapeLayer.strokeStart = 0.98;
    CABasicAnimation *basicAnimationTwo=[CABasicAnimation animationWithKeyPath:@"strokeStart"];
    basicAnimationTwo.fromValue=@(0);
    
    basicAnimationTwo.duration= KAnimationDuration;
    
    basicAnimationTwo.delegate=self;
    [basicAnimationTwo setValue:@"AnimationStart" forKey:@"animationName"];
    

    [self.shapeLayer addAnimation:basicAnimationTwo forKey:@"animationName"];
    
}
-(void)rotationAnimation{
    CABasicAnimation *rotationAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.toValue=@(M_PI*2);
    rotationAnimation.duration= KAnimationDuration;
    
    rotationAnimation.delegate=self;
    [rotationAnimation setValue:@"AnimationRotation" forKey:@"animationName"];
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"AnimationRotation"];
    

}
@end
