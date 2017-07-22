//
//  UIView+FTCornerdious.m
//  Freight
//
//  Created by zhongzhi on 2017/7/3.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "UIView+FTCornerdious.h"

@implementation UIView (FTCornerdious)
-(void)setFTCornerdious:(CGFloat)cornerdious{
    UIView *tempView = self;

    
    UIBezierPath * maskPath =[UIBezierPath bezierPathWithRoundedRect:tempView.bounds cornerRadius:cornerdious];
    
   

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = tempView.bounds;
    maskLayer.path = maskPath.CGPath;
    tempView.layer.mask = maskLayer;
}
-(void)setFTLeftCornerdious:(CGFloat)cornerdious{
    UIView *tempView = self;
    
    
    UIBezierPath * maskPath =[UIBezierPath bezierPathWithRoundedRect:tempView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft cornerRadii:CGSizeMake(cornerdious, cornerdious)];
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = tempView.bounds;
    maskLayer.path = maskPath.CGPath;
    tempView.layer.mask = maskLayer;

}
-(void)setFTRightCornerdious:(CGFloat)cornerdious{
    UIView *tempView = self;
    
    
    UIBezierPath * maskPath =[UIBezierPath bezierPathWithRoundedRect:tempView.bounds byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerdious, cornerdious)];
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = tempView.bounds;
    maskLayer.path = maskPath.CGPath;
    tempView.layer.mask = maskLayer;
    
}
-(void)setFTBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    
}

-(void)setFtCornerdious:(CGFloat)cornerdious Corners:(UIRectCorner)corners {
    
    
    UIBezierPath * maskPath =[UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerdious, cornerdious)];
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
    
    
    
    
    
}
@end
