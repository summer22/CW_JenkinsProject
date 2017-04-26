

//
//  CMT_MyInvestDetailTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyInvestDetailTableViewCell.h"

@implementation CMT_MyInvestDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    
}

+ (CMT_MyInvestDetailTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_MyInvestDetailTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_MyInvestDetailTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 3) {
        cell.line.hidden = YES;
    }
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"成功投资";
        [cell cellSubViewState:YES allHide:NO viewCell:cell];
    }else if(indexPath.row == 1){
        cell.titleLabel.text = @"开始计息";
        [cell cellSubViewState:NO allHide:NO viewCell:cell];
    }else if(indexPath.row == 2){
        cell.titleLabel.text = @"投资到期";
        [cell cellSubViewState:YES allHide:YES viewCell:cell];
    }else {
        cell.titleLabel.text = @"资金到账";
        [cell cellSubViewState:NO allHide:NO viewCell:cell];
    }
    return cell;
}

- (void)cellSubViewState:(BOOL)status allHide:(BOOL)allStatus viewCell:(CMT_MyInvestDetailTableViewCell *)cell{
    if (allStatus == NO) {
        cell.midLabel.hidden = status;
        cell.topLabel.hidden = !status;
        cell.bottomRedLabel.hidden = !status;
    }else{
        cell.midLabel.hidden = allStatus;
        cell.topLabel.hidden = allStatus;
        cell.bottomRedLabel.hidden = allStatus;
    }
}

- (void)setMyCellModel:(CMT_MyInvestRecordDetailModel *)myModel index:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        self.dateLabel.text = myModel.oneDate;
        self.topLabel.text = myModel.oneTotalAmount;
        self.bottomRedLabel.text = myModel.oneWelfareAmount;
        self.bottomRedLabel.textColor = CommonRedColor;
    }else if(indexPath.row == 1){
        self.dateLabel.text =  myModel.twoDate;
        if (myModel.twoTotalApr.length > 0) {
            NSString *addRateStr = myModel.twoAprDetail.length > 0 ?  myModel.twoAprDetail : @"";
             self.midLabel.attributedText = [CMT_Tools HeadAttributedString:myModel.twoTotalApr backAttributedString:addRateStr NSheadForegroundColorAttributeName:CommonBlackColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:14 NSbackFontAttributeName:14];
        }
    }else if(indexPath.row == 2){
        self.dateLabel.text =  myModel.threeDate;
    }else {
        self.dateLabel.text =  myModel.fourDate;
        self.midLabel.text = myModel.fourBalanceAndInterest;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
