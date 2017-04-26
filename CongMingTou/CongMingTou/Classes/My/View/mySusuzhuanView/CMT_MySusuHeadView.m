//
//  CMT_MySusuHeadView.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MySusuHeadView.h"

@implementation CMT_MySusuHeadView

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
    [[NSBundle mainBundle] loadNibNamed:@"CMT_MySusuHeadView" owner:self options:nil];
    [self addSubview:self.MyView];
}

- (void)setHeadModelData:(CMT_MySuOrYueModel *)myModel withType:(NSString *)typeStr{
    if ([typeStr isEqualToString:@"1"]) {
        self.topLabel.text = myModel.fastAssetsAmount;
        self.waitProfit.text = myModel.fastPlanIncome;
        self.totalProfit.text = myModel.fastAlreadyIncome;
        self.topTitleLabel.text = @"速速赚资产(元)";
    }else{
        self.topLabel.text = myModel.monthAssetsAmount;
        self.waitProfit.text = myModel.monthPlanIncome;
        self.totalProfit.text = myModel.monthAlreadyIncome;
        self.topTitleLabel.text = @"月月息资产(元)";
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self sendSubviewToBack:self.MyView];
    self.MyView.frame = self.bounds; //填一下自动布局的坑！
    self.MyView.backgroundColor = CommonBgColor;
}


@end
