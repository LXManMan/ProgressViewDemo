//
//  UIImage+colorImage.h
//  CLCollege
//
//  Created by zhongzhi on 2017/5/9.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (colorImage)
+ (UIImage *)imageWithColor:(UIColor *)color;
-(UIImage*)scaleToSize:(CGSize)size;
+ (UIImage *)NavImage;
+ (instancetype)imageWithOriginalName:(NSString *)imageName;
+ (UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size;
@end
