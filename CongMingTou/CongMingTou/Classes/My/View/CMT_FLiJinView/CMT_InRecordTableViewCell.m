//
//  CMT_InRecordTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InRecordTableViewCell.h"

@implementation CMT_InRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}

+ (CMT_InRecordTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_InRecordTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_InRecordTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.line.hidden = YES;
    }else{
        cell.line.hidden = NO;
    }
    return cell;
}

- (void)setMyModel:(CMT_FuLJInIncomeRecordModel *)model{
    self.titleLabel.text = model.operation;
    self.dateLabel.text = model.time;
    self.moneyNumb.text = model.amount;
    if ([model.state isEqualToString:@"1"]) {
        self.moneyNumb.textColor = CommonRedColor;
    }else{
        self.moneyNumb.textColor = CommonBlackColor;
    }
}

@end
