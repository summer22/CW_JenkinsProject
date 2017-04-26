//
//  CMT_RedTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_RedOrCouponModel.h"

@interface CMT_RedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bgImgV;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *xJLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *passDateLabel;
+ (CMT_RedTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;

- (void)setDataModel:(CMT_RedOrCouponModel *)model withType:(CMT_REDTICKITORCOUPON)diffType ticketStatusType:(CMT_TICKETSTAUE)ticketStatus;

@end
