//
//  CMT_CalculatorViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "TXHRrettyRuler.h"
#import "AKPickerView.h"

@interface CMT_CalculatorViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *xuLabel;
@property (weak, nonatomic) IBOutlet UIView *rulerBgView;
@property (weak, nonatomic) IBOutlet AKPickerView *akPicker;
@property (weak, nonatomic) IBOutlet UILabel *expectNumb;
@property (weak, nonatomic) IBOutlet UITextField *myTF;
/** period */
@property (nonatomic,copy)NSString *selectPeriod;
/** 类型识别*/
@property (nonatomic,assign)CMTBidPlanType bidPlanType;

@end
