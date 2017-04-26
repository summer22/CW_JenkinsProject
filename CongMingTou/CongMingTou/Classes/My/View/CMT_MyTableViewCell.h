//
//  CMT_MyTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MyModel.h"

@interface CMT_MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyCount;
@property (weak, nonatomic) IBOutlet UILabel *expectLabel;
@property (weak, nonatomic) IBOutlet UILabel *midLabel;
/** 数据源 */
@property (nonatomic,strong)CMT_MyModel *myModel;

+ (CMT_MyTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;

- (void)setModel:(CMT_MyModel *)model index:(NSIndexPath *)indexPath;

@end
