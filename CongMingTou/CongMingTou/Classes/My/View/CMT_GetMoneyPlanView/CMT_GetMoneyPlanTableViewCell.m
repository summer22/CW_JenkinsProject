//
//  CMT_GetMoneyPlanTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GetMoneyPlanTableViewCell.h"

@implementation CMT_GetMoneyPlanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineH.constant = 0.5;
    self.line.backgroundColor = CommonLineColor;
}

+ (CMT_GetMoneyPlanTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_GetMoneyPlanTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_GetMoneyPlanTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        cell.line.hidden = YES;
    }else{
        cell.line.hidden = NO;
    }
    return cell;
}
- (void)setMyModel:(CMT_GetMoneyPlanModel *)myModel{
    self.moenyLabel.text = myModel.amount;
    if ([myModel.state isEqualToString:@"1"]) {
        self.dateLabel.textColor = CommonGrayColor;
    }else{
        self.dateLabel.textColor = ThemeBlueColor;
    }
    self.dateLabel.text = myModel.timeAndDes;
    self.numbLabel.text = myModel.index;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
