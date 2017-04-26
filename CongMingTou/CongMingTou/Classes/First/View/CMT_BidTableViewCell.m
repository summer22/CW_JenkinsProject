//
//  CMT_BidTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BidTableViewCell.h"

@implementation CMT_BidTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.prizeLabel.textColor = CommonRedColor;
    self.prizeTitle.textColor = CommonGrayColor;
    self.dayLabel.textColor = CommonBlackColor;
    self.dayTitleLabel.textColor = CommonGrayColor;
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}

+ (CMT_BidTableViewCell *)cellWithTablebView:(UITableView *)tableView{
    static NSString *indent = @"CMT_BidTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:@"CMT_BidTableViewCell" bundle:nil] forCellReuseIdentifier:indent];
    CMT_BidTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    return cell;
}


- (void)setModel:(CMT_BidPlanModel *)model{
    [self setContent:model];
    [self.topHeadView setStrData:model.planType statusType:@"0" backProfitStr:model.planTypeDes withPlanTitle:model.planTitle homeMidTitle:model.indexDesc];
    self.myModel = model;
}

//文字的显示
- (void)setContent:(CMT_BidPlanModel *)model{
     self.prizeLabel.attributedText = [CMT_Tools HeadAttributedString:model.apr backAttributedString:@" %" NSheadForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:30 NSbackFontAttributeName:15];
    self.dayLabel.attributedText = [CMT_Tools HeadAttributedString:model.period backAttributedString:@" 天" NSheadForegroundColorAttributeName:CommonGrayColor NSbackForegroundColorAttributeName:CommonGrayColor NSheadFontAttributeName:30 NSbackFontAttributeName:15];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
