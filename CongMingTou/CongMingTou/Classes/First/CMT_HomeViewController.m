//
//  CMT_HomeViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_HomeViewController.h"
#import "versionAlert.h"
#import "AdvertiseViewController.h"
#import "CMT_HeadView.h"
#import "CMT_BidTableViewCell.h"
#import "CMT_InvestDetailViewController.h"
#import "CMT_SignInDetailViewController.h"
#import "CMT_RegisterSucessAlertView.h"
#import "CMT_homeModel.h"
#import "CMT_BidPlanModel.h"
#import "CMT_LoginViewController.h"
#import "CMT_HomeFooterView.h"
#import "CMT_HomeAlertView.h"
#import "CMT_HomeAlertModel.h"
#import "AppDelegate.h"
#import "AdvertiseView.h"

@interface CMT_HomeViewController ()<CMT_RegisterSucessAlertViewDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,CMT_HeadViewDelegate,CMT_HomeAlertViewDelegate>
/** 下载地址 */
@property (nonatomic,copy)NSString *downloadUrl;
/** 头部视图 */
@property (nonatomic,strong) CMT_HeadView *tableHeadView;
/** tableView */
@property (nonatomic,strong) UITableView *homeTable;
/** 数据源 */
@property (nonatomic,strong) CMT_homeModel *homeModel;
/** 导航条右上角消息按钮 */
@property (nonatomic,strong)UIButton *rightNavItemBtn;
/** 脚部视图 */
@property (nonatomic,strong)CMT_HomeFooterView *tableFooterView;
/** 自定义导航条 */
@property (nonatomic,strong)UIImageView *customNavView;
/** 状态栏变化标识 */
@property (nonatomic,copy)NSString *statusBarFlag;
/** 弹窗广告数据源 */
@property (nonatomic,strong)CMT_HomeAlertModel *homeAlertModel;
@end
  
@implementation CMT_HomeViewController
//懒加载 头视图
- (CMT_HeadView *)tableHeadView{
    if (!_tableHeadView) {
        _tableHeadView = [[CMT_HeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, (200 + 80)* CMT_6PERCENTY + 16 + 36)];
        _tableHeadView.delegate = self;
        _tableHeadView.backgroundColor = [UIColor clearColor];
    }
    return _tableHeadView;
}
- (UIImageView *)customNavView
{
    if (!_customNavView) {
        _customNavView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 64)];
        _customNavView.backgroundColor = CommonWhiteColor;
        _customNavView.alpha = 0;
        UILabel *titleLable = [CMT_Tools getLabel:@"首页" textFont:17 viewFrame:CGRectMake(0, 0, 100, 24) textAlignments:NSTextAlignmentCenter textColors:[UIColor blackColor]];
        titleLable.centerX = _customNavView.centerX;
        titleLable.centerY = _customNavView.centerY + 10;
        [_customNavView addSubview:titleLable];
    }
    return _customNavView;
}
//脚部视图
- (CMT_HomeFooterView *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = [[CMT_HomeFooterView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 70)];
    }
    return _tableFooterView;
}
#pragma mark -- 初始化tablebView
- (UITableView *)homeTable{
    if (!_homeTable) {
        _homeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight) style:UITableViewStyleGrouped];
        _homeTable.contentInset = UIEdgeInsetsMake(0, 0, CMT_TAB_Height, 0);
        _homeTable.delegate = self;
        _homeTable.dataSource = self;
        _homeTable.sectionFooterHeight = 7;
        _homeTable.showsVerticalScrollIndicator = NO;
        _homeTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownLoadData)];
        _homeTable.tableHeaderView = self.tableHeadView;
        _homeTable.tableFooterView = self.tableFooterView;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _homeTable;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    if (![self.statusBarFlag isEqualToString:@"UIStatusBarStyleDefault"]) {
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    }
    self.hidesBottomBarWhenPushed = NO;/* 解决pop问题*/
    [self getFirstData];
    [self getHomeAlertData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateVersion];//版本更新
    [self getHomeAlertData];
    self.navigationItem.title = @"";
    [self.view addSubview:self.homeTable];
    [self.view insertSubview:self.customNavView aboveSubview:self.homeTable];
   //启动广告使用的
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:@"pushtoad" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toRegisterAlert) name:@"toRegisterAlert" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cleatUserAccountDate) name:@"cleatUserAccountDate" object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"cleatUserAccountDate" object:nil];
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"toRegisterAlert" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"pushtoad" object:nil];
}

