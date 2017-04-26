//
//  CMT_RealNameBindCardResultViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_RealNameBindCardResultViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idCardLabel;
@property (weak, nonatomic) IBOutlet UIView *topLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLineH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineH;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
/** name */
@property (nonatomic,copy)NSString *nameStr;
/** 身份证号 */
@property (nonatomic,copy)NSString *cardNumStr;
/** 枚举类型*/
@property (nonatomic,assign)CMTEnterRealNameShareResultType fromType;

@end
