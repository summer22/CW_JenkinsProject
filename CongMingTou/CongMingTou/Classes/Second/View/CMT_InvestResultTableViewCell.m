//
//  CMT_InvestResultTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/10/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestResultTableViewCell.h"

@implementation CMT_InvestResultTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (CMT_InvestResultTableViewCell *)cellWithTablebView:(UITableView *)tableView indexPath:(NSIndexPath *)index{
    static NSString *indent = @"CMT_InvestResultTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:@"CMT_InvestResultTableViewCell" bundle:nil] forCellReuseIdentifier:indent];
    CMT_InvestResultTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (index.row == 0) {
        cell.secondLabel.hidden = NO;
    }else{
        cell.secondLabel.hidden = YES;
    }
    return cell;
}

- (void)setModel:(CMT_ResultModel *)model index:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        if (model.event.length > 0) {
            self.contentLabel.attributedText = [CMT_Tools highlightText:model.event][0];
            self.secondLabel.attributedText = [CMT_Tools highlightText:model.event][1];
        }
    }else{
        self.contentLabel.text = model.event;
    }
    if (indexPath.row == 0) {
        self.timeLabel.text = [model.time stringByAppendingString:@"(今日)"];
    }else{
        self.timeLabel.text = model.time;
    }
    if (0 == indexPath.row) {
        self.blueLine.hidden = NO;
        self.timeLabel.textColor = ThemeBlueColor;
        self.blueLineH.constant = self.height/2 + 10;
    }else{
        self.blueLine.hidden = YES;
        self.timeLabel.textColor = CommonGrayColor;
    }
    
    if (0 == indexPath.row) {
        self.stepImg.image = [UIImage imageNamed:@"CMT_timeStepOne"];
    }else if (1 == indexPath.row){
        self.stepImg.image = [UIImage imageNamed:@"CMT_timeStepTwo"];
    }else if (2 == indexPath.row){
        self.stepImg.image = [UIImage imageNamed:@"CMT_timeStepThree"];
    }else if (3 == indexPath.row){
        self.stepImg.image = [UIImage imageNamed:@"CMT_timeStepFour"];
        self.grayLine.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
