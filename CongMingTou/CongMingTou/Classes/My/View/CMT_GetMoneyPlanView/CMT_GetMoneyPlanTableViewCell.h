//
//  CMT_GetMoneyPlanTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_GetMoneyPlanModel.h"

@interface CMT_GetMoneyPlanTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *moenyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *numbLabel;
+ (CMT_GetMoneyPlanTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;

- (void)setMyModel:(CMT_GetMoneyPlanModel *)myModel;

@end
