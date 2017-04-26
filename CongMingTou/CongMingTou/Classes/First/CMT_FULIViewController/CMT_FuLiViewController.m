//
//  CMT_FuLiViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/27.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FuLiViewController.h"
#import "CMT_UserFuLiJInModel.h"

@interface CMT_FuLiViewController ()
/** 数据源 */
@property (nonatomic,strong)CMT_UserFuLiJInModel *model;
@end

@implementation CMT_FuLiViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getFuliJinInfoLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    self.title = @"使用福利金";
}

- (IBAction)makeSureBtn:(id)sender {
    [self.view endEditing:YES];
    if ([self isRightStatus] == YES) {
        self.backBlock(self.myTF.text);
        CMT_NAV_BACK;
    }
}

- (BOOL)isRightStatus{
    if ([_myTF.text integerValue] > [_model.timeWelfareLimit integerValue]) {
        [self showHint:@"超出购买金额最高可用福利金"];
        return NO;
    }
    return YES;
}

- (void)getFuliJinInfoLoad{
    
    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];

    [CMT_ProcessTheDataTool getFuliJInInfo:[CMT_AccountTool accountModel].userId investAmount:self.investAmount bidId:self.bidId withBlock:^(CMT_UserFuLiJInModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                weakSelf.model = myModel;
                [weakSelf setUserFuliInfoViewsData:myModel];
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

- (void)setUserFuliInfoViewsData:(CMT_UserFuLiJInModel *)model{

    self.avaliableCountLabel.text = [model.timeWelfareLimit stringByAppendingString:@"元"];
    self.totalUserAccount.text = model.WelfareAmountTotal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
