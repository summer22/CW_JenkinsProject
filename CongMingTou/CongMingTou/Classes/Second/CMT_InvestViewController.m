//
//  CMT_InvestViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestViewController.h"
#import "CMT_InvestDetailViewController.h"
#import "CMT_InvestResultViewController.h"
#import "CMT_InvestModel.h"
#import "CMT_InvestTableViewCell.h"
#import "CMT_PublicCellHeadView.h"

@interface CMT_InvestViewController ()<UITableViewDataSource,UITableViewDelegate>
//tableView
@property (nonatomic,strong)UITableView *investTable;
/** 速速赚数据源 */
@property (nonatomic,strong)NSArray *suSourceArr;
/** 月月息 */
@property (nonatomic,strong)NSArray *yueSourceArr;
/** 头部数据 */
@property (nonatomic,strong)CMT_InvestModel *myInvestModel;
@end

@implementation CMT_InvestViewController

- (UITableView *)investTable{
    if (!_investTable) {
        _investTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - 64) style:UITableViewStyleGrouped];
        _investTable.contentInset = UIEdgeInsetsMake(8, 0, CMT_TAB_Height, 0);
        _investTable.delegate = self;
        _investTable.dataSource = self;
        _investTable.sectionFooterHeight = 8;
        self.automaticallyAdjustsScrollViewInsets = NO;
        _investTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownLoadData)];
        _investTable.mj_header.automaticallyChangeAlpha = YES;
    }
    return _investTable;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!(self.suSourceArr.count > 0)) {
        [self getInvestData:@"1"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投资";
    [self.view addSubview:self.investTable];
    self.bidPlanType = CMTSusuBidPlan;
}

//获取页面数据
- (void)getInvestData:(NSString *)type{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getInvestData:type withBlock:^(CMT_InvestModel *investModel, NSError *error) {
        [weakSelf hideHud];
        [_investTable.mj_header endRefreshing];
        if(!error){
            if([[NSString stringWithFormat:@"%@",investModel.status] isEqualToString:@"1"]){
                weakSelf.suSourceArr = investModel.suBidPlanArr;
                weakSelf.yueSourceArr = investModel.yueBidPlanArr;
                weakSelf.myInvestModel = investModel;
                [weakSelf.investTable reloadData];
            }else if ([[NSString stringWithFormat:@"%@",investModel.status] isEqualToString:CMT_SinglePointCode]){
                                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:investModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark -- 下拉刷新
- (void)pullDownLoadData{
    [self getInvestData:@"1"];
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.yueSourceArr.count;
    }else{
        return self.suSourceArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_InvestTableViewCell *cell = [CMT_InvestTableViewCell cellWithTablebView:tableView withIndex:indexPath];
    cell.backgroundColor = CommonWhiteColor;

    if (indexPath.section == 0) {
        [cell setModel:self.yueSourceArr[indexPath.row]];
    }else{
        [cell setModel:self.suSourceArr[indexPath.row]];
    }
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 48;//这里设置其他部分的头视图高度为10
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CMT_PublicCellHeadView *headView = [[CMT_PublicCellHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 48)];
    if (section == 0) {
        [headView setStrData:@"2" statusType:@"1" backProfitStr:self.myInvestModel.planTypeDesMonth withPlanTitle:@"月月息" homeMidTitle:self.myInvestModel.monthDesc];
    }else{
        [headView setStrData:@"1" statusType:@"1" backProfitStr:self.myInvestModel.planTypeDesOnce withPlanTitle:@"速速赚" homeMidTitle:self.myInvestModel.onceDesc];
    }
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CMT_InvestDetailViewController *vc = [[CMT_InvestDetailViewController alloc] init];
    if (indexPath.section == 0) {
        vc.bidPlanType = CMTYyBidPlan;
        vc.planId = [self.yueSourceArr[indexPath.row] planId];
    }else{
        vc.bidPlanType = CMTSusuBidPlan;
        vc.planId = [self.suSourceArr[indexPath.row] planId];
    }
    vc.fromType = CMTEnterRealNameShareResultTypeInvest;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
