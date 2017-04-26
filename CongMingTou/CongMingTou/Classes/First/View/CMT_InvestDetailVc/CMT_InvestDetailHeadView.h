//
//  CMT_InvestDetailHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMT_InvestDetailModelData;

@interface CMT_InvestDetailHeadView : UIView
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UIView *bottomtTsView;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yyTopLabel; //首投满1000元送福利金
@property (weak, nonatomic) IBOutlet UILabel *profitLabel;//收益率
@property (weak, nonatomic) IBOutlet UILabel *statInvestNumb;//起头金额
@property (weak, nonatomic) IBOutlet UILabel *period;//期限
@property (weak, nonatomic) IBOutlet UILabel *statDate;
@property (weak, nonatomic) IBOutlet UILabel *gotDate;
@property (weak, nonatomic) IBOutlet UILabel *gotAccountDate;
@property (weak, nonatomic) IBOutlet UILabel *midTsLabel;

- (void)setModel:(CMT_InvestDetailModelData *)model withType:(CMTBidPlanType)bidPlanType;
@end
