//
//  CMT_GetMoneyPlanHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_GetMyMoneyPlanModel.h"

@interface CMT_GetMoneyPlanHeadView : UIView
@property (weak, nonatomic) IBOutlet UILabel *waitGetProfit;
@property (weak, nonatomic) IBOutlet UILabel *gotProfit;
@property (strong, nonatomic) IBOutlet UIView *MyView;

- (void)setMyModel:(CMT_GetMyMoneyPlanModel *)myModel;

@end
