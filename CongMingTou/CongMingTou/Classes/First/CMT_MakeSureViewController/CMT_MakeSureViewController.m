//
//  CMT_MakeSureViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//
#import "CMT_MakeSureViewController.h"
#import "CMT_BottomBtnView.h"
#import "CMT_MakeSureBottomViewThree.h"
#import "CMT_MakeSureBottomViewOne.h"
#import "CMT_MakeSureBottomViewTwo.h"
#import "CMT_PayMaskView.h"
#import "CMT_MakeSureModel.h"
#import "CMT_InvestResultViewController.h"
#import "CMT_RechargeViewController.h"
#import "CMT_FuLiViewController.h"
#import "CMT_RedViewController.h"
#import "CMT_SetDealPassViewController.h"
#import "IQKeyboardManager.h"

@class CMT_MakeSureModelData;

@interface CMT_MakeSureViewController ()<CMT_BottomBtnViewDelegate,CMT_PayMaskViewDelegate,CMT_MakeSureBottomViewTwoDelegate>
/** 底部立即抢购视图按钮 */
@property (nonatomic,strong)CMT_BottomBtnView *bottomView;
/** 月月息类型选择底部视图 */
@property (nonatomic,strong)CMT_MakeSureBottomViewThree *yyTypeBottomView;
/** 新手福利底部视图 */
@property (nonatomic,strong)CMT_MakeSureBottomViewOne *oneTypeBottomView;
/** 速速赚视图 */
@property (nonatomic,strong)CMT_MakeSureBottomViewTwo *twoTypeBottomView;
/** 数据源 */
@property (nonatomic,strong)CMT_MakeSureModelData *model;
/** 选择福利金额度 */
@property (nonatomic,copy)NSString *fuliJInValue;
/** 加息券rate */
@property (nonatomic,copy)NSString *rateStr;
/** 加息券id*/
@property (nonatomic,copy)NSString *rateId;
/** 速速赚到期操作id */
@property (nonatomic,copy)NSString *suSelectId;

@end

@implementation CMT_MakeSureViewController{
    IQKeyboardManager *manager;
}