- (void)toRegisterAlert{
    [CMT_RegisterSucessAlertView showWithDelegateOwer:self];      //注册成功弹窗页面
}

- (void)cleatUserAccountDate{
    [self getFirstData]; //手势验证登录 -- 用其他账户登录
}

- (void)getHomeAlertData{
    if ([CMT_Tools getCurrentVC] && [CMT_Tools getCurrentView]) {
        [self homeAlertLoad];
    }
}

#pragma mark - 首页广告接口
- (void)homeAlertLoad{
    __weak  typeof(self) weakSelf = self;
    
    [CMT_ProcessTheDataTool showActivity:CMT_ShowActivity withBlock:^(CMT_HomeAlertModel *myModel, NSError *error) {
        
        if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
            weakSelf.homeAlertModel = myModel;
            NSString *flagOneStr = [[NSUserDefaults standardUserDefaults] objectForKey:[CMT_SETDEFAULTUSERID([CMT_AccountTool accountModel].userId) stringByAppendingString:[CMT_Tools compareHomeAlertTime:myModel.nowTime]]]; //通过key取值
            if (!flagOneStr) { //判断是否为空
                 [[NSUserDefaults standardUserDefaults] setValue:[CMT_Tools compareHomeAlertTime:myModel.nowTime] forKey:[CMT_SETDEFAULTUSERID([CMT_AccountTool accountModel].userId) stringByAppendingString:[CMT_Tools compareHomeAlertTime:myModel.nowTime]]]; //对应key存值
                
                NSString *flagTwoStr = [[NSUserDefaults standardUserDefaults] objectForKey:CMT_SETDEFAULTUSERID([CMT_AccountTool accountModel].userId)]; //通过key取值
                
                if ([myModel.type isEqualToString:@"2"]) {
                        
                    if (flagTwoStr.length > 0) {
                        return ;
                    }
                }
                [CMT_HomeAlertView showWithDelegateOwer:self typy:@"1" imageType:myModel.type amountMoney:@""]; //弹框
            }
        }
    }];
}

#pragma mark - 点击广告接口
- (void)clickAlertLoad{
    __weak  typeof(self) weakSelf = self;
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    NSString *redType = self.homeAlertModel.type;
    [CMT_ProcessTheDataTool showActivity:CMT_CREATE_URL(CMT_SERVER_URL,self.homeAlertModel.serviceUrl) withBlock:^(CMT_HomeAlertModel *myModel, NSError *error) {
        [weakSelf hideHud];
    if(!error){
        if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
            weakSelf.homeAlertModel = myModel;
            
            if ([redType isEqualToString:@"2"]) {
                [[NSUserDefaults standardUserDefaults] setValue:@"flag" forKey:CMT_SETDEFAULTUSERID([CMT_AccountTool accountModel].userId)]; //对应key存值
            }
            [CMT_HomeAlertView showWithDelegateOwer:weakSelf typy:@"2" imageType:nil amountMoney:self.homeAlertModel.amount];
        }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
            [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
        }else{
            [self showHint:myModel.msg];
        }
     }else{
        [self showHint:CMT_Error_NotNetWork];
     }
    }];
}

#pragma mark --- 版本更新
- (void)updateVersion
{
    __weak  typeof(self) weakSelf = self;
    [CMT_ProcessTheDataTool getUpdateVersion:^(CMT_MyUpVersionModel *myModel, NSError *error) {
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [versionAlert versionShow:myModel.versionDataModel target:weakSelf];
                weakSelf.downloadUrl = myModel.versionDataModel.url;
            }
        }
    }];
}
#pragma mark -- alertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *btnTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([btnTitle isEqualToString:@"版本更新"]) {
        NSURL *url = [NSURL URLWithString:self.downloadUrl];
        [[UIApplication sharedApplication] openURL:url];
    }
}

#pragma mark -- tableviewscrollviewdelegate 设置导航条透明度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    self.customNavView.alpha = offsetY/30 * CMT_6plusPERCENTY;
    if (self.customNavView.alpha >= 0.6) {
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault;
        self.statusBarFlag = @"UIStatusBarStyleDefault";
    }else{
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
        self.statusBarFlag = @"UIStatusBarStyleLightContent";
    }
}

