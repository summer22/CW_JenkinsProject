//
//  CMT_myInvestRecordTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_FuLiInvestRecordModel.h"
#import "CMT_NewMarkTypeView.h"
#import "CMT_MySuOrYueDataModel.h"

@interface CMT_myInvestRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIView *midView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet CMT_NewMarkTypeView *leftTopMarkView;
@property (weak, nonatomic) IBOutlet UILabel *rateY;
@property (weak, nonatomic) IBOutlet UILabel *fuLiLabel;
@property (weak, nonatomic) IBOutlet UILabel *waitProfit;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelTop;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelBottom;

@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;
+ (CMT_myInvestRecordTableViewCell *)cellWithTablebView:(UITableView *)tableView index:(NSIndexPath *)indexPath;
//我的福利金
- (void)setFuLiModel:(CMT_FuLiInvestRecordModel *)myModel;
//我的速速赚或者月月息
- (void)setMySusuOrYueYueDataModel:(CMT_MySuOrYueDataModel *)myModel type:(NSString *)typeStr;

@end
