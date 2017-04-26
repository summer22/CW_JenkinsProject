//
//  CMT_RecordDetailViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RecordDetailViewController.h"
#import "CMT_RecordWattingView.h"
#import "CMT_RecordFailOrSuccessView.h"

@interface CMT_RecordDetailViewController ()
/** 正在处理中底部视图 */
@property (nonatomic,strong)CMT_RecordWattingView *deallingBottomView;
/** 失败或者成功底部视图 */
@property (nonatomic,strong)CMT_RecordFailOrSuccessView *failOrSuccessBottomView;
@end

@implementation CMT_RecordDetailViewController

-(CMT_RecordWattingView *)deallingBottomView{
    if (!_deallingBottomView) {
        _deallingBottomView = [[CMT_RecordWattingView alloc] initWithFrame:CGRectMake(0, self.bottomView.bottom, CMT_ScreenWidth, 122)];
        _deallingBottomView.hidden = YES;
    }
    return  _deallingBottomView;
}

-(CMT_RecordFailOrSuccessView *)failOrSuccessBottomView{
    if (!_failOrSuccessBottomView) {
        _failOrSuccessBottomView = [[CMT_RecordFailOrSuccessView alloc] initWithFrame:CGRectMake(0, self.bottomView.bottom, CMT_ScreenWidth, 208)];
        _failOrSuccessBottomView.hidden = YES;
    }
    return  _failOrSuccessBottomView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.myDiffType == RECHARGETYPE) {
        [self rechargeLoadData];
    }else if(self.myDiffType == INVESTTYPE){
        [self investLoadData];
    }else{
        [self reflectLoadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"记录详情";
    [self.bgView addSubview:self.failOrSuccessBottomView];
    [self.bgView addSubview:self.deallingBottomView];
}

- (void)viewDidLayoutSubviews{
    [self.bgScrollView addSubview:self.bgView];
    self.bgScrollView.showsVerticalScrollIndicator = NO;
    self.bgScrollView.frame  =CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - 64);
    self.bgView.frame = CGRectMake(0, 0, CMT_ScreenWidth, 550);
    self.bgScrollView.contentSize = CGSizeMake(CMT_ScreenWidth,CGRectGetMaxY(self.bgView.frame));
}

#pragma mark - 处理数据逻辑
- (void)dealData:(CMT_DealRecordDetailModel *)myModel{
    
    self.dealMoneyNumb.text = myModel.amount;
    self.orderNumb.text = myModel.orderNo;
    [self.stateBtn setTitle:myModel.myDescription forState:UIControlStateNormal];
    if ([myModel.stateFlag isEqualToString:@"0"]) {
        //失败
        [self.stateBtn setImage:[UIImage imageNamed:@"CMT_Fail"] forState:UIControlStateNormal];
        [self.stateBtn setTitleColor:CommonRedColor forState:UIControlStateNormal];
    }else if([myModel.stateFlag isEqualToString:@"1"]){
        //成功
        [self.stateBtn setImage:[UIImage imageNamed:@"CMT_Sucess"] forState:UIControlStateNormal];
        [self.stateBtn setTitleColor:ThemeBlueColor forState:UIControlStateNormal];

    }else{
        //处理中
        [self.stateBtn setImage:[UIImage imageNamed:@"CMT_Waitting"] forState:UIControlStateNormal];
        [self.stateBtn setTitleColor:CommonGrayColor forState:UIControlStateNormal];

    }
    if ([myModel.stateFlag isEqualToString:@"2"]) {
        self.deallingBottomView.hidden = NO;
        [self.deallingBottomView setMyModel:myModel];
    }else{
        self.failOrSuccessBottomView.hidden = NO;
        [self.failOrSuccessBottomView setMyModel:myModel];
    }
}
#pragma mark - 充值
- (void)rechargeLoadData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getRechargeDealDetail:[CMT_AccountTool accountModel].userId rechargeId:self.sendModel.recordId withBlock:^(CMT_DealRecordDetailModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf dealData:myModel];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark - 提现
- (void)reflectLoadData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getReflectDealDetail:[CMT_AccountTool accountModel].userId withdrawalId:self.sendModel.recordId withBlock:^(CMT_DealRecordDetailModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf dealData:myModel];

            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }

    }];
}

#pragma mark - 理财
- (void)investLoadData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getInvestDealDetail:[CMT_AccountTool accountModel].userId investId:self.sendModel.recordId withBlock:^(CMT_DealRecordDetailModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf dealData:myModel];

            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
