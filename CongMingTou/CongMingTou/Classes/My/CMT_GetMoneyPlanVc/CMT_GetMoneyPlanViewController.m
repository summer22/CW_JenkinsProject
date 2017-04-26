//
//  CMT_GetMoneyPlanViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GetMoneyPlanViewController.h"
#import "CMT_GetMoneyPlanTableViewCell.h"
#import "CMT_GetMoneyPlanHeadView.h"

@interface CMT_GetMoneyPlanViewController ()
/** 头部视图 */
@property (nonatomic,strong)CMT_GetMoneyPlanHeadView *myHeadView;
/** 数据源 */
@property (nonatomic,strong)NSArray *dataSource;
@end

@implementation CMT_GetMoneyPlanViewController

- (CMT_GetMoneyPlanHeadView *)myHeadView{

    if (!_myHeadView) {
        _myHeadView = [[CMT_GetMoneyPlanHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 64)];
    }
    return _myHeadView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadMyData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"收款计划";
    self.myTable.tableHeaderView = self.myHeadView;
    self.myTable.backgroundColor = CommonBgColor;
    self.myTable.separatorStyle = UITableViewCellSelectionStyleNone;

}

#pragma mark - 加载数据
- (void)loadMyData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getMoneyPlanInfo:[CMT_AccountTool accountModel].userId investId:self.investId withBlock:^(CMT_GetMyMoneyPlanModel *myModel, NSError *error) {
        [weakSelf.myTable.mj_header endRefreshing];
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf.myHeadView setMyModel:myModel];
                weakSelf.dataSource = myModel.dataSource;
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

#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_GetMoneyPlanTableViewCell *cell = [CMT_GetMoneyPlanTableViewCell cellWithTablebView:tableView index:indexPath];
    [cell setMyModel:self.dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 48 ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
