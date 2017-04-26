//
//  CMT_RecordFailOrSuccessView.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_RecordFailOrSuccessView : UIView
@property (strong, nonatomic) IBOutlet UIView *MyVIew;
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *dealType;
@property (weak, nonatomic) IBOutlet UIView *lineTwo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineTwoH;
@property (weak, nonatomic) IBOutlet UILabel *serviceFee;
@property (weak, nonatomic) IBOutlet UIView *threeLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *threeLineH;
@property (weak, nonatomic) IBOutlet UILabel *restMoney;

- (void)setMyModel:(CMT_DealRecordDetailModel *)myModel;

@end
