//
//  UITextField+TintAjust.m
//  ThatDemo
//
//  Created by zhongzhi on 2017/6/27.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "UITextField+TintAjust.h"
#import <objc/runtime.h>

static NSString *adjust = @"adjust";
@implementation UITextField (TintAjust)

-(void)setTintAjust:(CGFloat )tintAjust{
    objc_setAssociatedObject(self, &adjust, @(tintAjust), OBJC_ASSOCIATION_ASSIGN);
    UILabel * leftView = [[UILabel alloc] initWithFrame:CGRectMake(tintAjust,0,tintAjust,self.frame.size.height)];
    leftView.backgroundColor = [UIColor clearColor];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
-(CGFloat)tintAjust{
    id  value = objc_getAssociatedObject(self, &adjust);
    return  [value floatValue ];
}
@end
