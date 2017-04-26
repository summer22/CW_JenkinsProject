//
//  CMT_FuliMakeSureViewController.m
//  CongMingTou
//
//  Created by summer on 17/1/11.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import "CMT_FuliMakeSureViewController.h"
#import "CMT_BottomBtnView.h"
#import "CMT_PayMaskView.h"
#import "IQKeyboardManager.h"
#import "CMT_InvestResultViewController.h"
#import "CMT_SetDealPassViewController.h"

@interface CMT_FuliMakeSureViewController ()<CMT_BottomBtnViewDelegate,CMT_PayMaskViewDelegate>
/** 底部立即抢购视图按钮 */
@property (nonatomic,strong)CMT_BottomBtnView *bottomView;
@property (nonatomic,strong)CMT_MakeSureModelData *model;/** 数据源 */
@end

@implementation CMT_FuliMakeSureViewController{
    IQKeyboardManager *manager;
}

- (CMT_BottomBtnView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[CMT_BottomBtnView alloc] initWithFrame:CGRectMake(0, CMT_ScreenHeight - 68 - 64, CMT_ScreenWidth, 68)];
        _bottomView.delegate = self;
    }
    return _bottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.line.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    self.title = @"购买确认";
    manager = [IQKeyboardManager sharedManager];
    [manager setEnableAutoToolbar:YES];
    [self.view addSubview:self.bottomView];
    [self getLoadData];
}

//获取页面数据
- (void)getLoadData{
    
    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getFuliInvestMakeSureData:self.bidId uId:[CMT_AccountTool accountModel].userId withBlock:^(CMT_MakeSureModel *makeSureModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",makeSureModel.status] isEqualToString:@"1"]){
                weakSelf.model = makeSureModel.plans;
                [weakSelf setUIData:weakSelf.model];
            }else if ([[NSString stringWithFormat:@"%@",makeSureModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:makeSureModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

- (void)setUIData:(CMT_MakeSureModelData *)model{
    self.balanceLabel.text = model.leftAmount;
    self.myBalanceLabel.text = model.welfareBalance;
    self.expectLabel.text = model.planIncome;
    self.tsLabel.text = model.profitDesc;
    self.investAmount.text = model.investWelfareAmount;
}


#pragma mark -- CMT_BottomBtnViewDelegate - 确认投资按钮
//确认投资
- (void)toPayBtnAction{
    if ([self isRightToNextAction] == YES) {
        if ([[CMT_FingerprintManagerTool fingerprintManagerModel] fingerPayOpenState] == 1) {
            [self setFingerPay];
        }else{
            [manager setEnableAutoToolbar:NO];
            [CMT_PayMaskView showWithDelegateOwer:self];
        }
    }
}

//投资条件匹配
- (BOOL)isRightToNextAction{
    [self.view endEditing:YES];
    if ([self.model.welfareBalance doubleValue] < [self.model.investWelfareAmount doubleValue]) {
        [self showHint:@"福利金余额不足"];
        return NO;
    }
    return YES;
}

#pragma mark -- CMT_PayMaskViewDelegate - 密码输入监听
//支付密码输入
- (void)payMaskViewPassTextField:(NSString *)passNum{
    [self confirmInvestPassword:passNum];
    [CMT_PayMaskView removeSelf];
    [manager setEnableAutoToolbar:YES];
    
}
//取消交易密码输入
- (void)payMaskViewBackClick{
    [manager setEnableAutoToolbar:YES];
}
//忘记密码点击事件
- (void)payMaskViewForgetPassBtnClick{
    
    [manager setEnableAutoToolbar:YES];
    CMT_SetDealPassViewController *forgotDealPass = [[CMT_SetDealPassViewController alloc] init];
    forgotDealPass.diffType = CMT_ForgotDealPwd;
    forgotDealPass.comeFromType = CMT_MakeSureInvestClass;
    [self.navigationController pushViewController:forgotDealPass animated:YES];
}

- (void)confirmInvestPassword:(NSString *)pwds{
    
    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getInvestConfirmPassword:[CMT_AccountTool accountModel].mobileNo password:pwds withBlock:^(CMT_InvestConfirmPwdModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if ([myModel.right isEqualToString:@"1"]) {
                    [weakSelf toInvest];
                }
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


#pragma mark -- 立即投资接口
- (void)toInvest{
    
    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getInvest:self.bidId uId:[CMT_AccountTool accountModel].userId investAm:@"0" fringeBenefitAm:self.model.investWelfareAmount  jxIdStr:@"-1" completeOperation:@"1" investToken:self.model.investToken withBlock:^(CMT_ToInvestModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if (![myModel.welfareAmountDesc isEqualToString:@"no"]) {
                    [weakSelf showHint:myModel.welfareAmountDesc];
                }
                CMT_InvestResultViewController *vc = [[CMT_InvestResultViewController alloc] init];
                vc.bidPlanType = CMTNewBidPlan;
                vc.myModel = myModel;
                vc.bidId = weakSelf.bidId;
                [weakSelf.navigationController pushViewController:vc animated:YES];
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

#pragma mark -- 指纹支付
- (void)setFingerPay{
    [CMT_FingerprintManagerTool  fingerprintValidationWithTitle:@"请输入指纹,验证是否可以指纹验证" Block:^(BOOL success, NSError *error, NSError *deviceError) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //用户选择输入密码，切换主线程处理
            if(success == YES && !error && !deviceError){//验证成功
                [self toInvest];
            }else if (success == NO && error){//指纹验证失败，请重新验证
                if(error.code == LAErrorSystemCancel || error.code == LAErrorUserCancel ||error.code == LAErrorUserFallback){
                    [self performSelector:@selector(showPayMaskView) withObject:nil afterDelay:1];//兼容ios10 键盘不显示问题-需等指纹框完全消失才可以
                }else{
                    [self showHint:CMT_Error_FingerprintValidation];
                }
            }else{
                if(deviceError.code == LAErrorTouchIDNotEnrolled){////设备Touch ID不可用，用户未录入
                    [self showHint:CMT_Error_DeviceErrorNOOpenOrNoLogin];
                }else if (deviceError.code == LAErrorTouchIDNotAvailable){ //设备Touch ID不可用，例如未打开
                    [self showHint:CMT_Error_DeviceErrorNOOpenOrNoLogin];
                }else if (deviceError.code == LAErrorPasscodeNotSet){//系统未设置密码
                    [self showHint:CMT_Error_DeviceErrorNOSetFingerprint];
                }else if (deviceError.code == LAErrorAuthenticationFailed){//授权失败
                    [self showHint:CMT_Error_DeviceErrorFingerprintValidation];
                }else{
                    [self showHint:CMT_Error_DeviceErrorFingerprintValidation];//设备不支持
                }
            }
        }];
    }];
}

- (void)showPayMaskView{
    [manager setEnableAutoToolbar:NO];
    [CMT_PayMaskView showWithDelegateOwer:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
