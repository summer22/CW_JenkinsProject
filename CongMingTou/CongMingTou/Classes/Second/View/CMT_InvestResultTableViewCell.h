//
//  CMT_InvestResultTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/10/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_ResultModel.h"

@interface CMT_InvestResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *stepImg;
@property (weak, nonatomic) IBOutlet UIView *grayLine;
@property (weak, nonatomic) IBOutlet UIView *blueLine;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *blueLineH;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

+ (CMT_InvestResultTableViewCell *)cellWithTablebView:(UITableView *)tableView indexPath:(NSIndexPath *)index;

- (void)setModel:(CMT_ResultModel *)model index:(NSIndexPath *)indexPath;

@end
