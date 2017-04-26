//
//  CMT_RealNameBindCardViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_GetYzNumbView.h"
#import "CMT_TextField.h"

@interface CMT_RealNameBindCardViewController : CMT_BaseVIewController
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet UIView *oneLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *onelIneH;
@property (weak, nonatomic) IBOutlet CMT_TextField *bankNumbTF;
@property (weak, nonatomic) IBOutlet CMT_TextField *nameTF;
@property (weak, nonatomic) IBOutlet UIView *twoLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet CMT_TextField *idCardTF;
@property (weak, nonatomic) IBOutlet CMT_TextField *telTF;
@property (weak, nonatomic) IBOutlet UIView *threeLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *threeLineH;
@property (weak, nonatomic) IBOutlet CMT_GetYzNumbView *yzNumbView;
@property (weak, nonatomic) IBOutlet UIButton *makeSureBtn;
@property (weak, nonatomic) IBOutlet UIButton *AgreementBtn;
@property (weak, nonatomic) IBOutlet UIButton *toAgreementBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectBankTypeBtn;
/** bankId */
@property (nonatomic,copy)NSString *bankId;
/** 枚举类型*/
@property (nonatomic,assign)CMTEnterRealNameShareResultType fromType;
@end
