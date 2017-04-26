//
//  CMT_InvestDetailTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestDetailTableViewCell.h"

@implementation CMT_InvestDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    self.titleLabel.textColor = CommonBlackColor;
    self.investPeoCount.textColor = CommonRedColor;
}

+ (CMT_InvestDetailTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    
    static NSString *indent = @"CMT_InvestDetailTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_InvestDetailTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 4) {
        cell.line.hidden = YES;
    }
    if (indexPath.row != 0) {
        cell.investPeoCount.hidden = YES;
    }else{
        cell.investPeoCount.hidden = YES;
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
