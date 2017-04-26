//
//  CMT_ReflectOrReChargeResultViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ReflectOrReChargeResultViewController.h"
#import "CMT_RechargeResultModel.h"
#import "CMT_MakeSureViewController.h"

@interface CMT_ReflectOrReChargeResultViewController ()

@end

@implementation CMT_ReflectOrReChargeResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"结果详情";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"" target:self action:nil];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemFinishWithTitle:@"完成" target:self action:@selector(finish)];
    [self fillSubViewData];
}

#pragma mark -- 数据填充
- (void)fillSubViewData{
    if (self.whereType == CMT_Recharge) {
        self.resultState.text = @"充值申请成功！";
        self.contentLable.text = [NSString stringWithFormat:@"充值金额%@元",self.model.amount];
    }else if(self.whereType == CMT_Reflect){
        self.resultState.text = @"提现申请成功！";
        self.contentLable.text = [NSString stringWithFormat:@"提现金额%@元",self.model.amount];
    }
    if (self.model.modelArr.count > 0) {
        self.oneStepLabel.text = [self.model.modelArr[0] startDescription];
        self.dataLabel.text = [self.model.modelArr[0] startDateStr];
        self.bottomLabel.text = [self.model.modelArr[1] endDescription];
    }
}

#pragma mark -- 导航右上角完成按钮点击事件
- (void)finish{
    if (self.fromClassType == CMT_EnterFromMakeSureClass) {
        [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[1] animated:YES];
    }else{
        CMT_NAV_BACKTO_ROOT;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
