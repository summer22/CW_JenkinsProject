//
//  CMT_InvestTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/12/13.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestTableViewCell.h"

@implementation CMT_InvestTableViewCell

+ (CMT_InvestTableViewCell *)cellWithTablebView:(UITableView *)tableView withIndex:(NSIndexPath *)index{
    static NSString *indent = @"CMT_InvestTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:@"CMT_InvestTableViewCell" bundle:nil] forCellReuseIdentifier:indent];
    CMT_InvestTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    if (index.row == 0) {
        cell.line.hidden = YES;
    }else{
        cell.line.hidden = NO;
    }
    return cell;
}

- (void)setModel:(CMT_BidPlanModel *)model{
    [self setContent:model];
}

//文字的显示
- (void)setContent:(CMT_BidPlanModel *)model{
    self.rateLabel.attributedText = [CMT_Tools HeadAttributedString:model.apr backAttributedString:@" %" NSheadForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:30 NSbackFontAttributeName:15];
    self.period.attributedText = [CMT_Tools HeadAttributedString:model.period backAttributedString:@" 天" NSheadForegroundColorAttributeName:CommonGrayColor NSbackForegroundColorAttributeName:CommonGrayColor NSheadFontAttributeName:30 NSbackFontAttributeName:15];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
