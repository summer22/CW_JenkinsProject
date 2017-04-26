//
//  CMT_DealRecordTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_DealRecordTableViewCell.h"

@implementation CMT_DealRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
}
+ (CMT_DealRecordTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_DealRecordTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_DealRecordTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.line.hidden = YES;
    }else{
        cell.line.hidden = NO;
    }
    return cell;
}

- (void)setMyModel:(CMT_DealRecordModel *)myModel withType:(NSString *)diffType{
   
    if ([diffType isEqualToString:@"1"]) {
        self.userInteractionEnabled = YES;
    }else if([diffType isEqualToString:@"2"]){
        self.userInteractionEnabled = YES;
    }else if([diffType isEqualToString:@"3"]){
        self.userInteractionEnabled = NO;
    }else if([diffType isEqualToString:@"4"]){
        self.userInteractionEnabled = YES;
    }else if([diffType isEqualToString:@"5"]){
        self.userInteractionEnabled = NO;
    }else{
        self.userInteractionEnabled = YES;
    }
    
    self.typeLabel.text = myModel.myDescription;
    self.dateLabel.text = myModel.recordTime;
    self.moneyLabel.text = myModel.amount;
    if (myModel.stateFlag) {
        if ([myModel.stateFlag isEqualToString:@"1"]) {
            self.moneyLabel.textColor = ThemeBlueColor;
        }else{
            self.moneyLabel.textColor = CommonBlackColor;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
