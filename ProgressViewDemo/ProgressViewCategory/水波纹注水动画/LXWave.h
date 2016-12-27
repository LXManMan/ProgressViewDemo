//
//  LXWave.h
//  LXWaveProgressView
//
//  Created by chuanglong02 on 16/12/26.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXWave : UIView

///设置进度
@property(nonatomic,assign)CGFloat progress;

-(void)stop;
@end
