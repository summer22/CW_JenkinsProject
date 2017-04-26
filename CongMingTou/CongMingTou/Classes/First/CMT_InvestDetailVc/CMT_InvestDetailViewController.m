
//
//  CMT_InvestDetailViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestDetailViewController.h"
#import "CMT_InvestDetailTableViewCell.h"
#import "CMT_InvestDetailHeadView.h"
#import "CMT_BottomBtnView.h"
#import "CMT_CalculatorViewController.h"
#import "CMT_InvestDetailModel.h"
#import "CMT_InvestRecordListViewController.h"
#import "CMT_MakeSureViewController.h"
#import "CMT_SetDealPassViewController.h"
#import "CMT_RealNameBindCardViewController.h"
#import "CMT_LoginViewController.h"
#import "CMT_FuliMakeSureViewController.h"

@interface CMT_InvestDetailViewController ()<UITableViewDataSource,UITableViewDelegate,CMT_BottomBtnViewDelegate>
/** tableView */
@property (nonatomic,strong)UITableView *detailTable;
/** 列表数据源 */
@property (nonatomic,strong)NSArray *listTitleArr;
/** 头部视图 */
@property (nonatomic,strong)CMT_InvestDetailHeadView *tableHeadView;
/** 底部视图 */
@property (nonatomic,strong)CMT_BottomBtnView *bottomView;
/** 数据源 */
@property (nonatomic,strong)CMT_InvestDetailModelData *model;
/** 投资人数 */
@property (nonatomic,copy)NSString *hadInvestNumb;

@end

@implementation CMT_InvestDetailViewController

#pragma mark - 懒加载头部视图
- (CMT_InvestDetailHeadView *)tableHeadView{
    if (!_tableHeadView) {
        _tableHeadView = [[CMT_InvestDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 405)];
    }
    return _tableHeadView;
}

- (CMT_BottomBtnView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[CMT_BottomBtnView alloc] initWithFrame:CGRectMake(0, CMT_ScreenHeight - 68 - 64, CMT_ScreenWidth, 68)];
        _bottomView.delegate = self;
    }
    return _bottomView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (!self.model.loanSchedule) {
        [self getInvestDetailData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *titleStr;
    if (self.bidPlanType == CMTNewBidPlan) {
        titleStr = @"新手福利介绍";
    }else if(self.bidPlanType == CMTSusuBidPlan){
        titleStr = @"速速赚产品介绍";
    }else{
        titleStr = @"月月息产品介绍";
    }
    _listTitleArr = @[@"投资记录",titleStr,@"安全保障"];

    [self createFinancialTable];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"CMT_Calculator" target:self action:@selector(toCalculator)];
    self.hadInvestNumb = @"0";
}

#pragma mark -- 下拉刷新
- (void)pullDownLoadData{
    [self getInvestDetailData];
}

