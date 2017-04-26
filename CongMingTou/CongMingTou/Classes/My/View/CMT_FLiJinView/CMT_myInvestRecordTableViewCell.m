//
//  CMT_myInvestRecordTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_myInvestRecordTableViewCell.h"

@implementation CMT_myInvestRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    self.midView.hidden = YES;
}

+ (CMT_myInvestRecordTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_myInvestRecordTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_myInvestRecordTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)setFuLiModel:(CMT_FuLiInvestRecordModel *)myModel{

    self.rateY.attributedText = [CMT_Tools HeadAttributedString:myModel.totalApr backAttributedString:@" %" NSheadForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:30 NSbackFontAttributeName:15];
    self.dateTimeLabel.text = [NSString stringWithFormat:@"到期时间：%@",myModel.receiveTime];
    self.fuLiLabel.text = myModel.welfareAmount;
    self.waitProfit.text = myModel.planIncome;
    self.leftTopMarkView.markTypeLabel.text = myModel.financialPlanName;
    if ([myModel.planType isEqualToString:@"0"]) {
        self.leftTopMarkView.markTypeImg.image = [UIImage imageNamed:@"CMT_Xin"];
    }else if([myModel.planType isEqualToString:@"1"] ){
        self.leftTopMarkView.markTypeImg.image = [UIImage imageNamed:@"CMT_Su"];
    }else{
        self.leftTopMarkView.markTypeImg.image = [UIImage imageNamed:@"CMT_Yue"];
    }
}

- (void)setMySusuOrYueYueDataModel:(CMT_MySuOrYueDataModel *)myModel type:(NSString *)typeStr{
    
    self.fuLiLabel.text = myModel.investAmountBalance;
    self.waitProfit.text = myModel.planIncomeOrAlreadyIncome;
    if ([typeStr isEqualToString:@"1"]) {
        self.dateTimeLabel.text = [NSString stringWithFormat:@"到期时间：%@",myModel.stateDescriptionOrEndDate];
        self.dateTimeLabel.textColor = CommonGrayColor;
        self.titleLabelTop.text = @"待收本金(元)";
        self.titleLabelBottom.text = @"待获收益(元)";
        self.fuLiLabel.textColor = CommonRedColor;
        self.waitProfit.textColor = CommonRedColor;
         self.rateY.attributedText = [CMT_Tools HeadAttributedString:myModel.totalApr backAttributedString:@" %" NSheadForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:30 NSbackFontAttributeName:15];
    }else{
        self.dateTimeLabel.text = myModel.stateDescriptionOrEndDate;
        self.dateTimeLabel.textColor = CommonRedColor;
        self.titleLabelTop.text = @"投资金额(元)";
        self.titleLabelBottom.text = @"获得收益(元)";
        self.fuLiLabel.textColor = CommonBlackColor;
        self.waitProfit.textColor = CommonBlackColor;
         self.rateY.attributedText = [CMT_Tools HeadAttributedString:myModel.totalApr backAttributedString:@" %" NSheadForegroundColorAttributeName:CommonBlackColor NSbackForegroundColorAttributeName:CommonBlackColor NSheadFontAttributeName:30 NSbackFontAttributeName:15];
    }
  
    self.leftTopMarkView.markTypeLabel.text = myModel.financialPlanName;
    if ([myModel.planType isEqualToString:@"0"]) {
        self.leftTopMarkView.markTypeImg.image = [UIImage imageNamed:@"CMT_Xin"];
    }else if([myModel.planType isEqualToString:@"1"] ){
        self.leftTopMarkView.markTypeImg.image = [UIImage imageNamed:@"CMT_Su"];
    }else{
        self.leftTopMarkView.markTypeImg.image = [UIImage imageNamed:@"CMT_Yue"];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
