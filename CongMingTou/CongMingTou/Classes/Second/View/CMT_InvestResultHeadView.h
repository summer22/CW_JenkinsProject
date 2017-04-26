//
//  CMT_InvestResultHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/10/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_ToInvestModel.h"

@interface CMT_InvestResultHeadView : UIView
@property (strong, nonatomic) IBOutlet UIView *moneyNumb;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

- (void)setModel:(CMT_ToInvestModel *)model;

@end
