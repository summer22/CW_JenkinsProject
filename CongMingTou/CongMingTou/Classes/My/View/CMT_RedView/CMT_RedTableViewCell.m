//
//  CMT_RedTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RedTableViewCell.h"

@implementation CMT_RedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = CommonBgColor;
}

+ (CMT_RedTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_RedTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_RedTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (void)setDataModel:(CMT_RedOrCouponModel *)model withType:(CMT_REDTICKITORCOUPON)diffType ticketStatusType:(CMT_TICKETSTAUE)ticketStatus{
    
    [self setBgImg:model.type withType:diffType ticketStatusType:ticketStatus];
    [self setFillContentLabel:model withType:diffType ticketStatusType:ticketStatus];
}

//文字显示
- (void)setFillContentLabel:(CMT_RedOrCouponModel *)model withType:(CMT_REDTICKITORCOUPON)diffType ticketStatusType:(CMT_TICKETSTAUE)ticketStatus{
    
    if (diffType == REDTICKIT) {
        if (ticketStatus == TOUSER) {
               self.moneyLabel.attributedText = [CMT_Tools strHeadAttributedString:@"" midAttributedString:model.rate backAttributedString:@" 元" NSheadForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSbackForegroundColorAttributeName:CommonRedColor NSheadFontAttributeName:12 NSbackFontAttributeName:30 NSbackFontAttributeName:12];
        }else{
            self.moneyLabel.attributedText = [CMT_Tools strHeadAttributedString:@"" midAttributedString:model.rate backAttributedString:@" 元" NSheadForegroundColorAttributeName:CommonGrayColor NSbackForegroundColorAttributeName:CommonGrayColor NSbackForegroundColorAttributeName:CommonGrayColor NSheadFontAttributeName:12 NSbackFontAttributeName:30 NSbackFontAttributeName:12];
        }
      
    }else{
        if (ticketStatus == TOUSER) {
            self.moneyLabel.attributedText = [CMT_Tools strHeadAttributedString:@"+" midAttributedString:model.rate backAttributedString:@" %" NSheadForegroundColorAttributeName:ThemeBlueColor NSbackForegroundColorAttributeName:ThemeBlueColor NSbackForegroundColorAttributeName:ThemeBlueColor NSheadFontAttributeName:12 NSbackFontAttributeName:30 NSbackFontAttributeName:12];
        }else{
            self.moneyLabel.attributedText = [CMT_Tools strHeadAttributedString:@"+" midAttributedString:model.rate backAttributedString:@" %" NSheadForegroundColorAttributeName:CommonGrayColor NSbackForegroundColorAttributeName:CommonGrayColor NSbackForegroundColorAttributeName:CommonGrayColor NSheadFontAttributeName:12 NSbackFontAttributeName:30 NSbackFontAttributeName:12];
        }
    }
   
    self.xJLabel.text = model.ticketName;
    self.contentLabel.text = model.details;
    self.dateLabel.text = [NSString stringWithFormat:@"有效期至%@",model.endDate];
    if (ticketStatus == TOUSER){
        self.passDateLabel.text = [NSString  stringWithFormat:@"还有%@天过期",model.expireDays];
    }else if(ticketStatus == HADUSER){
        if (diffType == REDTICKIT) {
            self.passDateLabel.text = @"已激活";
        }else{
            self.passDateLabel.text = @"已使用";
        }
    }else{
        self.passDateLabel.text = @"已过期";
    }
    if (ticketStatus == TOUSER) {
        self.passDateLabel.textColor = CommonRedColor;
        self.xJLabel.textColor = CommonBlackColor;
        self.contentLabel.textColor = CommonBlackColor;
    }else{
        self.passDateLabel.textColor = CommonGrayColor;
        self.xJLabel.textColor = CommonGrayColor;
        self.contentLabel.textColor = CommonGrayColor;
    }
}

//背景图片
- (void)setBgImg:(NSString *)type withType:(CMT_REDTICKITORCOUPON)diffType ticketStatusType:(CMT_TICKETSTAUE)ticketStatus{
    if (diffType == REDTICKIT) {
        if (ticketStatus == TOUSER) {
            self.bgImgV.image = [UIImage imageNamed:@"CMT_RedNoActive"];
        }else if(ticketStatus == HADUSER){
            self.bgImgV.image = [UIImage imageNamed:@"CMT_RedHadActive"];
        }else{
            self.bgImgV.image = [UIImage imageNamed:@"CMT_TicketPass"];
        }
    }else{
        if (ticketStatus == TOUSER) {
            self.bgImgV.image = [UIImage imageNamed:@"CMT_CouPonAvaliable"];
        }else if(ticketStatus == HADUSER){
            self.bgImgV.image = [UIImage imageNamed:@"CMT_CouPonHadUse"];
        }else{
            self.bgImgV.image = [UIImage imageNamed:@"CMT_TicketPass"];
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
