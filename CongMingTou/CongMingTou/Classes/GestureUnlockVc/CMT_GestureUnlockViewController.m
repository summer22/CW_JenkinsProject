//
//  CMT_GestureUnlockViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GestureUnlockViewController.h"
#import "PCCircleView.h"
#import "PCCircleViewConst.h"
#import "PCCircleInfoView.h"
#import "PCCircle.h"
#import "CMT_GestureShakeLabel.h"
#import "CMT_NavigationController.h"
#import "CMT_AccountSafeViewController.h"
#import "CMT_VerificationViewController.h"
#import "CMT_LoginViewController.h"

@interface CMT_GestureUnlockViewController ()<CircleViewDelegate>
/** 重设按钮 */
@property (nonatomic, strong) UIButton *resetBtn;
/** 提示label */
@property (nonatomic,strong)CMT_GestureShakeLabel *msgLabel;
/** logo头像 */
@property (nonatomic,strong)UIImageView *logoImg;
/** 重绘 */
@property (nonatomic,strong)UIButton *againDisplayBtn;
/** 跳过 */
@property (nonatomic,strong)UIButton *jumpBtn;
/** 解锁界面 */
@property (nonatomic, strong) PCCircleView *lockView;
/** 忘记密码 */
@property (nonatomic,strong) UIButton *forgetBtn;
/** 顶部输入指示view */
@property (nonatomic, strong) PCCircleInfoView *infoView;
/** titleLabel */
@property (nonatomic,strong)UILabel *titleLabel;
/** 其他账号登录 */
@property (nonatomic,strong)UIButton *otherAccountBtn;
/** 日期 */
@property (nonatomic,strong)UILabel *dateLabel;
/** 每日一句 */
@property (nonatomic,strong)UILabel *everySay;
@end

