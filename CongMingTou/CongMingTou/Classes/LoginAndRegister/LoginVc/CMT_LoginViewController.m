//
//  CMT_LoginViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_LoginViewController.h"
#import "CMT_yzLoginView.h"
#import "CMT_pwLoginView.h"
#import "CMT_RegisterView.h"
#import "CMT_VerificationViewController.h"
#import "CMT_NewMyViewController.h"
#import "CMT_SetLoginPassViewController.h"
#import "CMT_GestureUnlockViewController.h"
#import "JPUSHService.h"

@interface CMT_LoginViewController ()<CMT_pwLoginViewDelegate,CMT_yzLoginViewDelegate,CMT_RegisterViewDelegate>
/** 验证码登录 */
@property (nonatomic,strong)CMT_yzLoginView *yzLoginView;
/** 密码登录 */
@property (nonatomic,strong)CMT_pwLoginView *pwLoginView;
/** 注册 */
@property (nonatomic,strong)CMT_RegisterView *registerView;
/** 手机号 */
@property (nonatomic,copy)NSString *loginTel;

@end

@implementation CMT_LoginViewController

- (CMT_yzLoginView *)yzLoginView{
    if (!_yzLoginView) {
        _yzLoginView = [[CMT_yzLoginView alloc] initWithFrame:CGRectMake(0, self.topBgView.bottom, CMT_ScreenWidth, 200)];
        _yzLoginView.delegate = self;
        _yzLoginView.hidden = YES;
    }
    return _yzLoginView;
}
- (CMT_pwLoginView *)pwLoginView{
    if (!_pwLoginView) {
        _pwLoginView = [[CMT_pwLoginView alloc] initWithFrame:CGRectMake(0, self.topBgView.bottom, CMT_ScreenWidth, 200)];
        _pwLoginView.delegate = self;
        _pwLoginView.hidden = YES;
    }
    return _pwLoginView;
}
- (CMT_RegisterView *)registerView{
    if (!_registerView) {
        _registerView = [[CMT_RegisterView alloc] initWithFrame:CGRectMake(0, self.topBgView.bottom, CMT_ScreenWidth, 200)];
        _registerView.delegate = self;
        _registerView.hidden = YES;
    }
    return _registerView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.yzLoginView];
    [self.view addSubview:self.pwLoginView];
    [self.view addSubview:self.registerView];
    self.view.backgroundColor = [UIColor whiteColor];
    if (![self.preVc isKindOfClass:[CMT_GestureUnlockViewController class]]) {
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem LeftItemWithTitle:@"返回" WithImageName:@"CMT_WhiteBackImg" target:self action:@selector(back) blackOrWhite:NO];
    }else{
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"" target:self action:nil];
    }
    if (self.diffType == CMT_REGISTERTYPE) {
        [self changeLoginOrRegister:self.registerBtn];
    }else{
        [self changeLoginOrRegister:self.loginBtn];
    }
    self.bottomAdverBtn.hidden = YES;
    [self loginBottomAdverSwitch];
}

#pragma mark - 登录注册切换
- (IBAction)changeLoginOrRegister:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    
    if (btn.tag == 101) {
        self.yzLoginView.hidden = YES;
        self.pwLoginView.hidden = YES;
        self.registerView.hidden = NO;
        
    }else if(btn.tag == 100){
        self.yzLoginView.hidden = NO;
        self.pwLoginView.hidden = YES;
        self.registerView.hidden = YES;
    }
}

// mark -- 返回判断枚举类型待定
- (void)back{
    if ([self.preVc isKindOfClass:[CMT_GestureUnlockViewController class]]) {
        CMT_NAV_BACK;
        return;
    }
    if(_enterLoginType == CMTEnterLoginTypeTabbarMy){
        [self dismissViewControllerAnimated:YES completion:nil];
        CMT_RootVC.selectedIndex = 0;
    }else if(_enterLoginType == CMTEnterLoginTypeDefaut){
        [_preVc.navigationController popViewControllerAnimated:YES];
    }else if(_enterLoginType == CMTEnterLoginTypeSingleLoginOut){
        [self dismissViewControllerAnimated:YES completion:nil];
        [_preVc.navigationController popToRootViewControllerAnimated:YES];
        CMT_RootVC.selectedIndex = 0;
    }
}

