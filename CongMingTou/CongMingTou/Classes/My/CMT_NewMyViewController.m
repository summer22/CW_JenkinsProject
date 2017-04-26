//
//  CMT_NewMyViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_NewMyViewController.h"
#import "CMT_MySettingHeadView.h"
#import "CMT_MyTableViewCell.h"
#import "CMT_FLJinViewController.h"
#import "CMT_MySusuViewController.h"
#import "CMT_MyModel.h"
#import "CMT_RechargeViewController.h"
#import "CMT_ReflectViewController.h"
#import "CMT_RealNameBindCardViewController.h"
#import "CMT_AccountSafeViewController.h"
#import "CMT_SetDealPassViewController.h"
#import "CMT_MySusuViewController.h"
#import "CMT_RedViewController.h"
#import "CMT_DealRecordViewController.h"
#import "CMT_RealNameBindCardResultViewController.h"

@interface CMT_NewMyViewController ()<CMT_MySettingHeadViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTable;
/** 头部视图 */
@property (nonatomic,strong) CMT_MySettingHeadView *tableHeadView;
/** 我的数据源 */
@property (nonatomic,strong)CMT_MyModel *model;
/** 导航条右上角消息按钮 */
@property (nonatomic,strong)UIButton *rightNavItemBtn;
@end

@implementation CMT_NewMyViewController

- (CMT_MySettingHeadView *)tableHeadView{
    if (!_tableHeadView) {
        _tableHeadView = [[CMT_MySettingHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 335)];
        _tableHeadView.delegate = self;
    }
    return _tableHeadView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;

    if ([CMT_AccountTool accountModel]) {
        [self loadMyData];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if ([CMT_AccountTool accountModel]) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    }
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault;
}

#pragma mark - 加载数据
- (void)loadMyData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getMyDataUid:[CMT_AccountTool accountModel].userId withBlock:^(CMT_MyModel *myModel, NSError *error) {
        [self.myTable.mj_header endRefreshing];
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                weakSelf.model = myModel;
                [weakSelf setRightNavBarItemStatus:weakSelf.model.unReadCounts];
                [weakSelf.tableHeadView setMyDataModel: weakSelf.model];
                [weakSelf.myTable reloadData];
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

- (void)pullDownLoadData{
    [self loadMyData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBar];
    
    self.myTable.tableHeaderView = self.tableHeadView;
    self.myTable.contentInset = UIEdgeInsetsMake(-64, 0, CMT_TAB_Height, 0);

    self.myTable.sectionHeaderHeight = 7;
    self.myTable.sectionFooterHeight = 1;
    self.myTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownLoadData)];
}

- (void)setNavBar{
    self.navigationItem.title = @"";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"设置" WithImageName:@"CMT_Setting" buttonContentType:CMT_ButtonEdgeInsetsStyleTop itemBtnDerictor:@"left" target:self action:@selector(toSetting)];
    
    _rightNavItemBtn = [CMT_Tools itemWithTitle:@"消息" WithImageName:@"CMT_NewMes_Normal" buttonContentType:CMT_ButtonEdgeInsetsStyleTop target:self action:@selector(toMessage)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightNavItemBtn];
}

#pragma mark -- 导航条右侧消息显示状态
- (void)setRightNavBarItemStatus:(NSInteger )status{
    if(status > 0){
        [_rightNavItemBtn setImage:[UIImage imageNamed:@"CMT_NewMes_Selected"] forState:UIControlStateNormal];
    }else{
        [_rightNavItemBtn setImage:[UIImage imageNamed:@"CMT_NewMes_Normal"] forState:UIControlStateNormal];
    }
}

//设置
- (void)toSetting{
    CMT_NAV_PUSHTO_VC([[CMT_AccountSafeViewController alloc] init]);
}

