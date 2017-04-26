//
//  CMT_HowGetFuliJInViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_HowGetFuliJInViewController.h"
#import "CMT_HowGetFuliJinTableViewCell.h"
#import "CMT_HowGetFuLiJinFooterView.h"
#import "CMT_InvestDetailViewController.h"
#import "CMT_RealNameBindCardViewController.h"
#import "CMT_RealNameBindCardResultViewController.h"
#import "CMT_SetDealPassViewController.h"

@interface CMT_HowGetFuliJInViewController ()<CMT_HowGetFuliJinTableViewCellDelegate>
/** 头部视图 */
@property (nonatomic,strong) CMT_HowGetFuLiJinFooterView *tableFooterView;
/** 数据源 */
@property (nonatomic,strong)NSArray *dataArr;
@end

@implementation CMT_HowGetFuliJInViewController
//懒加载 头视图
- (CMT_HowGetFuLiJinFooterView *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = [[CMT_HowGetFuLiJinFooterView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 100)];
    }
    return _tableFooterView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadMyData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"如何获取福利金";
    self.myTable.tableFooterView = self.tableFooterView;
    self.myTable.backgroundColor = CommonBgColor;
}

#pragma mark -- 获取列表数据
- (void)loadMyData{
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getHowtoFulijin:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo withBlock:^(CMT_MyHowToGetFLJModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                self.dataArr = myModel.dataSourceArr;
                [self.myTable reloadData];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:self];
            }else{
                [self showHint:myModel.msg];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark -- 去投资详情
- (void)toInvestDetail:(NSString *)period index:(NSInteger)index{
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getNewInvesterToInvestDetail:[CMT_AccountTool accountModel].userId tel:[CMT_AccountTool accountModel].mobileNo period:period withBlock:^(CMT_NewInvesterToDetailModel *myModel, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                CMT_InvestDetailViewController *vc = [[CMT_InvestDetailViewController alloc] init];
                if ([[self.dataArr[index] planType] isEqualToString:@"1"]) {
                    vc.bidPlanType = CMTSusuBidPlan;
                }else {
                    vc.bidPlanType = CMTYyBidPlan;
                }
                vc.planId = myModel.financialPlanId;
                [self.navigationController pushViewController:vc animated:YES];
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:self];
            }else{
                [self showHint:myModel.msg];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark - CMT_HowGetFuliJinTableViewCellDelegate
- (void)toFinishBtnClick:(NSInteger)index{
    if (index >= 3) {
        [self toInvestDetail: [self.dataArr[index] bidPeriod] index:index];
    }else if(index == 1){//去实名
        CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
        realName.fromType = CMTEnterRealNameShareResultTypeHowGetFuLi;
        [self.navigationController pushViewController:realName animated:YES];
    }else if(index == 2){//实名分享
        if ([[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
            CMT_RealNameBindCardResultViewController *realNameResult = [[CMT_RealNameBindCardResultViewController alloc] init];
            realNameResult.nameStr = [self.dataArr[index] realName];
            realNameResult.cardNumStr = [self.dataArr[index] idNumber];
            realNameResult.fromType = CMTEnterRealNameShareResultTypeHowGetFuLi;
            [self.navigationController pushViewController:realNameResult animated:YES];
        }else{
            CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
            realName.fromType = CMTEnterRealNameShareResultTypeHowGetFuLi;
            [self.navigationController pushViewController:realName animated:YES];
        }
    }
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_HowGetFuliJinTableViewCell *cell = [CMT_HowGetFuliJinTableViewCell cellWithTablebView:tableView index:indexPath];
    cell.backgroundColor = CommonWhiteColor;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    [cell setMyModel:self.dataArr[indexPath.row] index:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70 ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
