//
//  CMT_InRecordTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_FuLJInIncomeRecordModel.h"

@interface CMT_InRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyNumb;
+ (CMT_InRecordTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;

- (void)setMyModel:(CMT_FuLJInIncomeRecordModel *)model;

@end
