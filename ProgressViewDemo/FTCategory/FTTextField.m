//
//  FTTextField.m
//  Freight
//
//  Created by zhongzhi on 2017/6/13.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "FTTextField.h"

@implementation FTTextField
-(void)awakeFromNib{
    [super  awakeFromNib];
    self.tintColor = [UIColor hexStringToColor:@"#393d63"];
    
    self.placeHodlerFont = self.font;
}
-(void)setRightViewXLeft:(CGFloat)rightViewXLeft{
    _rightViewXLeft  = rightViewXLeft;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.tintColor = [UIColor hexStringToColor:@"#393d63"];
    }
    return self;
}
-(void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    _placeHolderColor = placeHolderColor;
    if (_placeHolderColor) {
         [self setValue:_placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    
}
-(void)setPlaceHodlerFont:(UIFont *)placeHodlerFont{
    _placeHodlerFont = placeHodlerFont;
    if (_placeHodlerFont) {
          [self setValue:self.font forKeyPath:@"_placeholderLabel.font"];
    }
}

- (CGRect) rightViewRectForBounds:(CGRect)bounds {
    CGRect textRect = [super rightViewRectForBounds:bounds];
    if (self.rightViewXLeft) {
        textRect.origin.x -= 10;
    }
    return textRect;
}
@end
