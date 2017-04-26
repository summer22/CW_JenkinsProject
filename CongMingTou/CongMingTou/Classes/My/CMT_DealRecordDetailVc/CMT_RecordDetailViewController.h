//
//  CMT_RecordDetailViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_DealRecordModel.H"

typedef NS_ENUM(NSInteger, CMT_MYTYPEDIFF) {
    //充值类型
    RECHARGETYPE = 0,
    //提现类型
    REFLECTTYPE = 1,
    //投资类型
    INVESTTYPE 

};

@interface CMT_RecordDetailViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *dealMoneyNumb;
@property (weak, nonatomic) IBOutlet UIButton *stateBtn;
@property (weak, nonatomic) IBOutlet UILabel *orderNumb;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (nonatomic,assign)CMT_MYTYPEDIFF myDiffType;
@property (nonatomic,strong)CMT_DealRecordModel *sendModel;
@end
