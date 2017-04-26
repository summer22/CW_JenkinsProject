//
//  CMT_AccountSafeTableViewCell.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_AccountSafeTableViewCell.h"
#import "CMT_FingerprintManagerModel.h"

@implementation CMT_AccountSafeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    
}

+ (CMT_AccountSafeTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath withModel:(CMT_AccountSafeModel *)model{
    static NSString *indent = @"CMT_AccountSafeTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_AccountSafeTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        
        [cell cellSubViewState:YES viewCell:cell];

        if (indexPath.row == 0) {
            cell.iconImg.image = [UIImage imageNamed:@"CMT_AccountSafe_Tel"];
            cell.titleLabel.text = @"登录手机号";
            cell.rightLable.text = model.phone;
            cell.jianimgW.constant = 0;
            cell.jianImgL.constant = 0;
        }else if(indexPath.row == 1){
            cell.titleLabel.text = @"姓名";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_AccountSafe_Name"];
            if ([[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
                cell.rightLable.text = [CMT_Tools replaceNameWithStar:model.realName];
                cell.jianimgW.constant = 0;
                cell.jianImgL.constant = 0;
            }else{
                cell.rightLable.text = @"去实名";
                cell.jianImg.hidden = NO;
            }
        }else{
            cell.titleLabel.text = @"我的银行卡";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_AccountSafe_BankCard"];
            cell.rightLable.text = model.bankInfo;
            cell.line.hidden = YES;
        }
    }else if(indexPath.section == 1){
        
        [cell cellSubViewState:YES viewCell:cell];

        if (indexPath.row == 0) {
            cell.titleLabel.text = @"登录密码";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_AccountSafe_LoginPw"];
            cell.rightLable.text = model.loginpwd;
        }else if(indexPath.row == 1){
            cell.titleLabel.text = @"交易密码";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_AccountSafe_DealPw"];
            cell.rightLable.text = model.paypwd;
        }else if(indexPath.row == 2){
            cell.titleLabel.text = @"手势密码";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_AccountSafe_GesPw"];
            cell.rightLable.text = [CMT_GesturesPasswordTool gesturesPwdModel] != nil ? @"修改":@"设置";
        }else if(indexPath.row == 3){
            cell.titleLabel.text = @"指纹解锁/支付";
            cell.iconImg.image = [UIImage imageNamed:@"CMT_AccountSafe_FigSetting"];
            cell.rightLable.text = @"设置";
            cell.line.hidden = YES;
        }
    }else if(indexPath.section == 2){
        [cell cellSubViewState:YES viewCell:cell];
        cell.titleLabel.text = @"当前版本";
        cell.iconImg.image = [UIImage imageNamed:@"CMT_AccountSafe_Version"];
        cell.rightLable.text = [NSString stringWithFormat:@"v%@",[CMT_Tools getShortVersion]];
        cell.line.hidden = YES;
        cell.jianimgW.constant = 0;
        cell.jianImgL.constant = 0;
        [cell cellSubViewState:YES viewCell:cell];
    }else if(indexPath.section == 3){
        cell.line.hidden = YES;
        cell.jianImg.hidden = YES;
        [cell cellSubViewState:NO viewCell:cell];
    }
    return cell;
}

- (void)cellSubViewState:(BOOL)status viewCell:(CMT_AccountSafeTableViewCell *)cell{
        cell.iconImg.hidden = !status;
        cell.titleLabel.hidden = !status;
        cell.rightLable.hidden = !status;
        cell.midLable.hidden = status;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