//获取页面数据
- (void)getFirstData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getFirstDateBlock:^(CMT_homeModel *homeModel, NSError *error) {
        [weakSelf hideHud];
        [_homeTable.mj_header endRefreshing];
        if(!error){
            if([[NSString stringWithFormat:@"%@",homeModel.status] isEqualToString:@"1"]){
                weakSelf.homeModel = homeModel;
                [weakSelf.tableHeadView setModel:homeModel];
                [weakSelf.tableFooterView setStrData:homeModel.totalInvestAmount];
                [weakSelf.homeTable reloadData];
            }else if ([[NSString stringWithFormat:@"%@",homeModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [self showHint:homeModel.msg];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}

//下拉刷新
- (void)pullDownLoadData{
    [self getFirstData];
}

#pragma mark - 查看消息
- (void)toMessage{
    if(![CMT_AccountTool accountModel]){
        [self toLoginVc:CMT_LOGINTYPE];
    }else{
        [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(FINDMAGETMSGLISHT, CMT_CREATE_URL([CMT_AccountTool accountModel].userId, @".htm")) title:@"消息"];
    }
}

- (void)toLoginVc:(CMT_LOGINORREGISTERTYPE)type{
    CMT_LoginViewController *loginVc = [[CMT_LoginViewController alloc]init];
    loginVc.diffType = type;
    loginVc.enterLoginType = CMTEnterLoginTypeDefaut;
    loginVc.preVc = self;
    [self.navigationController pushViewController:loginVc animated:YES];
}

#pragma mark -- 跳转到广告详情页
- (void)pushToAd {
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"LINEKURL"] length] > 0) {
        CMT_NAV_PUSHTO_VC([[AdvertiseViewController alloc] init]);
    }
}

#pragma mark - CMT_HeadViewDelegate 
//轮播图跳转到页面
- (void)cycleScrollViewSelectBtnClick:(CMT_LunBoModel *)model{
    if (model.linkUrl) {
        [CMT_Tools pushPickdH5:self :UrlNewinesdelist str:model.linkUrl title:@""];
    }
}
//公告选择
- (void)cycleTitleScrollSelectClick:(CMT_MyGongGModel *)model{
    [CMT_Tools pushPickdH5:self :UrlHeadlinesdetails str:CMT_CREATE_URL(FINDMAINPLATFORMDETAIL, CMT_CREATE_URL(model.platFormNewsId, @".htm")) title:@"公告详情"];
}
//点击了公告图片
- (void)gongGaoImgTapClick{
    if (self.homeModel.gongGaoArr.count>0) {
        [CMT_Tools pushPickdH5:self :UrlHeadlineslisht str:FINDMANIPLATFORMLISTC title:@"公告列表"];
    }
}
//去签到
- (void)toSignBtnClick{
    if (![CMT_AccountTool accountModel]) {
        [self toLoginVc:CMT_LOGINTYPE];
    }else{
        CMT_SignInDetailViewController *vc = [[CMT_SignInDetailViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
//去查看保障计划
- (void)toSafeAgreementBtnClick{
    [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(SAFERULE,@".htm") title:@"安全保障"];
}

#pragma mark -- CMT_RegisterSucessAlertViewDelegate
- (void)toOpenBtnClick{

}

#pragma mark - CMT_HomeAlertViewDelegate
- (void)clickAlertAction{
    
    if(![CMT_AccountTool accountModel]){
        [CMT_HomeAlertView removeSelf];
        [self toLoginVc:CMT_LOGINTYPE];
    }else{
        [self clickAlertLoad];
    }
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _homeModel.bidPlanArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_BidTableViewCell *cell = [CMT_BidTableViewCell cellWithTablebView:tableView];
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [cell setModel:_homeModel.bidPlanArr[indexPath.section]];
    cell.tag = indexPath.section;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 136 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return 1;//这里设置其他部分的头视图高度为10
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    CMT_InvestDetailViewController *vc = [[CMT_InvestDetailViewController alloc] init];
    if ([[_homeModel.bidPlanArr[indexPath.section] planType] isEqualToString:@"0"]) {
        vc.bidPlanType = CMTNewBidPlan;
    }else if([[_homeModel.bidPlanArr[indexPath.section] planType] isEqualToString:@"1"]){
        vc.bidPlanType = CMTSusuBidPlan;
    }else {
        vc.bidPlanType = CMTYyBidPlan;
    }
    vc.planId = [_homeModel.bidPlanArr[indexPath.section] planId];
    vc.fromType = CMTEnterRealNameShareResultTypeHome;
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
