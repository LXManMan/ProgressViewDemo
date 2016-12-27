//
//  shipeAnimation.m
//  ProgressViewDemo
//
//  Created by chuanglong02 on 16/12/27.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "shipeAnimation.h"
#define HEIGHT                   [UIScreen mainScreen].bounds.size.height
#define WIDTH                    [UIScreen mainScreen].bounds.size.width

@interface shipeAnimation()
{
    CGFloat waveHeight;//浪高
    CGFloat waveSpeed; //浪速
    CGFloat waveCurvature;//浪的弯曲度  等同于设置波的周期
    CGFloat offSetValue; //波的初相位
    
    CAShapeLayer *realWaveLayer; //真实的波形
    CAShapeLayer *maskWaveLayer; //类似于遮罩
    
    UIImageView *boardView; //小船
}
@end
@implementation shipeAnimation

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化
        waveHeight = 8;
        waveSpeed = 1;
        waveCurvature = 1.2;
        offSetValue = 0.f;
        [self creatWave];
        
        /**
         *   初始化一个CADisplayLink对象并以特定的模式注册到runloop之中，屏幕刷新时调用指定的方法
         *
         */
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(waveMove)];
        [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}
-(void)creatWave
{
    UIView *blueBgView =[[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, self.frame.size.height)];
    blueBgView.backgroundColor =[UIColor colorWithRed:0.47 green:0.83 blue:0.98 alpha:1];
    [self addSubview:blueBgView];
    
    /**
     *  此处 CAShapeLayer 的Frame 需要初始化，后续path的坐标是相对 CAShapeLayer 的frame的，
     如果此处不设置 Frame ， path 里面点的坐标就要设置成想对当前 View的坐标 效果才对。
     */
    
    //真实浪
    realWaveLayer  =[CAShapeLayer layer];
    CGRect rect  = blueBgView.frame;
    rect.origin.y = CGRectGetHeight(rect) - waveHeight;
    
    realWaveLayer.fillColor =[UIColor whiteColor].CGColor;
    
    realWaveLayer.frame = rect;
    
    [blueBgView .layer addSublayer:realWaveLayer];
    
    
    //背后的遮罩浪图层
    
    maskWaveLayer =[CAShapeLayer layer];
    CGRect rect1 = blueBgView.frame;
    
    rect1.origin.y = CGRectGetHeight(rect1) -waveHeight;
    
    maskWaveLayer.fillColor =[[UIColor whiteColor]colorWithAlphaComponent:0.4].CGColor;
    maskWaveLayer.frame = rect1;
    [blueBgView.layer addSublayer:maskWaveLayer];
    
    boardView =  [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/2-30, 0, 60, 60)];
    boardView.image = [UIImage imageNamed:@"chuan"];
    [blueBgView addSubview:boardView];
}
-(void)waveMove
{
    //为 实浪设置路径，起始点
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, nil, 0, waveHeight);
    CGFloat y = 0;
    //为遮罩图层设置路径 起始点
    CGMutablePathRef maskPath = CGPathCreateMutable();
    CGPathMoveToPoint(maskPath, nil, 0, waveHeight);
    
    CGFloat masky = 0;
    offSetValue += waveSpeed; //移动的变化就是靠这个值的累加
    /**
     *  使用for循环 生成一系列的正弦曲线的点，并添加到路径中
     */
    
    for (int x = 0; x<WIDTH; x++) {
        y = waveHeight*sinf(0.01*waveCurvature*x+offSetValue*0.045);
        CGPathAddLineToPoint(path, nil, x, y);
        //遮罩层的路径与之相反
        masky = -y;
        CGPathAddLineToPoint(maskPath, nil, x, masky);
    }
    
    //CAShapeLayer右下角的点
    CGPathAddLineToPoint(path, nil, WIDTH, waveHeight);
    //CAShapeLayer左下角的点
    CGPathAddLineToPoint(path, nil, 0, waveHeight);
    //闭合路径
    CGPathCloseSubpath(path);
    realWaveLayer.path = path;
    
    //释放路径
    CGPathRelease(path);
    
    //CAShapeLayer右下角的点
    CGPathAddLineToPoint(maskPath, nil, WIDTH, waveHeight);
    //CAShapeLayer左下角的点
    CGPathAddLineToPoint(maskPath, nil, 0, waveHeight);
    //闭合路径
    CGPathCloseSubpath(maskPath);
    maskWaveLayer.path = maskPath;
    
    //释放路径
    CGPathRelease(maskPath);
    
    CGFloat CentY = waveHeight*sinf(0.01*waveCurvature*WIDTH/2+offSetValue*0.045);
    CGRect boardViewFrame = [boardView frame];
    boardViewFrame.origin.y = 100-waveHeight+CentY;
    boardView.frame = boardViewFrame;
    
}

@end
