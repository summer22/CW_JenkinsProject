//
//  CMT_MyFuLiJinInvestDetailView.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MyInvestRecordDetailModel.h"

@interface CMT_MyFuLiJinInvestDetailView : UIView
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *numbLabel;

- (void)setMyModel:(CMT_MyInvestRecordDetailModel *)myModel;

@end
