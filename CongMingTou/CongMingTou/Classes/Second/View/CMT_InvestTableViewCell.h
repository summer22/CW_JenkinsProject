//
//  CMT_InvestTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/12/13.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_InvestTableViewCell : UITableViewCell
+ (CMT_InvestTableViewCell *)cellWithTablebView:(UITableView *)tableView withIndex:(NSIndexPath *)index;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;
@property (weak, nonatomic) IBOutlet UILabel *period;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
- (void)setModel:(CMT_BidPlanModel *)model;
@end
