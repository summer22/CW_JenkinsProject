//
//  CMT_RealNameBindCardViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RealNameBindCardViewController.h"
#import "CMT_BankListViewController.h"
#import "CMT_RealNameBindCardResultViewController.h"

@interface CMT_RealNameBindCardViewController ()<CMT_GetYzNumbViewDelegate>

@end

@implementation CMT_RealNameBindCardViewController

#pragma mark - 实名认证
- (void)toRealName{
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getRealNameBindCardInfo:[CMT_AccountTool accountModel].userId userIdentify:_idCardTF.text userName:_nameTF.text cardNo:_bankNumbTF.text userMobile:_telTF.text mobileSmsCode:_yzNumbView.yzTextFiled.text bankid:self.bankId withBlock:^(CMT_RealNameModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                CMT_AccountModel *model = [CMT_AccountTool accountModel];
                model.realNameState = @"1";
                model.realName = _nameTF.text;
                model.bankReservedPhoneNum = [NSString stringWithFormat:@"%@",_telTF.text];
                model.idCardNumber = _bankNumbTF.text;
                model.bankMobile = _telTF.text;
                [CMT_AccountTool save:model];
                [self showHint:myModel.message];
                CMT_RealNameBindCardResultViewController *resultVc = [[CMT_RealNameBindCardResultViewController alloc] init];
                resultVc.nameStr = _nameTF.text;
                resultVc.cardNumStr = _idCardTF.text;
                resultVc.fromType = self.fromType;
                [self.navigationController pushViewController:resultVc animated:YES];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:self];
            }else{
                [self showHint:myModel.message];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}

//输入信息条件判断
- (BOOL)judge{
    
    if (self.bankId) {
        if (_bankNumbTF.text.length < CMT_BankNumMaxLenght && _bankNumbTF.text.length > CMT_BankNumMinLenght) {
            if (_nameTF.text.length != 0) {
                if (_idCardTF.text.length > 0) {
                    if (_telTF.text.length  >= CMT_PhoneNumLenght) {
                        if (_yzNumbView.yzTextFiled.text.length >= CMT_VerificationCodeLenght) {
//                            if (_AgreementBtn.selected == YES) {
                                return YES;
//                            }else{
//                                [self showHint:@"请选择投资协议"];
//                                return NO;
//                            }
                        }else{
                            [self showHint:@"验证码输入错误"];
                            return NO;
                        }
                    }else{
                        [self showHint:@"手机号格式有误"];
                        return NO;
                    }
                }else{
                    [self showHint:@"请输入持卡人身份证号"];
                    return NO;
                }
            }else{
                [self showHint:@"请输入持卡人姓名"];
                return NO;
            }
        }else{
            [self showHint:@"请输入正确的银行卡号"];
            return NO;
        }
    }else{
        [self showHint:@"请输入开户行"];
        return NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名绑卡";
    self.yzNumbView.delegate = self;
}

//选择开户行
- (IBAction)selectBankType:(id)sender {
    CMT_BankListViewController *bankListViewController =[[CMT_BankListViewController alloc]init];
    bankListViewController.enterBankListType = CMTEnterBankListTypeChoose;
    __block UIButton *bankNameLab = self.selectBankTypeBtn;
    __weak typeof(self) weakSelf = self;
    bankListViewController.bankInforBlock = ^void(CMT_InvestmentPreBankListModel * model){
        [bankNameLab setTitleColor:CommonBlackColor forState:UIControlStateNormal];
        [bankNameLab setTitle:[NSString stringWithFormat:@"%@",model.bankName] forState:UIControlStateNormal];
        weakSelf.bankId = model.id;
    };
    [self.navigationController pushViewController:bankListViewController animated:YES];
}

//聪明投协议
- (IBAction)toAgrementbtnAction:(id)sender {
    [CMT_Tools pushPickdH5:self :UrlFinancialAgreeMent str:LJH_RESHLJH_URLH5(USERAGREINVRSTAGEEMENT, @"0", @"0") title:@"投资理财协议"];
}
//选择聪明投协议
- (IBAction)selectAgrementBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
}
//确认按钮
- (IBAction)makeSureBtn:(id)sender {
    [self.view endEditing:YES];

    if ([self judge]==YES) {
        [self toRealName];
    }
}

#pragma mark -- yzNumbViewDelegate -- 获取验证码
- (void)getYzNumbClick{
    
    if (_telTF.text.length >= CMT_PhoneNumLenght) {
        [self getYzNumbData];
    }else{
        [self showHint:@"请输入正确的手机号"];
    }
}

- (void)getTextFieldNotification:(NSString *)textStr{

}

- (void)getYzNumbData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getYzNumb:_telTF.text withType:@"4" withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [_yzNumbView startTime];
                [weakSelf showHint:@"验证码发送成功"];
                
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

- (void)viewDidLayoutSubviews{
    [self.bgScrollView addSubview:self.bgView];
    self.bgScrollView.showsVerticalScrollIndicator = NO;
    self.bgScrollView.frame  =CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - 64);
    self.bgView.frame = CGRectMake(0, 0, CMT_ScreenWidth, 550);
    self.bgScrollView.contentSize = CGSizeMake(CMT_ScreenWidth,CGRectGetMaxY(self.bgView.frame));
    self.oneLine.backgroundColor = CommonLineColor;
    self.onelIneH.constant = 0.5;
    self.twoLine.backgroundColor = CommonLineColor;
    self.lineH.constant = 0.5;
    self.threeLine.backgroundColor = CommonLineColor;
    self.threeLineH.constant = 0.5;
}

- (void)dealloc{
    [self.view endEditing:YES];
    [_yzNumbView destroyTimer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
