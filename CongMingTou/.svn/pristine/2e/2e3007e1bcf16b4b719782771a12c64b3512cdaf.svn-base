//
//  CMT_BankListViewController.h
//  CongMingTou
//
//  Created by wzh on 16/7/6.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_InvestmentPreBankListModel.h"

/**
 *  进入银行列表类型
 */
typedef NS_ENUM(NSInteger, CMTEnterBankListType) {
    /**
     *  查看支持银行卡列表
     */
    CMTEnterBankListTypeLook = 0,
    /**
     *  选择银行卡
     */
    CMTEnterBankListTypeChoose
};

@interface CMT_BankListViewController : CMT_BaseVIewController

@property  (nonatomic, assign) CMTEnterBankListType enterBankListType;
@property (nonatomic, copy) void(^bankInforBlock)(CMT_InvestmentPreBankListModel * model);

@end
