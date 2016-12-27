//
//  LXWaveProgress.m
//  LXWaveProgressView
//
//  Created by chuanglong02 on 16/12/26.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "LXWaveProgress.h"
#import "LXWave.h"
@interface LXWaveProgress()
{
    LXWave *_wave;
    UILabel *_progressLabel;
}
@end
@implementation LXWaveProgress

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    self.backgroundColor = [UIColor colorWithRed:190/255.0f green:232/255.0f blue:231/255.0f alpha:0.8];
    self.layer.cornerRadius = self.bounds.size.width/2.0f;
    self.layer.masksToBounds = true;
    
    CGFloat waveWidth = self.bounds.size.width * 0.8f;
    _wave = [[LXWave alloc] initWithFrame:CGRectMake(0, 0, waveWidth, waveWidth)];
    _wave.center = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.width/2.0f);
    [self addSubview:_wave];
    
    _progressLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _progressLabel.textAlignment = NSTextAlignmentCenter;
    _progressLabel.textColor = [UIColor whiteColor];
    _progressLabel.font = [UIFont boldSystemFontOfSize:50];
    [self addSubview:_progressLabel];

}
-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    _wave.progress = progress;
    _progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
}

-(void)dealloc
{
    [_wave stop];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}
@end
