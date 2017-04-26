////
////  CMT_RechargeViewController.m
////  CongMingTou
////
////  Created by summer on 2016/11/1.
////  Copyright © 2016年 QiYuan. All rights reserved.
////
//
#import "CMT_RechargeViewController.h"
#import "CMT_RechargeOneStep.h"
#import "CMT_RechargeView.h"
#import "CMT_BankCardAndAccountModel.h"
#import "CMT_RechargeModel.h"
#import "CMT_ReflectOrReChargeResultViewController.h"
//
@interface CMT_RechargeViewController ()<CMT_RechargeOneStepDelegate,CMT_RechargeViewDelegate>
/** 第一步视图 */
@property (nonatomic,strong)CMT_RechargeOneStep *oneStepBottomView;
/** 第二步视图 */
@property (nonatomic,strong)CMT_RechargeView *rechargeView;
/** 数据源 */
@property (nonatomic,strong)CMT_BankCardAndAccountModel *myModel;
/** 充值申请 */
@property (nonatomic,strong)CMT_RechargeModel *rechargeModel;
/** 充值申请验证结果 */
@property (nonatomic,strong)CMT_MyRechargrResultModel *rechargrResultModel;
/** 充值金额 */
@property (nonatomic,copy)NSString *rechageAmount;
/** 验证吗 */
@property (nonatomic,copy)NSString *codeStr;


@end
//
@implementation CMT_RechargeViewController

- (CMT_RechargeOneStep *)oneStepBottomView{
    if (!_oneStepBottomView) {
        _oneStepBottomView = [[CMT_RechargeOneStep alloc] initWithFrame:CGRectMake(0, self.topView.bottom, CMT_ScreenWidth, 190)];
        _oneStepBottomView.delegate = self;
    }
    return _oneStepBottomView;
}
- (CMT_RechargeView *)rechargeView{
    if (!_rechargeView) {
        _rechargeView = [[CMT_RechargeView alloc] initWithFrame:CGRectMake(0, self.topView.bottom, CMT_ScreenWidth, 200)];
        _rechargeView.delegate = self;
        _rechargeView.hidden = YES;
    }
    return _rechargeView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadMyData];
}

- (void)back{
    [self.rechargeView destroyTimer];
    CMT_NAV_BACK;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值";
    [self setStepBottomSubViews];
    self.bankIconImg.layer.cornerRadius = 20;
    self.bankIconImg.layer.masksToBounds = YES;
}

#pragma mark -- 充值申请
- (void)toRecharge{
    __weak  typeof(self) weakSelf = self;
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getRecharge:[CMT_AccountTool accountModel].userId amount:self.rechageAmount withBlock:^(CMT_MyRechargeModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqual: @"1"]){
                weakSelf.rechargeModel = myModel.model;
                [weakSelf changeView];//切换视图
                [weakSelf.rechargeView startTime];
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

#pragma makr -- 充值申请验证
- (void)rechageComfirm{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getRechargeConfirm:[CMT_AccountTool accountModel].userId amount:self.rechageAmount orderNoThird:self.rechargeModel.orderNoThird payToken:self.rechargeModel.payToken orderNo:self.rechargeModel.orderNo captch:self.codeStr withBlock:^(CMT_MyRechargrResultModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqual: @"1"]){
                weakSelf.rechargrResultModel = myModel;
                CMT_ReflectOrReChargeResultViewController *resultVc = [[CMT_ReflectOrReChargeResultViewController alloc] init];
                resultVc.model = weakSelf.rechargrResultModel;
                resultVc.whereType = CMT_Recharge;
                resultVc.fromClassType = weakSelf.fromClassType;
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

#pragma mark - 获取账户信息数据
- (void)loadMyData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getUserBankCardAndAccountInfo:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo withBlock:^(CMT_BankCardAndAccountModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqual: @"1"]){
                weakSelf.myModel = myModel;
                [weakSelf setHeadUIinfo:self.myModel];
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
//获取验证码
- (void)getYzNumbData{

    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getYzNumb:[CMT_AccountTool accountModel].bankMobile withType:@"5" withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf showHint:@"验证码发送成功"];
                [weakSelf.rechargeView startTime];
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


#pragma mark -- 账户和银行卡信息赋值
- (void)setHeadUIinfo:(CMT_BankCardAndAccountModel *)model{
    
    [self.bankIconImg sd_setImageWithURL:[NSURL URLWithString:model.bankIconAdress] placeholderImage:[UIImage imageNamed:@"CMT_BankDefault"]];
    self.bankName.text = model.bankName;
    self.cardLastFourNumb.text = [NSString stringWithFormat:@"储蓄卡%@",model.endNumber];;
    self.lastMoneyCount.text = model.userBalance;
    [self.oneStepBottomView setModel:model];
}

//两个view的切换
- (void)changeView{
    [UIView animateWithDuration:0.3 animations:^{
        self.oneStepBottomView.hidden = YES;
        self.rechargeView.hidden = NO;
    }];
}

#pragma Mark-- 充值底部视图
- (void)setStepBottomSubViews{
    [self.view addSubview:self.rechargeView];
    [self.view addSubview:self.oneStepBottomView];
}

#pragma mark -- CMT_RechargeOneStep delegate
//下一步
- (void)rechargeOneStepBtnClick:(NSString *)inputNumb{
    self.rechageAmount = inputNumb;
    [self toRecharge];
}
//监听输入金额
- (void)rechargeInputMoneyNumb:(NSString *)inputNumb{
    self.topMoneyNumb.text = inputNumb;
}

#pragma mark -- CMT_RechargeView delegate
//获取验证码
- (void)getYzBtnClick{
    [self toRecharge];
}
//充值点击事件
- (void)rechargeBtnClick:(NSString *)inputStr{
    self.codeStr = inputStr;
    [self rechageComfirm];
}

- (void)dealloc{
    [self.rechargeView destroyTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
