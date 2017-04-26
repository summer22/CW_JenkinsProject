//
//  CMT_AssetPortfolioTableViewCell.h
//  CongMingTou
//
//  Created by kk on 16/11/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_AssetPortfolioTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titlexiaoLabel;//消费贷款
@property (weak, nonatomic) IBOutlet UILabel *numbelCodsr;//编号
@property (weak, nonatomic) IBOutlet UILabel *pepleLisgd;//借款人
@property (weak, nonatomic) IBOutlet UILabel *listshenFen;//身份证
@property (weak, nonatomic) IBOutlet UILabel *meneyCodje;//借款金额
@property (weak, nonatomic) IBOutlet UILabel *jiekuanTime;//借款期限
+ (CMT_AssetPortfolioTableViewCell *)celldedWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;
- (void)setAmounMyCellModel:(CMT_AmountCodInfeModel *)myModel index:(NSIndexPath *)indexPath;

@end