- (CMT_BottomBtnView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[CMT_BottomBtnView alloc] initWithFrame:CGRectMake(0, CMT_ScreenHeight - 68 - 64, CMT_ScreenWidth, 68)];
        _bottomView.delegate = self;
    }
    return _bottomView;
}
- (CMT_MakeSureBottomViewThree *)yyTypeBottomView{
    if (!_yyTypeBottomView) {
        _yyTypeBottomView = [[CMT_MakeSureBottomViewThree alloc] initWithFrame:CGRectMake(0, 288 + 8, CMT_ScreenWidth, 144)];
    }
    return _yyTypeBottomView;
}
- (CMT_MakeSureBottomViewOne *)oneTypeBottomView{
    if (!_oneTypeBottomView) {
        _oneTypeBottomView = [[CMT_MakeSureBottomViewOne alloc] initWithFrame:CGRectMake(0, 288 + 8, CMT_ScreenWidth, 46)];
    }
    return _oneTypeBottomView;
}
- (CMT_MakeSureBottomViewTwo *)twoTypeBottomView{
    if (!_twoTypeBottomView) {
        _twoTypeBottomView = [[CMT_MakeSureBottomViewTwo alloc] initWithFrame:CGRectMake(0, 288 + 8, CMT_ScreenWidth, 97)];
        _twoTypeBottomView.delegate = self;
    }
    return _twoTypeBottomView;
}
- (void)setSubView{
    self.bottomView.btn.userInteractionEnabled = YES;
    self.chooseTicket.userInteractionEnabled = NO;
    self.FuLiJInBtn.userInteractionEnabled = NO;
    self.oneLine.backgroundColor = CommonLineColor;
    self.oneLineH.constant = 0.5;
    self.threeLine.backgroundColor = CommonLineColor;
    self.threeLineH.constant = 0.5;
    //合并xibView
    if (self.bidPlanType == CMTNewBidPlan) {
        [self.contentBgView addSubview:self.oneTypeBottomView];

    }else if(self.bidPlanType == CMTSusuBidPlan){
        [self.contentBgView addSubview:self.twoTypeBottomView];
    }else{
        [self.contentBgView addSubview:self.yyTypeBottomView];
    }
    
    [self.bgScrollView addSubview:self.contentBgView];
    self.bgScrollView.showsVerticalScrollIndicator = NO;
    self.bgScrollView.frame  = CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - 68 - 64);
    self.contentBgView.frame = CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - 68 - 64);
    self.bgScrollView.contentSize = CGSizeMake(CMT_ScreenWidth,CMT_ScreenHeight);//CGRectGetMaxY(self.contentBgView.frame) + 10);
    [self.view insertSubview:self.bottomView aboveSubview:self.bgScrollView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购买确认";
    [self setSubView];
    [self getLoadData];
    self.fuliJInValue = @"0";
    self.rateId = @"-1";
    self.suSelectId = @"1";
    
    manager = [IQKeyboardManager sharedManager];
    [manager setEnableAutoToolbar:YES];
    self.chooseTicket.userInteractionEnabled = NO;
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
//获取页面数据
- (void)getLoadData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getInvestMakeSureData:self.bidId uId:[CMT_AccountTool accountModel].userId withBlock:^(CMT_MakeSureModel *makeSureModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",makeSureModel.status] isEqualToString:@"1"]){
                weakSelf.model = makeSureModel.plans;
                CGFloat minInvestAmount = [makeSureModel.plans.minInvestAmount floatValue];
                weakSelf.myTF.placeholder = [NSString stringWithFormat:@"%.0f元起投,%.0f的倍数递增",minInvestAmount,minInvestAmount];
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
#pragma mark -- 立即投资接口
- (void)toInvest{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getInvest:self.bidId uId:[CMT_AccountTool accountModel].userId investAm:self.myTF.text fringeBenefitAm:self.fuliJInValue jxIdStr:self.rateId completeOperation:self.suSelectId investToken:self.model.investToken withBlock:^(CMT_ToInvestModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if (![myModel.welfareAmountDesc isEqualToString:@"no"]) {
                    [weakSelf showHint:myModel.welfareAmountDesc];
                }
                CMT_InvestResultViewController *vc = [[CMT_InvestResultViewController alloc] init];
                vc.myModel = myModel;
                vc.bidId = weakSelf.bidId;
                vc.bidPlanType = self.bidPlanType;
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
- (void)setUIData:(CMT_MakeSureModelData *)model{
    self.balance.text = model.leftAmount;
    self.chongzLabel.text = model.balance;
    self.tickets.text = [NSString stringWithFormat:@"%@张可用",model.myInterestCount];
    [self.oneTypeBottomView setExpectMoney:@"0.00"];//预期收益计算
    self.yyTypeBottomView.fanXLabel.text = @"0.00";//每月返息金额
    self.yyTypeBottomView.FLabel.text = model.investPeriod;//投资期限
    self.yyTypeBottomView.SLabel.text = @"0.00";//预期收益
    self.twoTypeBottomView.prizeLabel.text = @"0.00";//预期收益
    self.fuLabel.text = model.welfareDescription;
    if ([model.myInterestCount doubleValue] >0) {
        self.chooseTicket.userInteractionEnabled = YES;
    }else{
        self.chooseTicket.userInteractionEnabled = NO;
    }
    if ([model.welfareDescription isEqualToString:@"使用福利金"]) {
        self.FuLiJInBtn.userInteractionEnabled = YES;
    }else{
        self.FuLiJInBtn.userInteractionEnabled = NO;
    }
}
//金额输入框监听
- (IBAction)textValueChange:(id)sender {
    [self expectProfit];
}
#pragma mark -- 计算预期收益
- (void)expectProfit{
    if (!self.fuliJInValue) {
        self.fuliJInValue = @"0";
    }
    if (!self.rateStr) {
        self.rateStr = @"0";
    }
    NSString *str = [CMT_Tools apr:[[self.model apr] floatValue] addPercent:[self.rateStr floatValue]  investAmount:[self.myTF.text floatValue] investDay:[[self.model period] floatValue] welfareAmount: [self.fuliJInValue floatValue]];
    
    [self.oneTypeBottomView setExpectMoney:str];
    self.yyTypeBottomView.SLabel.text = str;//预期收益
    self.yyTypeBottomView.fanXLabel.text = [NSString stringWithFormat:@"%0.2f",[str doubleValue] / [_model.period doubleValue] * 30] ;//每月返息金额
    self.twoTypeBottomView.prizeLabel.text = str;
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
    
    if (self.myTF.text.length != 0 && [self.myTF.text doubleValue] != 0) {
        if ([self.myTF.text doubleValue] <= [[CMT_Tools numberStrWithReplace:self.model.balance] doubleValue]) {
            if ([self.myTF.text integerValue] % [self.model.minInvestAmount integerValue] == 0) {
                if ([self.myTF.text doubleValue] <= [self.model.leftAmount doubleValue]) {
                    if (self.bidPlanType == CMTNewBidPlan) {
                        if ([self.myTF.text doubleValue] <= [self.model.maxNewInvestAmount doubleValue]) {
                            return YES;
                        }else{
                            [self showHint:@"超出新手最大可投金额"];
                            return NO;
                        }
                    }else{
                        return YES;
                    }
                }else{
                    [self showHint:@"超出剩余可投金额"];
                    return NO;
                }
            }else{
                [self showHint:@"投资金额需是起投金额的整数倍"];
                return NO;
            }
        }else{
            [self showHint:@"可用余额不足"];
            return NO;
        }
    }else{
        [self showHint:@"请输入投资金额"];
        return NO;
    }
}
//去充值
- (IBAction)ChongZ:(id)sender {
    CMT_RechargeViewController *rechargeVc = [[CMT_RechargeViewController alloc] initWithNibName:@"CMT_RechargeViewController" bundle:nil];
    rechargeVc.fromClassType = CMT_EnterFromMakeSureClass;
    [self.navigationController pushViewController:rechargeVc animated:YES];
}
//福利金
- (IBAction)fuLiJin:(id)sender {
    if ([self isRightToNextAction] == YES) {
        __weak  typeof(self) weakSelf = self;
        
        CMT_FuLiViewController *fuliJIn = [[CMT_FuLiViewController alloc] init];
        fuliJIn.bidId = self.model.bidId;
        fuliJIn.investAmount = self.myTF.text;
        fuliJIn.backBlock =  ^(NSString *valueNumb){
            if([valueNumb doubleValue] > 0){
                weakSelf.fuLabel.text = [NSString stringWithFormat:@"已使用%@",valueNumb];
                weakSelf.fuliJInValue = valueNumb;
                [weakSelf expectProfit];
            }
        };
        CMT_NAV_PUSHTO_VC(fuliJIn);
    }
}
//加息券
- (IBAction)chooseTicket:(id)sender {
    __weak  typeof(self) weakSelf = self;
    CMT_RedViewController *ticketsVc = [[CMT_RedViewController alloc] init];
    ticketsVc.diffType = COUPON;
    ticketsVc.comeFromType = MAKESUREINVESTVC;
    ticketsVc.period =  self.model.period;
    ticketsVc.backBlock =  ^(CMT_RedOrCouponModel *userRateModel){
        weakSelf.tickets.text = [[NSString stringWithFormat:@"已使用+%@",userRateModel.rate] stringByAppendingString:@"%"];
        weakSelf.tickets.textColor = CommonRedColor;
        weakSelf.rateStr = userRateModel.rate;
        weakSelf.rateId = userRateModel.id;
        [weakSelf expectProfit];
    };
    CMT_NAV_PUSHTO_VC(ticketsVc);
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

#pragma mark -- CMT_MakeSureBottomViewTwoDelegate
- (void)selectBtnClick:(NSString *)typeId{
    self.suSelectId = typeId;
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

@end
