//
//  QBQuSegmentView.h
//  QianBao
//
//  Created by zhongzhi on 2017/5/17.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QBQuSegmentView;
@protocol QBQuSegmentViewDelegate<NSObject>
-(void)QBQuSegmentView:(QBQuSegmentView *)segmentView didSelectBtnAtIndex:(NSInteger)index;
@end;
@interface QBQuSegmentView : UIView
-(instancetype)initWithFrame:(CGRect)frame titlesA:(NSArray *)titlesArray;
@property(nonatomic,strong)NSArray *titleA;
@property(nonatomic,weak)id<QBQuSegmentViewDelegate>delegate;

-(void)titleBtnSelectedWithScrollView:(UIScrollView *)scrollview;
-(void)isHavebottomLine:(BOOL) ishaveLine;
@end
