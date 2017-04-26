//
//  CMT_MyInvestDetailTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MyInvestRecordDetailModel.h"

@interface CMT_MyInvestDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *midLabel;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomRedLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;

+ (CMT_MyInvestDetailTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;

- (void)setMyCellModel:(CMT_MyInvestRecordDetailModel *)myModel index:(NSIndexPath *)indexPath;

@end
