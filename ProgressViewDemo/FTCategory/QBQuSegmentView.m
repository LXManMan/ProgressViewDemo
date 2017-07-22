//
//  QBQuSegmentView.m
//  QianBao
//
//  Created by zhongzhi on 2017/5/17.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//
#define VIEH 45
#define LINEH 1
#import "LxButton.h"
#import "QBQuSegmentView.h"
@interface QBQuSegmentView()
@property(nonatomic,strong)LxButton *selectBtn;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)NSMutableArray *titleBtnA;
@end
@implementation QBQuSegmentView
-(instancetype)initWithFrame:(CGRect)frame titlesA:(NSArray *)titlesArray{
    self = [super initWithFrame:frame];
    if (self) {
        _titleA = titlesArray;
        [self setSubviewWith:_titleA];
    }
    return self;
}

-(void)setSubviewWith:(NSArray *)titleA{
    
    
    for (int i = 0; i < titleA.count; i++) {
        CGFloat btnH = VIEH - LINEH;
        CGFloat btnW = Device_Width/titleA.count;
        NSString *title = titleA[i];
        UIFont *font = Font(16);
        CGRect frame = CGRectMake(i * btnW, 0, btnW, btnH);
               LxButton *button =[LxButton LXButtonWithTitle:title titleFont:font Image:nil backgroundImage:nil backgroundColor:[UIColor clearColor] titleColor:[UIColor hexStringToColor:@"#333333"] frame:frame];
        [button setTitleColor:[UIColor hexStringToColor:@"#64c961"] forState:UIControlStateSelected];
        button.tag = i;
        [self addSubview:button];
        [self.titleBtnA addObject:button];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            self.selectBtn = button;
            [self addSubview:self.lineView];
            [self setLineViewFrame:self.selectBtn];
        }
    }
}
-(void)setLineViewFrame:(LxButton *)selectBtn{
    CGSize buttonSize =[self sizeWithText:self.selectBtn.titleLabel.text font:Font(16) maxSize:CGSizeMake(MAXFLOAT, selectBtn.height)];
    
    CGFloat linewidth = buttonSize.width +2;
    [UIView animateWithDuration:0.25 animations:^{
       self.lineView.frame = CGRectMake(self.selectBtn.x +(self.selectBtn.width -linewidth)/2, selectBtn.height, linewidth, LINEH);
    }];
    
}
-(void)titleBtnSelectedWithScrollView:(UIScrollView *)scrollview{
    // 1、计算滚动到哪一页
    NSInteger index = scrollview.contentOffset.x / scrollview.frame.size.width;
    
    // 2、把对应的标题选中
    self.selectBtn = self.titleBtnA[index];
    
    
}
-(void)btnClick:(LxButton *)button{
    self.selectBtn = button;
    if ([self.delegate respondsToSelector:@selector(QBQuSegmentView:didSelectBtnAtIndex:)]) {
        [self.delegate QBQuSegmentView:self didSelectBtnAtIndex:self.selectBtn.tag];
    }
}
-(void)setSelectBtn:(LxButton *)selectBtn{
  
    if (_selectBtn != selectBtn) {
          _selectBtn.selected = NO;
        _selectBtn = selectBtn;
        _selectBtn.selected = YES;
        [self setLineViewFrame:self.selectBtn];

    }
}
-(void)isHavebottomLine:(BOOL) ishaveLine{
  
    self.lineView.hidden = !ishaveLine;
    
}

-(void)setTitleA:(NSArray *)titleA{
    _titleA = titleA;
    [self setSubviewWith:titleA];
}/**
  *  计算文字尺寸
  *
  *  @param text    需要计算尺寸的文字
  *  @param font    文字的字体
  *  @param maxSize 文字的最大尺寸
  */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView =[[UIView alloc]init];
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}
-(NSMutableArray *)titleBtnA{
    if (!_titleBtnA) {
        _titleBtnA =[NSMutableArray array];
    }
    return _titleBtnA;
}
@end
