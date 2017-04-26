//
//  CMT_InvestmentPreCell.h
//  CongMingTou
//
//  Created by wzh on 16/7/6.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_InvestmentPreBankListModel.h"
@interface CMT_InvestmentPreCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *bankLogoImageView;
@property (strong, nonatomic) IBOutlet UILabel *bankNameLab;
@property (strong, nonatomic) IBOutlet UILabel *bankDesLab;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lineViewH;
@property (strong, nonatomic) IBOutlet UIView *lineView;

@property (nonatomic, strong) CMT_InvestmentPreBankListModel *model;
+ (CMT_InvestmentPreCell *)cellWithTablebView:(UITableView *)tableView;

@end
