//
//  CMT_AccountSafeTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_AccountSafeModel.h"

@interface CMT_AccountSafeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *midLable;
@property (weak, nonatomic) IBOutlet UILabel *rightLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jianimgW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jianImgL;
@property (weak, nonatomic) IBOutlet UIImageView *jianImg;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
+ (CMT_AccountSafeTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath withModel:(CMT_AccountSafeModel *)model;

@end
