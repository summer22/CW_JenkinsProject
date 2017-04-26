//
//  CMT_RecordWattingView.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_RecordWattingView : UIView
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *statTime;
@property (weak, nonatomic) IBOutlet UILabel *dealType;
@property (weak, nonatomic) IBOutlet UILabel *restMoney;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;

- (void)setMyModel:(CMT_DealRecordDetailModel *)myModel;

@end
