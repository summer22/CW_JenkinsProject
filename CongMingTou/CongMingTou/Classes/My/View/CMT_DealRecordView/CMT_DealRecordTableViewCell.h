//
//  CMT_DealRecordTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_DealRecordModel.h"

@interface CMT_DealRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

+ (CMT_DealRecordTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;

- (void)setMyModel:(CMT_DealRecordModel *)myModel withType:(NSString *)diffType;

@end
