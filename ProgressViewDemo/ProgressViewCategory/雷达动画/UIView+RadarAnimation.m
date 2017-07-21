//
//  UIView+RadarAnimation.m
//  LXRadarAnimationDemo
//
//  Created by zhongzhi on 2017/7/20.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "UIView+RadarAnimation.h"
#import <objc/runtime.h>
#define LBColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
static NSString *radarKey = @"radarKey";
static NSString *radarBorderKey = @"radarBorderKey";
static NSString *animationLayer = @"animationLayer";

@implementation UIView (RadarAnimation)
-(void)addRadarAnimation{
   
    [self Animation];
}
-(void)setRadarBorderColor:(UIColor *)radarBorderColor{
    
    objc_setAssociatedObject(self, &radarBorderKey, radarBorderColor, OBJC_ASSOCIATION_RETAIN);

}
-(void)setAnimationLayer:(CALayer *)animationLayer{
    objc_setAssociatedObject(self, &animationLayer, animationLayer, OBJC_ASSOCIATION_RETAIN);

}
-(CALayer *)animationLayer{
     return objc_getAssociatedObject(self, &animationLayer);
}
-(UIColor *)radarBorderColor{
    return objc_getAssociatedObject(self, &radarBorderKey);
}
-(void)setRadarColor:(UIColor *)radarColor{
    objc_setAssociatedObject(self, &radarKey, radarColor, OBJC_ASSOCIATION_RETAIN);
}
-(UIColor *)radarColor{
    return objc_getAssociatedObject(self, &radarKey);
}
-(void)removeRadarAnimation{
    [self.animationLayer removeFromSuperlayer];
    
}
-(void)Animation{
    NSInteger pulsingCount = 3;
    double animationDuration = 2;
    
    CALayer * animationLayer = [[CALayer alloc]init];
    
    for (int i = 0; i < pulsingCount; i++) {
        CALayer * pulsingLayer = [[CALayer alloc]init];
        pulsingLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        pulsingLayer.backgroundColor = self.radarColor.CGColor;
        pulsingLayer.borderColor = self.radarBorderColor.CGColor;


        pulsingLayer.borderWidth = 1.0;
        pulsingLayer.cornerRadius = self.frame.size.height/2;
        
        CAMediaTimingFunction * defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        CAAnimationGroup * animationGroup = [[CAAnimationGroup alloc]init];
        animationGroup.fillMode = kCAFillModeBoth;
        animationGroup.beginTime = CACurrentMediaTime() + (double)i * animationDuration/(double)pulsingCount;
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = HUGE_VAL;
        animationGroup.timingFunction = defaultCurve;
        
        CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.autoreverses = NO;
        scaleAnimation.fromValue = [NSNumber numberWithDouble:1];
        scaleAnimation.toValue = [NSNumber numberWithDouble:1.5];
        
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[[NSNumber numberWithDouble:1.0],[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:0.3],[NSNumber numberWithDouble:0.0]];
        opacityAnimation.keyTimes = @[[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.25],[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:1.0]];
        animationGroup.animations = @[scaleAnimation,opacityAnimation];
        
        [pulsingLayer addAnimation:animationGroup forKey:@"pulsing"];
        [animationLayer addSublayer:pulsingLayer];
    }
        animationLayer.zPosition = -1;//重新加载时，使动画至底层
    [self.layer addSublayer:animationLayer];

}
@end
