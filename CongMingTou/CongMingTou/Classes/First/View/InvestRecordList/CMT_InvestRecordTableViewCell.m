//
//  CMT_InvestRecordTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestRecordTableViewCell.h"

@implementation CMT_InvestRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.telLabel.textColor = CommonBlackColor;
    self.moneyLabel.textColor = ThemeBlueColor;
    self.lingH.constant  = 0.5;
    self.line.backgroundColor = CommonLineColor;
}

+ (CMT_InvestRecordTableViewCell *)cellWithTablebView:(UITableView *)tableView{
    static NSString *indent = @"CMT_InvestRecordTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_InvestRecordTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setModel:(CMT_InvestRecordModel *)model{
    self.telLabel.text = model.iMobile;
    self.timeLabel.text = model.iTime;
    self.moneyLabel.text = model.iAmount;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
