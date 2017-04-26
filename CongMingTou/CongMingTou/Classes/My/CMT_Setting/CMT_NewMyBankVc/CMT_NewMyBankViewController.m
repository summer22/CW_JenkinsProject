//
//  CMT_NewMyBankViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_NewMyBankViewController.h"
#import "CMT_BankCardAndAccountModel.h"

@interface CMT_NewMyBankViewController ()

@end

@implementation CMT_NewMyBankViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self loadMyData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的银行卡";
    self.bankIcon.layer.cornerRadius = 10;
    self.bankIcon.layer.masksToBounds = YES;
}

#pragma mark - 获取账户信息数据
- (void)loadMyData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getUserBankCardAndAccountInfo:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo withBlock:^(CMT_BankCardAndAccountModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqual: @"1"]){
                [weakSelf setHeadUIinfo:myModel];
            }else if ([[NSString stringWithFormat:@"%ld",(long)myModel.status] isEqualToString:CMT_SinglePointCode]){
                                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

- (void)setHeadUIinfo:(CMT_BankCardAndAccountModel *)model{
    [self.bankIcon sd_setImageWithURL:[NSURL URLWithString:model.bankIconAdress] placeholderImage:[UIImage imageNamed:@"CMT_BankDefault"]];
    self.bankCardNumb.text = model.dealAccount;
    self.name.text = model.name;
    self.serviceLabel.text = [NSString stringWithFormat:@"2.%@",model.reminder];
    self.bankName.text = model.bankName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
