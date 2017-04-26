//
//  CMT_InvestRecordTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_InvestRecordModel.h"

@interface CMT_InvestRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lingH;

+ (CMT_InvestRecordTableViewCell *)cellWithTablebView:(UITableView *)tableView;

- (void)setModel:(CMT_InvestRecordModel *)model;

@end
