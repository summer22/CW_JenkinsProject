//
//  CMT_AssetPortfolioTableViewCell.m
//  CongMingTou
//
//  Created by kk on 16/11/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_AssetPortfolioTableViewCell.h"

@implementation CMT_AssetPortfolioTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (CMT_AssetPortfolioTableViewCell *)celldedWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath{
    static NSString *indent = @"CMT_AssetPortfolioTableViewCell";
    [tableView registerNib:[UINib nibWithNibName:indent bundle:nil] forCellReuseIdentifier:indent];
    CMT_AssetPortfolioTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:indent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   return cell;
}

- (void)setAmounMyCellModel:(CMT_AmountCodInfeModel *)myModel index:(NSIndexPath *)indexPath{
    self.titlexiaoLabel.text = [NSString stringWithFormat:@"[%@]",myModel.type];
    self.numbelCodsr.text = [NSString stringWithFormat:@"编号%@",myModel.credit_no];
    NSString *nameTre = [NSString stringWithFormat:@"%@",myModel.loanName];
    if (nameTre.length > 1) {
        self.pepleLisgd.text = [NSString stringWithFormat:@"借款人        %@**",[nameTre substringToIndex:1]];
    }
    self.listshenFen.text = [NSString stringWithFormat:@"身份证号    %@",[self replacWyCarry:myModel.loanNumber :4 :10]];
    self.meneyCodje.text = [NSString stringWithFormat:@"借款金额    %@元",myModel.amount];
    self.jiekuanTime.text = [NSString stringWithFormat:@"借款期限    %@天",myModel.period];
}
//处理字符串**
- (NSString*)replacWyCarry:(NSString*)tep :(NSInteger)lean :(NSInteger)low{
    NSString* phoneNumer = [NSString stringWithFormat:@"%@",tep];
    NSString *temp = @"";
    if (phoneNumer.length>1) {
        NSString* phOne = [phoneNumer substringFromIndex:low];
        NSString* phTwo = [phoneNumer substringToIndex:lean];
        temp = [NSString stringWithFormat:@"%@******%@",phTwo,phOne];
    }
    return temp;
}

@end