//获取页面数据
- (void)getInvestDetailData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getInvestDetailData:[CMT_AccountTool accountModel].userId withBid:self.planId withBlock:^(CMT_InvestDetailModel*investDetailModel, NSError *error) {
        [weakSelf hideHud];
        [_detailTable.mj_header endRefreshing];
        if(!error){
            if([[NSString stringWithFormat:@"%@",investDetailModel.status] isEqualToString:@"1"]){
                weakSelf.model = investDetailModel.plans;
                [weakSelf.tableHeadView setModel:weakSelf.model withType:weakSelf.bidPlanType];
                weakSelf.hadInvestNumb = weakSelf.model.hadInvestNumber;
                weakSelf.title = [weakSelf.model.planTitle stringByAppendingString:@"详情"];
                [weakSelf.detailTable reloadData];
                if ([weakSelf.model.couldInvestFlag isEqualToString:@"0"]) {
                    weakSelf.bottomView.btn.userInteractionEnabled = NO;
                    [weakSelf.bottomView.btn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
                }else{
                    [weakSelf.bottomView.btn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailQIangG"] forState:UIControlStateNormal];
                    weakSelf.bottomView.btn.userInteractionEnabled = YES;
                }
            }else if ([[NSString stringWithFormat:@"%@",investDetailModel.status] isEqualToString:CMT_SinglePointCode]){
                                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
                weakSelf.bottomView.btn.userInteractionEnabled = NO;
            }else{
                weakSelf.bottomView.btn.userInteractionEnabled = NO;
                [weakSelf showHint:investDetailModel.msg];
            }
        }else{
            weakSelf.bottomView.btn.userInteractionEnabled = NO;
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark -- 计算器
- (void)toCalculator{
    CMT_CalculatorViewController *calculatorVc = [[CMT_CalculatorViewController alloc] init];
    calculatorVc.selectPeriod = self.model.period;
    calculatorVc.bidPlanType = self.bidPlanType;
    CMT_NAV_PUSHTO_VC(calculatorVc);
}

#pragma mark -- CMT_BottomBtnViewDelegate
-(void)toPayBtnAction{
    
    if ([CMT_AccountTool accountModel]) {
        if ([[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
            if ([[CMT_AccountTool accountModel].payPasswordState isEqualToString:@"1"]) {
                if (self.bidPlanType == CMTNewBidPlan) {
                    CMT_FuliMakeSureViewController *makeSureVc = [[CMT_FuliMakeSureViewController alloc] init];
                    makeSureVc.planId = self.planId;
                    makeSureVc.bidId =  self.model.bidId;
                    [self.navigationController pushViewController:makeSureVc animated:YES];
                }else{
                    CMT_MakeSureViewController *makeSureVc = [[CMT_MakeSureViewController alloc] init];
                    makeSureVc.bidPlanType = self.bidPlanType;
                    makeSureVc.planId = self.planId;
                    makeSureVc.bidId =  self.model.bidId;
                    [self.navigationController pushViewController:makeSureVc animated:YES];
                }
            }else{
                CMT_SetDealPassViewController *reflectVc = [[CMT_SetDealPassViewController alloc] init];
                reflectVc.diffType = CMT_SetDealPwd;
                [self.navigationController pushViewController:reflectVc animated:YES];
            }
        }else{
            CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
            realName.fromType = self.fromType;
            [self.navigationController pushViewController:realName animated:YES];
        }

    }else{
        CMT_LoginViewController *loginVc = [[CMT_LoginViewController alloc] init];
        loginVc.diffType = CMT_LOGINTYPE;
        loginVc.enterLoginType = CMTEnterLoginTypeDefaut;
        loginVc.preVc = self;
        [self.navigationController pushViewController:loginVc animated:YES];
    }
}

#pragma mark -- 初始化tablebView
- (void)createFinancialTable{
    _detailTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - 64 - 68) style:UITableViewStylePlain];
    _detailTable.delegate = self;
    _detailTable.dataSource = self;
    _detailTable.backgroundColor = [UIColor clearColor];
    _detailTable.tableHeaderView = self.tableHeadView;
    _detailTable.tableHeaderView.height = 405;
    _detailTable.showsVerticalScrollIndicator = NO;
    _detailTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownLoadData)];
    [self.view addSubview:_detailTable];
    [self.view insertSubview:self.bottomView aboveSubview:self.detailTable];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_InvestDetailTableViewCell *cell = [CMT_InvestDetailTableViewCell cellWithTablebView:tableView index:indexPath];
    cell.investPeoCount.text = [NSString stringWithFormat:@"%@人已投资",self.hadInvestNumb];
    cell.titleLabel.text = _listTitleArr[indexPath.row];
    cell.backgroundColor = CommonWhiteColor;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
  
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50 ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 0) {
        CMT_InvestRecordListViewController *investRecordListVc = [[CMT_InvestRecordListViewController alloc] init];
        investRecordListVc.palnId = self.planId;
        [self.navigationController pushViewController:investRecordListVc animated:YES];
    }else if(indexPath.row == 1){
        if (self.bidPlanType == CMTNewBidPlan) {
            [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(SUSUPRODUCTDETAIL, @"3.htm") title:@"新手福利介绍"];
        }else if(self.bidPlanType == CMTSusuBidPlan){
            [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(SUSUPRODUCTDETAIL, @"1.htm") title:@"速速赚产品介绍"];
        }else{
            [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(SUSUPRODUCTDETAIL,@"2.htm") title:@"月月息产品介绍"];
        }
    }else if(indexPath.row == 2){
        [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(SAFERULE,@".htm") title:@"安全保障"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
