//
//  LXHubView.h
//  RoteAnimation
//
//  Created by chuanglong02 on 16/12/24.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXHubView : UIView<CAAnimationDelegate>
/** 球的颜色 */
@property (nonatomic,strong) UIColor *ballColor;

/** 展示加载动画*/
- (void)showHub;

/**
 *  关闭加载动画
 */
- (void)dismissHub;

@end
