//
//  UIView+RadarAnimation.h
//  LXRadarAnimationDemo
//
//  Created by zhongzhi on 2017/7/20.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RadarAnimation)

@property(nonatomic,strong)UIColor *radarColor; //扩散颜色
@property(nonatomic,assign)UIColor *radarBorderColor; //扩散边界颜色
@property(nonatomic,assign)CALayer *animationLayer; //扩散边界颜色
-(void)addRadarAnimation;//添加动画
-(void)removeRadarAnimation; //移除动画，配合动画进入后台假死，重新添加
@end
