//
//  CMT_MySusuHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MySuOrYueModel.h"

@interface CMT_MySusuHeadView : UIView
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *waitProfit;
@property (weak, nonatomic) IBOutlet UILabel *totalProfit;
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;

- (void)setHeadModelData:(CMT_MySuOrYueModel *)myModel withType:(NSString *)typeStr;
@end
