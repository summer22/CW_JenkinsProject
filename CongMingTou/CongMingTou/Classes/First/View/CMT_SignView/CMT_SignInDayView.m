//
//  CMT_SignInDayView.m
//  button
//
//  Created by wzh on 16/10/25.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "CMT_SignInDayView.h"

@implementation CMT_SignInDayView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self =[[[NSBundle mainBundle] loadNibNamed:@"CMT_SignInDayView" owner:nil options:nil]lastObject];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];

}

- (void)setModel:(CMT_SignInDayItemModel *)model{
    _model = model;
    
    UIColor *selectColor = [UIColor colorWithRed:1.00f green:0.32f blue:0.38f alpha:1.00f];
//    UIColor *nomalColor = [UIColor colorWithRed:0.70f green:0.70f blue:0.70f alpha:1.00f];
     //1没签到 2 签到 3 没到－签到
    _dayBtn.selected = NO;
    _stateMidBtn.selected = NO;
    _stateMidBtn.hidden = NO;
    _dayBtn.hidden = NO;
//    _rightLineView.backgroundColor = nomalColor;
//    _leftLineView.backgroundColor = nomalColor;
    
    if(_model.isSignIn == 1){//没签到
//        _leftLineView.backgroundColor = selectColor;
        
    }else if (_model.isSignIn == 2){//签到
        _desLab.textColor = selectColor;
//        _leftLineView.backgroundColor = selectColor;
//        _rightLineView.backgroundColor =  selectColor;
        _dayBtn.selected = YES;
        _stateMidBtn.selected = YES;
    }else if (_model.isSignIn == 3){//没到－签到
        _stateMidBtn.hidden = YES;
        _dayBtn.hidden = YES;
    }
    [_dayBtn setTitle:[NSString stringWithFormat:@"%@",_model.day] forState:UIControlStateNormal];
    _desLab.text = [NSString stringWithFormat:@"%@",_model.des];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_midPointView styleWithCornerRadius:2];
    _dayBtn.titleEdgeInsets = UIEdgeInsetsMake(-6 * CMT_6PERCENTY, 0, 0, 0);
}
@end
