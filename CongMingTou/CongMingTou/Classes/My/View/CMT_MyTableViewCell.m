//
//  CMT_MyTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyTableViewCell.h"

@implementation CMT_MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}

+ (CMT_MyTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_MyTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_MyTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 2) {
        cell.line.hidden = YES;
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.iconImg.image = [UIImage imageNamed:@"CMT_My_Income"];
            cell.titleLabel.text = @"累计收益";
            [cell cellSubViewState:NO allHide:NO viewCell:cell];
        }else if(indexPath.row == 1){
            cell.titleLabel.text = @"我的速速赚";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_My_Susu"];
            [cell cellSubViewState:YES allHide:NO viewCell:cell];
        }else{
            cell.titleLabel.text = @"我的月月息";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_My_Yy"];
            [cell cellSubViewState:YES allHide:NO viewCell:cell];
        }
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"福利金";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_My_Fl"];
            [cell cellSubViewState:NO allHide:NO viewCell:cell];
        }else if(indexPath.row == 1){
            cell.titleLabel.text = @"加息券";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_My_Coupon"];
            [cell cellSubViewState:NO allHide:NO viewCell:cell];
        }else{
            cell.titleLabel.text = @"红包";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_My_Red"];
            [cell cellSubViewState:NO allHide:YES viewCell:cell];
        }
    }else if(indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"交易记录";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_My_Record"];
            [cell cellSubViewState:YES allHide:YES viewCell:cell];
            cell.line.hidden = YES;
        }
    }

    return cell;
}

- (void)cellSubViewState:(BOOL)status allHide:(BOOL)allStatus viewCell:(CMT_MyTableViewCell *)cell{
    if (allStatus == NO) {
        cell.midLabel.hidden = status;
        cell.moneyCount.hidden = !status;
        cell.expectLabel.hidden = !status;
    }else{
        cell.midLabel.hidden = allStatus;
        cell.moneyCount.hidden = allStatus;
        cell.expectLabel.hidden = allStatus;
    }
  }

- (void)setModel:(CMT_MyModel *)model index:(NSIndexPath *)indexPath{
    self.myModel = model;
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                //累计收益
                self.midLabel.text = self.myModel.alreadyincome;
            }else if (indexPath.row == 1){
                NSString *oneStr =  self.myModel.planincomeOnce.length > 0 ? self.myModel.planincomeOnce : @"0.00";
                //我的速速赚
                self.moneyCount.text = self.myModel.financialAssetsOnce.length > 0 ? self.myModel.financialAssetsOnce : @"0.00";
                self.expectLabel.text = [NSString stringWithFormat:@"预期收益%@",oneStr];
            }else if (indexPath.row == 2){
                NSString *yueStr =  self.myModel.planincomeMonth.length > 0 ? self.myModel.planincomeMonth : @"0.00";
//                我的月月息
                self.moneyCount.text = self.myModel.financialAssetsMonth.length > 0 ? self.myModel.financialAssetsMonth : @"0.00";
                self.expectLabel.text = [NSString stringWithFormat:@"预期收益%@",yueStr];
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                self.midLabel.text =  self.myModel.countJX.length > 0 ? self.myModel.fringeBenefit : @"0.00";
            }else if (indexPath.row == 1){
                //加息券
                NSString *countStr =  self.myModel.countJX.length > 0 ? self.myModel.countJX : @"0";
                self.midLabel.text = [NSString stringWithFormat:@"%@张可用",countStr];
            }
            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
