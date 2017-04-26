//
//  CMT_HowGetFuliJinTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_HowGetFuliJinTableViewCell.h"

@implementation CMT_HowGetFuliJinTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;

}

+ (CMT_HowGetFuliJinTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_HowGetFuliJinTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_HowGetFuliJinTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.line.hidden = YES;
    }
       return cell;
}

- (void)setMyModel:(CMT_HowToGetFLJModel *)myModel index:(NSIndexPath *)indexPath{
    self.index = indexPath.row;
    self.titleLabel.text = myModel.taskName;
    self.contentLabel.text = myModel.taskDesc;
    if ([myModel.taskStaus isEqualToString:@"0"]) {
        [self.myBtn setTitle:@"已完成" forState:UIControlStateNormal];
        [self.myBtn setBackgroundImage:[UIImage imageNamed:@"CMT_Qiang_Selected"] forState:UIControlStateNormal];
        self.myBtn.userInteractionEnabled = NO;
    }else{
        [self.myBtn setTitle:@"去完成" forState:UIControlStateNormal];
        [self.myBtn setBackgroundImage:[UIImage imageNamed:@"CMT_Qiang_Normal"] forState:UIControlStateNormal];
        self.myBtn.userInteractionEnabled = YES;
    }

}
- (IBAction)btnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toFinishBtnClick:)]) {
        [self.delegate toFinishBtnClick:self.index];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
