//
//  CMT_BidTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_BidPlanModel.h"
#import "CMT_PublicCellHeadView.h"

@interface CMT_BidTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CMT_PublicCellHeadView *topHeadView;
@property (weak, nonatomic) IBOutlet UILabel *prizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *prizeTitle;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
/** 数据源 */
@property (nonatomic,strong)CMT_BidPlanModel *myModel;

+ (CMT_BidTableViewCell *)cellWithTablebView:(UITableView *)tableView;

- (void)setModel:(CMT_BidPlanModel *)model;

@end
