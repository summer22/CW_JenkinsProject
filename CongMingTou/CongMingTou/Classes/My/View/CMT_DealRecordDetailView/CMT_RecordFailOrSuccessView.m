//
//  CMT_RecordFailOrSuccessView.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RecordFailOrSuccessView.h"

@implementation CMT_RecordFailOrSuccessView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        [self setUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [[NSBundle mainBundle] loadNibNamed:@"CMT_RecordFailOrSuccessView" owner:self options:nil];
    [self addSubview:self.MyVIew];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyVIew];
    self.MyVIew.frame = self.bounds; //填一下自动布局的坑！
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    self.lineTwo.backgroundColor = CommonLineColor;
    self.lineTwoH.constant = 0.5;
    self.threeLine.backgroundColor = CommonLineColor;
    self.threeLineH.constant = 0.5;
}

- (void)setMyModel:(CMT_DealRecordDetailModel *)myModel{
    self.startTime.text = myModel.startTime;
    self.endTime.text = myModel.endTime;
    self.dealType.text = myModel.tradeType;
    self.serviceFee.text = myModel.fee;
}

@end