@implementation CMT_GestureUnlockViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    if (self.type == GestureViewControllerTypeLogin) {
        [self loadMyData];
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:ThemeBlueColor];
    // 初始化ui界面
    [self setupSubViewsSettingVc];
    [self hideSubViews:self.type];
}
#pragma mark -- 每日一句加载数据
- (void)loadMyData{
    
    [CMT_ProcessTheDataTool getEveryOneSay:[CMT_AccountTool accountModel].userId withBlock:^(CMT_EveryDayOneSayModel *myModel, NSError *error) {
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                self.dateLabel.text = myModel.nowDate;
                self.everySay.text = myModel.everydaySentence;
            }
        }
    }];
}
#pragma mark - 设置手势密码界面
- (void)setupSubViewsSettingVc{
    
    self.againDisplayBtn = [CMT_Tools getButtonWithFrame:CGRectMake(20, 30, 80, 30) BackGroudColor:[UIColor clearColor ] Title:@"重新绘制" TitleColor:CommonWhiteColor textFont:14];
    [self.againDisplayBtn addTarget:self action:@selector(againDisplayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.againDisplayBtn.hidden = YES;
    [self.view addSubview:self.againDisplayBtn];
    
    self.jumpBtn = [CMT_Tools getButtonWithFrame:CGRectMake(12, 30, 50, 30) BackGroudColor:[UIColor clearColor] Title:@"返回" TitleColor:CommonWhiteColor textFont:14];
    self.jumpBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.jumpBtn addTarget:self action:@selector(backToVc) forControlEvents:UIControlEventTouchUpInside];
    self.jumpBtn.hidden = YES;
    [self.view addSubview:self.jumpBtn];
    
    UILabel *myTitleLabel = [CMT_Tools getLabel:@"设置手势密码" textFont:18 viewFrame:CGRectMake((CMT_ScreenWidth - 200)  / 2, 107 * CMT_6plusPERCENTY, 200, 20) textAlignments:NSTextAlignmentCenter textColors:CommonWhiteColor];
    myTitleLabel.hidden = YES;
    self.titleLabel = myTitleLabel;
    [self.view addSubview:self.titleLabel];

    PCCircleInfoView *infoView = [[PCCircleInfoView alloc] init];
    infoView.frame = CGRectMake((CMT_ScreenWidth - 40 * CMT_6PERCENTY)/2, myTitleLabel.bottom + 40 * CMT_6PERCENTY, 40 * CMT_6PERCENTY, 40 * CMT_6PERCENTY);
    self.infoView = infoView;
    self.infoView.hidden = YES;
    [self.view addSubview:infoView];

    self.logoImg = [[UIImageView alloc] initWithFrame:CGRectMake((CMT_ScreenWidth - 60 * CMT_6PERCENTY)/2, 88 * CMT_6PERCENTY, 60 * CMT_6PERCENTY, 60 * CMT_6PERCENTY)];
    self.logoImg.image = [UIImage imageNamed:@"CMT_Logo"];
    self.logoImg.hidden = YES;
    [self.view addSubview:self.logoImg];
    
    UILabel *dateLabel = [CMT_Tools getLabel:@"" textFont:12 viewFrame:CGRectMake((CMT_ScreenWidth - 200)  / 2, self.logoImg.bottom + 15 * CMT_6plusPERCENTY, 200, 20 ) textAlignments:NSTextAlignmentCenter textColors:CommonWhiteColor];
    dateLabel.hidden = YES;
    self.dateLabel = dateLabel;
    [self.view addSubview:self.dateLabel];
    
    
    self.msgLabel = [[CMT_GestureShakeLabel alloc] initWithFrame:CGRectMake(0, infoView.bottom + 41 * CMT_6plusPERCENTY, CMT_ScreenWidth, 25)];
    self.msgLabel.textColor = CommonWhiteColor;
    self.msgLabel.text = @"";
    [self.view addSubview:self.msgLabel];
    
    // 解锁界面
    PCCircleView *lockView = [[PCCircleView alloc] init];
    lockView.delegate = self;
    self.lockView = lockView;
    [self.view addSubview:lockView];
    
    UILabel *everySayLabel = [CMT_Tools getLabel:@"" textFont:[CMT_Tools fontDeviceFit:18] viewFrame:CGRectMake((CMT_ScreenWidth - lockView.width + 95*CMT_6plusPERCENTY)/2, self.dateLabel.bottom + 32 * CMT_6plusPERCENTY, lockView.width - 80*CMT_6plusPERCENTY, 60) textAlignments:NSTextAlignmentCenter textColors:CommonWhiteColor];
    everySayLabel.hidden = YES;
    everySayLabel.numberOfLines = 2;
    everySayLabel.textAlignment = NSTextAlignmentCenter;
    self.everySay = everySayLabel;
    [self.view addSubview:self.everySay];
    
    self.forgetBtn = [CMT_Tools getButtonWithFrame:CGRectMake(20, CMT_ScreenHeight - 66 * CMT_6PERCENTY, 100, 30 * CMT_6PERCENTY) BackGroudColor:[UIColor clearColor ] Title:@"忘记手势密码" TitleColor:CommonWhiteColor textFont:14];
    self.forgetBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [ self.forgetBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.forgetBtn.hidden = YES;
    [self.view addSubview:self.forgetBtn];
   
    self.otherAccountBtn = [CMT_Tools getButtonWithFrame:CGRectMake(CMT_ScreenWidth - 20 - 100, CMT_ScreenHeight - 66 * CMT_6PERCENTY, 100, 30 * CMT_6PERCENTY) BackGroudColor:[UIColor clearColor ] Title:@"其他账号登录" TitleColor:CommonWhiteColor textFont:14];
    self.otherAccountBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [ self.otherAccountBtn addTarget:self action:@selector(otherAccountLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.otherAccountBtn.hidden = YES;
    [self.view addSubview:self.otherAccountBtn];
    
}
- (void)hideSubViews:(GestureViewControllerType)type{
    //登录认证
    if (type == GestureViewControllerTypeLogin){
        self.jumpBtn.hidden = YES;
        self.titleLabel.hidden = YES;
        self.infoView.hidden = YES;
        self.msgLabel.hidden = YES;
        self.forgetBtn.hidden = NO;
        self.otherAccountBtn.hidden = NO;
        self.logoImg.hidden = NO;
        self.everySay.hidden = NO;
        self.dateLabel.hidden = NO;
        [self.lockView setType:CircleViewTypeLogin];
    }else if(type == GestureViewControllerTypeSetting){
        self.jumpBtn.hidden = YES;
        self.everySay.hidden = YES;
        self.dateLabel.hidden = YES;
        self.titleLabel.hidden = NO;
        self.infoView.hidden = NO;
        self.logoImg.hidden = YES;
        self.forgetBtn.hidden = YES;
        self.otherAccountBtn.hidden = YES;
        self.msgLabel.text = @"请绘制手势密码";
        self.titleLabel.text = @"设置手势密码";
        [self.lockView setType:CircleViewTypeSetting];

    }else{
        self.jumpBtn.hidden = NO;
        self.everySay.hidden = YES;
        self.dateLabel.hidden = YES;
        self.titleLabel.hidden = NO;
        self.infoView.hidden = YES;
        self.logoImg.hidden = YES;
        self.forgetBtn.hidden = YES;
        self.otherAccountBtn.hidden = YES;
        self.msgLabel.text = @"";
        self.titleLabel.text = @"请输入原手势密码";
        [self.lockView setType:CircleViewTypeLogin];
    }
}
#pragma mark - 修改返回
- (void)backToVc{
    CMT_NAV_BACK;
}
#pragma mark -- 其他账号登录
- (void)otherAccountLoginBtnClick{
    [CMT_AccountTool removeEmptyAccountData];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cleatUserAccountDate" object:nil];
    CMT_LoginViewController *loginVc = [[CMT_LoginViewController alloc]init];
    loginVc.diffType = CMT_LOGINTYPE;
    loginVc.enterLoginType = CMTEnterLoginTypeDefaut;
    loginVc.preVc = self;
    [self.navigationController pushViewController:loginVc animated:YES];
}
#pragma mark -- 忘记密码点击事件
- (void)forgetBtnClick{
    CMT_VerificationViewController *verificationVc = [[CMT_VerificationViewController alloc] init];
    verificationVc.comeFromType = CMT_ForgotGestPwd;
    verificationVc.enterLoginType = self.enterLoginType;
    verificationVc.preVc = self.preVc;
    [self.navigationController pushViewController:verificationVc animated:YES];
}
#pragma mark 重新绘制点击事件
- (void)againDisplayBtnClick{
    // 2.infoView取消选中
    [self infoViewDeselectedSubviews];
    // 重新绘制
    [PCCircleViewConst saveGesture:nil Key:gestureOneSaveKey];
    self.msgLabel.text = @"您好，请绘制手势密码";
    [self.lockView setType:CircleViewTypeSetting];
}
#pragma mark -- 跳过按钮点击事件
- (void)jumpBtnClick
{
    //登录或者注册来源
    if (self.comeFromType == CMT_ComeRegister || self.comeFromType == CMT_LoginClassNoGes) {
        if(_enterLoginType == CMTEnterLoginTypeTabbarMy){
            [self dismissViewControllerAnimated:YES completion:nil];
            CMT_RootVC.selectedIndex = 3;
        }else if(_enterLoginType == CMTEnterLoginTypeDefaut){
            [_preVc.navigationController popToRootViewControllerAnimated:YES];
        }else if(_enterLoginType == CMTEnterLoginTypeSingleLoginOut){
            [self dismissViewControllerAnimated:YES completion:nil];
            [_preVc.navigationController popToRootViewControllerAnimated:YES];
            CMT_RootVC.selectedIndex = 0;
        }
        if (self.comeFromType == CMT_ComeRegister) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"toRegisterAlert" object:nil];
        }
    }else if(self.comeFromType == CMT_AccountSafe){//账户安全来源
       [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[1] animated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
        [_preVc.navigationController popToRootViewControllerAnimated:YES];
    }
}
#pragma mark - circleView - delegate - setting
- (void)circleView:(PCCircleView *)view type:(CircleViewType)type connectCirclesLessThanNeedWithGesture:(NSString *)gesture
{
    NSString *gestureOne = [PCCircleViewConst getGestureWithKey:gestureOneSaveKey];
    
    // 看是否存在第一个密码
    if ([gestureOne length]) {
        [self.msgLabel showWarnMsgAndShake:gestureTextDrawAgainError];//文字提示
    } else {
        CMT_Log(@"密码长度不合法%@", gesture);
        [self.msgLabel showWarnMsgAndShake:gestureTextConnectLess];
    }
}
- (void)circleView:(PCCircleView *)view type:(CircleViewType)type didCompleteSetFirstGesture:(NSString *)gesture
{
    CMT_Log(@"获得第一个手势密码%@", gesture);
    self.againDisplayBtn.hidden = NO;
    [self.msgLabel showWarnMsg:gestureTextDrawAgain];
    [self infoViewSelectedSubviewsSameAsCircleView:view]; //infoView展示对应选中的圆
}
- (void)circleView:(PCCircleView *)view type:(CircleViewType)type didCompleteSetSecondGesture:(NSString *)gesture result:(BOOL)equal
{
    CMT_Log(@"获得第二个手势密码%@",gesture);
    if (equal) {
        CMT_Log(@"两次手势匹配！可以进行本地化保存了");
        [self.msgLabel showWarnMsg:gestureTextSetSuccess];
        [PCCircleViewConst saveGesture:gesture Key:gestureFinalSaveKey];
        
        CMT_GesturesPwdModel *gesPwdModel = [[CMT_GesturesPwdModel alloc]init];
        gesPwdModel.gesturePwd = gesture;
        gesPwdModel.openState = 1;
        [CMT_GesturesPasswordTool save:gesPwdModel];
        [self jumpBtnClick];//跳转
        
    } else {
        CMT_Log(@"两次手势不匹配！");
        [self.msgLabel showWarnMsgAndShake:gestureTextDrawAgainError];
    }
}
#pragma mark - circleView - delegate - login or verify gesture
- (void)circleView:(PCCircleView *)view type:(CircleViewType)type didCompleteLoginGesture:(NSString *)gesture result:(BOOL)equal
{
    // 此时的type有两种情况 Login or verify
    if (type == CircleViewTypeLogin) {
        
        if (equal) {
            CMT_Log(@"登陆成功！");
            if (self.type == GestureViewControllerTypeLogin) {
                [self jumpBtnClick];//跳转
            }else{
                [PCCircleViewConst saveGesture:nil Key:gestureOneSaveKey];
                [self hideSubViews:GestureViewControllerTypeSetting];
            }
        } else {
            CMT_Log(@"密码错误！");
            [self.msgLabel showWarnMsgAndShake:@"手势密码错误"];

        }
    } else if (type == CircleViewTypeVerify) {
        
        self.lockView.userInteractionEnabled = YES;
        
        if (equal) {
            CMT_Log(@"验证成功，跳转到设置手势界面");
            self.msgLabel.text = @"请输入新手势密码";
            self.forgetBtn.hidden = YES;
            [self.lockView setType:CircleViewTypeSetting];
        }
    }
}
- (void)circleViewNotFourTap:(NSString *)type
{
    if ([type isEqualToString:@"LOGIN"]) {
        [self.msgLabel showWarnMsgAndShake:gestureTextConnectLess];
    }else if([type isEqualToString:@"REPEAT"]){
        [self.msgLabel showWarnMsgAndShake:@"新手势密码不能和原手势密码相同"];
    }
}
#pragma mark - infoView展示方法
#pragma mark - 让infoView对应按钮选中
- (void)infoViewSelectedSubviewsSameAsCircleView:(PCCircleView *)circleView
{
    for (PCCircle *circle in circleView.subviews) {
        
        if (circle.state == CircleStateSelected || circle.state == CircleStateLastOneSelected) {
            
            for (PCCircle *infoCircle in self.infoView.subviews) {
                if (infoCircle.tag == circle.tag) {
                    [infoCircle setState:CircleStateSelected];
                }
            }
        }
    }
}
#pragma mark - 让infoView对应按钮取消选中
- (void)infoViewDeselectedSubviews
{
    [self.infoView.subviews enumerateObjectsUsingBlock:^(PCCircle *obj, NSUInteger idx, BOOL *stop) {
        [obj setState:CircleStateNormal];
    }];
}

@end
