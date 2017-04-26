//
//  CMT_InvestmentPreCell.m
//  CongMingTou
//
//  Created by wzh on 16/7/6.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestmentPreCell.h"

@implementation CMT_InvestmentPreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_bankLogoImageView styleWithCornerRadius:_bankLogoImageView.width / 2];
    _bankLogoImageView.clipsToBounds = YES;
    // Initialization code
}
+ (CMT_InvestmentPreCell *)cellWithTablebView:(UITableView *)tableView{
    static NSString *indent = @"CMT_InvestmentPreCell";
    [tableView registerNib:[UINib nibWithNibName:@"CMT_InvestmentPreCell" bundle:nil] forCellReuseIdentifier:indent];
    CMT_InvestmentPreCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-  (void)setModel:(CMT_InvestmentPreBankListModel *)model{
    _model = model;
    [self.bankLogoImageView sd_setImageWithURL:[NSURL URLWithString:_model.logo] placeholderImage:[UIImage imageNamed:@"default_image"]];
    self.bankNameLab.text = [NSString stringWithFormat:@"%@",_model.bankName];
    self.bankDesLab.text = [NSString stringWithFormat:@"单笔限额：%@   单日限额：%@",_model.onePen,_model.oneDay];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _lineViewH.constant = 0.5;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
