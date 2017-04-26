//
//  CMT_MySusuViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MySusuViewController.h"
#import "CMT_MySusuHeadView.h"
#import "CMT_myInvestRecordTableViewCell.h"
#import "CMT_MyInvestDetailViewController.h"
#import "AppDelegate.h"
#import "CMT_DefaultView.h"
#import "CMT_ThreeBtnHeadView.h"

@interface CMT_MySusuViewController ()<UITableViewDelegate,UITableViewDataSource,CMT_ThreeBtnHeadViewDelegate>
/** 头部视图 */
@property (nonatomic,strong)CMT_MySusuHeadView *myHeadView;
/** myTable */
@property (nonatomic,strong)UITableView *myTable;
/** 持有中或者已赎回状态 */
@property (nonatomic,copy)NSString *statusType; //1:持有中；2：已赎回
/** 月月息或者速速赚类型识别 */
@property (nonatomic,copy)NSString *typeStr; //1:速速赚  2:月月盈
/** 持有中pageNum*/
@property (nonatomic,assign)NSInteger myPageNum;
/** 已赎回pageNumb */
@property (nonatomic,assign)NSInteger hadPageNumb;
/** 默认图 */
@property (nonatomic,strong)CMT_DefaultView *userDefaultView;
/** 持有数据源数组 */
@property (nonatomic,strong)NSMutableArray *myGetSourceArr;
/** 已赎回数据源数组 */
@property (nonatomic,strong)NSMutableArray *myHadSourceArr;
/** 两个btn */
@property (nonatomic,strong)CMT_ThreeBtnHeadView *topBtnView;

@end

@implementation CMT_MySusuViewController

- (CMT_DefaultView *)userDefaultView{
    if (!_userDefaultView) {
        _userDefaultView = [[CMT_DefaultView alloc] initWithFrame:CGRectMake(0, (CMT_ScreenHeight - 260 - 70 - 150)/2, CMT_ScreenWidth, 150)];
            [_userDefaultView setImgAndLabelContent:@"2"];
    }
    return _userDefaultView;
}
- (CMT_MySusuHeadView *)myHeadView{
    if (!_myHeadView) {
        _myHeadView = [[CMT_MySusuHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 204)];
    }
    return _myHeadView;
}
- (CMT_ThreeBtnHeadView *)topBtnView
{
    if (!_topBtnView) {
        _topBtnView = [[CMT_ThreeBtnHeadView alloc] initWithFrame:CGRectMake(0, self.myHeadView.bottom, CMT_ScreenWidth,  39) withTitleArr:@[@"持有中",@"已赎回"]];
        _topBtnView.backgroundColor = [UIColor whiteColor];
        _topBtnView.delegate = self;
    }
    return _topBtnView;
}