#pragma mark -- CMT_pwLoginViewDelegate
//忘记密码
- (void)forgotBtnClick:(NSString *)telStr{
    CMT_SetLoginPassViewController *setLoginPass = [[CMT_SetLoginPassViewController alloc] init];
    setLoginPass.diffType = CMT_ForgotLoginPwd;
    setLoginPass.telNumb = telStr;
    [self.navigationController pushViewController:setLoginPass animated:YES];
}

//短信登录
- (void)smsLoginBtnClick{
    [UIView animateWithDuration:0.3 animations:^{
        self.yzLoginView.hidden = NO;
        self.pwLoginView.hidden = YES;
    }];
}
//登录按钮
- (void)loginBtnClick:(NSString *)telNumb pwd:(NSString *)pwdStr{
    
    [self.view endEditing:YES];
    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaitingLoging];
    [CMT_ProcessTheDataTool getPwdLogin:@"" phone:telNumb pwd:pwdStr withBlock:^(CMT_AccountModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([myModel.status isEqualToString:@"1"]){
                weakSelf.loginTel = telNumb;
                [JPUSHService setAlias:telNumb
                      callbackSelector:@selector(tagsAliasCallback:tags:alias:)
                                object:self];
                [weakSelf showHint:CMT_LoadDataLoginSuccessful];
                [CMT_AccountTool save:myModel];
                if ([CMT_GesturesPasswordTool gesturesPwdModel].openState == 1) {
                    if(_enterLoginType == CMTEnterLoginTypeTabbarMy){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        CMT_RootVC.selectedIndex = 3;
                    }else if(_enterLoginType == CMTEnterLoginTypeDefaut){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        [_preVc.navigationController popViewControllerAnimated:YES];
                    }else if(_enterLoginType == CMTEnterLoginTypeSingleLoginOut){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        [_preVc.navigationController popToRootViewControllerAnimated:YES];
                        CMT_RootVC.selectedIndex = 0;
                    }
                }else{
                    [self toSetGesPwd:CMT_LoginClassNoGes];
                }
            }else{
                [weakSelf.view endEditing:YES];
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf.view endEditing:YES];
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark -- CMT_yzLoginViewDelegate

//密码登录
- (void)pwdLoginBtnClick{
    [UIView animateWithDuration:0.3 animations:^{
        self.yzLoginView.hidden = YES;
        self.pwLoginView.hidden = NO;
    }];
}

//获取验证码点击事件
- (void)getsmsCodeBtnClick:(NSString *)telStr{
    if (telStr.length >= CMT_PhoneNumLenght) {
        [self getYzNumbData:telStr];
    }else{
        [self showHint:@"请输入手机号"];
    }
}
//获取验证码
- (void)getYzNumbData:(NSString *)tel{
    
    [self.view endEditing:YES];
    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getYzNumb:tel withType:@"2" withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf showHint:@"验证码发送成功"];
                [_yzLoginView startTime];
                
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


//验证登录按钮
- (void)loginBtnClick:(NSString *)telNumb code:(NSString *)codeStr{
    [self yzloginBtnClick:telNumb code:codeStr];
}

//验证码登录按钮
- (void)yzloginBtnClick:(NSString *)telNumb code:(NSString *)codeStr{
    
    [self.view endEditing:YES];
    
    __weak  typeof(self) weakSelf = self;
    
    [self showHudInView:self.view hint:CMT_LoadDataWaitingLoging];
    [CMT_ProcessTheDataTool getCodeLogin:@"" phone:telNumb captch:codeStr withBlock:^(CMT_AccountModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqualToString:@"1"]){
                weakSelf.loginTel = telNumb;
                [JPUSHService setAlias:telNumb
                      callbackSelector:@selector(tagsAliasCallback:tags:alias:)
                                object:self];
                [_yzLoginView destroyTimer];
                [weakSelf showHint:CMT_LoadDataLoginSuccessful];
                [CMT_AccountTool save:myModel];
                if ([CMT_GesturesPasswordTool gesturesPwdModel].openState == 1) {
                    if(_enterLoginType == CMTEnterLoginTypeTabbarMy){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        CMT_RootVC.selectedIndex = 3;
                    }else if(_enterLoginType == CMTEnterLoginTypeDefaut){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        [_preVc.navigationController popViewControllerAnimated:YES];
                    }else if(_enterLoginType == CMTEnterLoginTypeSingleLoginOut){
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        [_preVc.navigationController popToRootViewControllerAnimated:YES];
                        CMT_RootVC.selectedIndex = 0;
                    }else{
                        [weakSelf dismissViewControllerAnimated:YES completion:nil];
                        [_preVc.navigationController popToRootViewControllerAnimated:YES];;
                        CMT_RootVC.selectedIndex = 0;
                    }
                }else{
                    [self toSetGesPwd:CMT_LoginClassNoGes];
                }
            }else{
                [weakSelf.view endEditing:YES];
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf.view endEditing:YES];
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark - CMT_RegisterViewDelegate
//注册协议点击
- (void)agreementBtnClick{
    [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(USERAGREEMENTREGISERS,@".htm") title:@"注册协议"];
}

#pragma mark - 底部广告是否显示开关
- (void)loginBottomAdverSwitch{
    __weak  typeof(self) weakSelf = self;

    [CMT_ProcessTheDataTool loginBottomAdverSwitchWithBlock:^(CMT_BaseModel *myModel, NSError *error) {
        if(!error){
            if([myModel.status isEqualToString:@"1"]){
                weakSelf.bottomAdverBtn.hidden = YES;
            }else{
                weakSelf.bottomAdverBtn.hidden = NO;
            }
        }
    }];
}

//注册点击
- (void)registerBtnClick:(NSString *)telNumb pwd:(NSString *)pwdStr{
    [self.view endEditing:YES];
    __weak  typeof(self) weakSelf = self;
    [self showHudInView:self.view hint:CMT_LoadDataWaitingLoging];
    [CMT_ProcessTheDataTool registerConfirm:telNumb withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqualToString:@"1"]){
                CMT_VerificationViewController *verificationVc = [[CMT_VerificationViewController alloc] init];
                verificationVc.comeFromType = CMT_ComeRegister;
                verificationVc.enterLoginType = weakSelf.enterLoginType;
                verificationVc.preVc = weakSelf.preVc;
                verificationVc.pwdStr = pwdStr;
                verificationVc.telNumbStr = telNumb;
                [weakSelf.navigationController pushViewController:verificationVc animated:YES];
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

//登录点击
- (void)toSetGesPwd:(CMT_COMEFROMYZVC)type{
    [self.view endEditing:YES];
    CMT_GestureUnlockViewController *ges = [[CMT_GestureUnlockViewController alloc] init];
    ges.type = GestureViewControllerTypeSetting;
    ges.comeFromType = type;
    ges.enterLoginType = self.enterLoginType;
    ges.preVc = self.preVc;
    [self.navigationController pushViewController:ges animated:YES];
}

- (IBAction)advertisingBtnClicked:(id)sender{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:CMT_AdvertisingUrl]];
}

- (void)tagsAliasCallback:(int)iResCode tags:(NSSet*)tags alias:(NSString*)alias {
    if (iResCode != 0) {
        [JPUSHService setAlias: self.loginTel
              callbackSelector:nil
                        object:self];
    }
    CMT_Log(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, tags , alias);
}


- (void)dealloc{
    [self.view endEditing:YES];
    [_yzLoginView destroyTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
