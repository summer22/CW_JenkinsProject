//
//  CMT_ReflectViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ReflectViewController.h"
#import "CMT_ReflectView.h"
#import "CMT_MyRechargrResultModel.h"
#import "CMT_ReflectOrReChargeResultViewController.h"
#import "CMT_PayMaskView.h"
#import "CMT_MyReflectBankCardAndAccountModel.h"
#import "CMT_ReflectBankAndAccountInfoModel.h"
#import "CMT_SetDealPassViewController.h"
#import "IQKeyboardManager.h"

#define THIRDPAYDEFAULTNAME @"闪豆支付"

@interface CMT_ReflectViewController ()<CMT_ReflectViewDelegate,CMT_PayMaskViewDelegate>
/** 视图 */
@property (nonatomic,strong)CMT_ReflectView *bottomView;
/** 账户信息数据源 */
@property (nonatomic,strong)CMT_ReflectBankAndAccountInfoModel *myModel;
/** 提现结果数据源 */
@property (nonatomic,strong)CMT_MyRechargrResultModel *reflectModel;
/** 提现额度 */
@property (nonatomic,copy)NSString *amountStr;

@end

@implementation CMT_ReflectViewController

- (CMT_ReflectView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[CMT_ReflectView alloc] initWithFrame:CGRectMake(0, self.topView.bottom, CMT_ScreenWidth, 190)];
        _bottomView.delegate = self;
    }
    return _bottomView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadMyData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
    [self setBottomSubViews];
    self.logoImgUrl.layer.cornerRadius = 20;
    self.logoImgUrl.layer.masksToBounds = YES;
}
#pragma mark - 获取账户信息数据
- (void)loadMyData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getReflectUserBankCardAndAccountInfo:[CMT_AccountTool accountModel].userId withBlock:^(CMT_ReflectBankAndAccountInfoModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqual: @"1"]){
                weakSelf.myModel = myModel;
                [weakSelf setHeadUIinfo];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.message];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark -- 提现申请
- (void)toReflectLoadData:(NSString *)payPwd{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getReflectRequest:[CMT_AccountTool accountModel].userId amount:self.amountStr bankId:_myModel.bankId payPassword:payPwd withBlock:^(CMT_MyRechargrResultModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqual: @"1"]){
                weakSelf.reflectModel = myModel;
                CMT_ReflectOrReChargeResultViewController *resultVc = [[CMT_ReflectOrReChargeResultViewController alloc] init];
                resultVc.model = myModel;
                resultVc.whereType = CMT_Reflect;
                [weakSelf.navigationController pushViewController:resultVc animated:YES];
                
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

#pragma mark - 视图控件赋值
- (void)setHeadUIinfo{
    [self.logoImgUrl sd_setImageWithURL:[NSURL URLWithString:_myModel.bankIconAdress] placeholderImage:[UIImage imageNamed:@"CMT_BankDefault"]];
    self.bankName.text = _myModel.bankStr;
    self.balance.text = _myModel.balance;
    self.bankLastNumb.text = [NSString stringWithFormat:@"储蓄卡%@",_myModel.endNumber];
    [self.bottomView setModel:_myModel];
}

#pragma Mark-- 提现底部视图
- (void)setBottomSubViews{
    [self.view addSubview:self.bottomView];
}

#pragma mark -- CMT_ReflectViewDelegate 
//提现点击
- (void)reflectBtnClick:(NSString *)inputStr{
    self.amountStr = inputStr;
    [CMT_PayMaskView showWithDelegateOwer:self];
}
//监听输入金额
- (void)reflectInputMoneyNumb:(NSString *)inputNumb{
    self.thirdPayName.text = inputNumb;
}

#pragma mark -- CMT_PayMaskViewDelegate - 密码输入监听
//支付密码输入
- (void)payMaskViewPassTextField:(NSString *)passNum{
    [self toReflectLoadData:passNum];
    [CMT_PayMaskView removeSelf];
    IQKeyboardManager *manager =  [IQKeyboardManager sharedManager];
    [manager setEnableAutoToolbar:YES];
}
//取消交易密码输入
- (void)payMaskViewBackClick{
    IQKeyboardManager *manager =  [IQKeyboardManager sharedManager];
    [manager setEnableAutoToolbar:YES];
}
//忘记密码点击事件
- (void)payMaskViewForgetPassBtnClick{
    CMT_SetDealPassViewController *forgotDealPass = [[CMT_SetDealPassViewController alloc] init];
    forgotDealPass.diffType = CMT_ForgotDealPwd;
    forgotDealPass.comeFromType = CMT_ReflectClass;
    [self.navigationController pushViewController:forgotDealPass animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