- (UITableView *)myTable{
    
    if (!_myTable) {
        _myTable = [[UITableView alloc] initWithFrame:CGRectMake(0,self.topBtnView.bottom, CMT_ScreenWidth, CMT_ScreenHeight - 252 - 64) style:UITableViewStyleGrouped];
        _myTable.delegate = self;
        _myTable.dataSource = self;
        _myTable.sectionFooterHeight = 7;
        self.automaticallyAdjustsScrollViewInsets = NO;
        _myTable.contentInset = UIEdgeInsetsMake(8, 0, 0, 0);
        [_myTable addSubview:self.userDefaultView];
        _myTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullLoadData)];
        _myTable.mj_header.automaticallyChangeAlpha = YES;
        _myTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self pushLoadData];//加载数据
        }];
    }
    return _myTable;
}
- (NSMutableArray *)myGetSourceArr{
    if (!_myGetSourceArr) {
        _myGetSourceArr = [[NSMutableArray alloc] init];
    }
    return _myGetSourceArr;
}
- (NSMutableArray *)myHadSourceArr{
    if (!_myHadSourceArr) {
        _myHadSourceArr = [[NSMutableArray alloc] init];
    }
    return _myHadSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.myDiffType == CMT_SUSUTYPE) {
        self.title = @"我的速速赚";
    }else {
        self.title = @"我的月月息";
    }
    self.myPageNum = 0;
    self.hadPageNumb = 0;
    self.statusType = @"1";
    if (self.myDiffType == CMT_SUSUTYPE) {
        self.typeStr = @"1";
    }else {
        self.typeStr = @"2";
    }
    [self loadMyData:@"1"];
    [self.view addSubview:self.myHeadView];
    [self.view addSubview:self.topBtnView];
    [self.view addSubview:self.myTable];
}
#pragma mark -- 下拉刷新
- (void)pullLoadData{
    if ([self.statusType isEqualToString:@"1"]) {
       self.myPageNum = 0;
    }else{
       self.hadPageNumb = 0;
    }
    [self loadMyData:@"1"];
}
#pragma mark -- 上拉加载
- (void)pushLoadData{
    [self loadMyData:@"2"];
}
#pragma mark - 速速赚数据 - 月月息数据
- (void)loadMyData:(NSString *)type{
    
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self showHudInView:appDel.window hint:CMT_LoadDataWaiting];
    NSString *pageStr;
    if ([self.statusType isEqualToString:@"1"]) {
        pageStr = [NSString stringWithFormat:@"%ld",(long)self.myPageNum];
    }else{
        pageStr = [NSString stringWithFormat:@"%ld",(long)self.hadPageNumb];
    }
    [CMT_ProcessTheDataTool getMySusuOrYueYueInfo:[CMT_AccountTool accountModel].userId start:pageStr size:@"10" status:self.statusType type:self.typeStr withBlock:^(CMT_MySuOrYueModel *myModel, NSError *error) {
        [self.myTable.mj_header endRefreshing];
        [self.myTable.mj_footer endRefreshing];
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if ([self.statusType isEqualToString:@"1"]) {
                    [self.myHeadView setHeadModelData:myModel withType:self.typeStr];
                    self.myPageNum += myModel.dataSource.count;
                    if ([type isEqualToString:@"1"]) {
                        if (self.myGetSourceArr.count > 0) {
                            [self.myGetSourceArr removeAllObjects];
                        }
                    }
                    [self.myGetSourceArr addObjectsFromArray:myModel.dataSource];
                    self.userDefaultView.hidden = self.myGetSourceArr.count > 0 ? YES : NO;
                }else{
                    if ([type isEqualToString:@"1"]) {
                        if (self.myHadSourceArr.count > 0) {
                            [self.myHadSourceArr removeAllObjects];
                        }
                    }
                    self.hadPageNumb += myModel.dataSource.count;
                    [self.myHadSourceArr addObjectsFromArray:myModel.dataSource];
                    self.userDefaultView.hidden = self.myHadSourceArr.count > 0 ? YES : NO;
                }
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
#pragma mark -- CMT_ThreeBtnHeadViewDelegate 顶部三个按钮的点击事件
- (void)topBtnClick:(NSInteger)btnTags{
    
    if (btnTags == 300) {
        self.statusType = @"1";
        self.userDefaultView.hidden = self.myGetSourceArr.count > 0 ? YES : NO;
        if (!(self.myGetSourceArr.count > 0)) {
            [self loadMyData:@"1"];
        }
        [self.myTable reloadData];
        
    }else{
        self.statusType = @"2";
        self.userDefaultView.hidden = self.myHadSourceArr.count > 0 ? YES : NO;
        if (!(self.myHadSourceArr.count > 0)) {
            [self loadMyData:@"1"];
        }
        [self.myTable reloadData];
    }
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if ([self.statusType isEqualToString:@"1"]) {
        return self.myGetSourceArr.count;
    }else{
        return self.myHadSourceArr.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_myInvestRecordTableViewCell *cell = [CMT_myInvestRecordTableViewCell cellWithTablebView:tableView index:indexPath];
    cell.backgroundColor = CommonWhiteColor;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    if ([self.statusType isEqualToString:@"1"]) {
        [cell setMySusuOrYueYueDataModel:self.myGetSourceArr[indexPath.section] type:self.statusType];
    }else{
        [cell setMySusuOrYueYueDataModel:self.myHadSourceArr[indexPath.section] type:self.statusType];
    }
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
    
    CMT_MyInvestDetailViewController *investDetailVC = [[CMT_MyInvestDetailViewController alloc] init];

    if (self.myDiffType == CMT_SUSUTYPE) {
        if ([self.statusType isEqualToString:@"1"]) {
            investDetailVC.investId = [self.myGetSourceArr[indexPath.section] investId];
            investDetailVC.myDiffType = [[self.myGetSourceArr[indexPath.section] planType] isEqualToString:@"0"] ? CMT_FULIJINDETAILTYPE:CMT_SUSUDETTAILTYPE;
        }else{
            investDetailVC.investId = [self.myHadSourceArr[indexPath.section] investId];
            investDetailVC.myDiffType = CMT_FULIJINDETAILTYPE;//速速装已赎回没有复投操作
        }
    }else {
        investDetailVC.myDiffType = CMT_YUEDETAILTYPE;
        if ([self.statusType isEqualToString:@"1"]) {
            investDetailVC.investId = [self.myGetSourceArr[indexPath.section] investId];
        }else{
            investDetailVC.investId = [self.myHadSourceArr[indexPath.section] investId];
        }
    }
    [self.navigationController pushViewController:investDetailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