//消息
- (void)toMessage{
    [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(FINDMAGETMSGLISHT, CMT_CREATE_URL([CMT_AccountTool accountModel].userId, @".htm")) title:@"消息"];
}
#pragma mark - CMT_MySettingHeadViewDelegate
//资产整合
- (void)toLookZC{
    [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(MYZICHAN, CMT_CREATE_URL([CMT_AccountTool accountModel].userId, @".htm")) title:@"资金统计"];
}
//提现
- (void)toReflectClick{
    
    if ([[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
        if ([[CMT_AccountTool accountModel].payPasswordState isEqualToString:@"1"]) {
            CMT_ReflectViewController *reflectVc = [[CMT_ReflectViewController alloc] initWithNibName:@"CMT_ReflectViewController" bundle:nil];
            [self.navigationController pushViewController:reflectVc animated:YES];
        }else{
            CMT_SetDealPassViewController *setDealVc = [[CMT_SetDealPassViewController alloc] init];
            setDealVc.diffType = CMT_SetDealPwd;
            setDealVc.comeFromType = CMT_MyClass;
            [self.navigationController pushViewController:setDealVc animated:YES];
        }
    }else{
        CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
        realName.fromType = CMTEnterRealNameShareResultTypeMy;
        [self.navigationController pushViewController:realName animated:YES];
    }
}
//充值
- (void)toRechargeClick{
    if ([[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
        if ([[CMT_AccountTool accountModel].payPasswordState isEqualToString:@"1"]) {
            CMT_RechargeViewController *rechargeVc = [[CMT_RechargeViewController alloc] initWithNibName:@"CMT_RechargeViewController" bundle:nil];
            [self.navigationController pushViewController:rechargeVc animated:YES];
        }else{
            CMT_SetDealPassViewController *setDealVc = [[CMT_SetDealPassViewController alloc] init];
            setDealVc.diffType = CMT_SetDealPwd;
            setDealVc.comeFromType = CMT_MyClass;
            [self.navigationController pushViewController:setDealVc animated:YES];
        }
    }else{
        CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
        realName.fromType = CMTEnterRealNameShareResultTypeMy;
        [self.navigationController pushViewController:realName animated:YES];
    }
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 2) {
        return 1;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_MyTableViewCell *cell = [CMT_MyTableViewCell cellWithTablebView:tableView index:indexPath];
    cell.backgroundColor = CommonWhiteColor;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [cell setModel:self.model index:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 48 ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {//累计收益 - h5(资产总额)
                [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(MYZICHAN, CMT_CREATE_URL([CMT_AccountTool accountModel].userId, CMT_CREATE_URL(@".htm",@"?showView=sygl"))) title:@"资金统计"];
            }else if (indexPath.row == 1){//我的速速赚
                CMT_MySusuViewController *susuVc = [[CMT_MySusuViewController alloc] init];
                susuVc.myDiffType = CMT_SUSUTYPE;
                CMT_NAV_PUSHTO_VC(susuVc);
            }else if (indexPath.row == 2){//我的月月息
                CMT_MySusuViewController *susuVc = [[CMT_MySusuViewController alloc] init];
                susuVc.myDiffType = CMT_YUETYPE;
                CMT_NAV_PUSHTO_VC(susuVc);
            }
            break;
        case 1:
            if (indexPath.row == 0) {//福利金
                CMT_NAV_PUSHTO_VC([[CMT_FLJinViewController alloc] init]);
            }else if (indexPath.row == 1){//加息券
                CMT_RedViewController *ticketsVc = [[CMT_RedViewController alloc] init];
                ticketsVc.diffType = COUPON;
                ticketsVc.comeFromType = OTHERDETAULT;
                [self.navigationController pushViewController:ticketsVc animated:YES];
            }else if (indexPath.row == 2){//红包
                CMT_RedViewController *ticketsVc = [[CMT_RedViewController alloc] init];
                ticketsVc.diffType = REDTICKIT;
                ticketsVc.comeFromType = OTHERDETAULT;
                [self.navigationController pushViewController:ticketsVc animated:YES];
            }
            break;
        case 2:
            if (indexPath.row == 0) {//交易记录
                CMT_DealRecordViewController *dealRecordVc = [[CMT_DealRecordViewController alloc] init];
                [self.navigationController pushViewController:dealRecordVc animated:YES];
            }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
