//
//  CMT_FLJinViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FLJinViewController.h"
#import "CMT_FuliJinHeadView.h"
#import "CMT_InRecordTableViewCell.h"
#import "CMT_myInvestRecordTableViewCell.h"
#import "CMT_ThreeBtnHeadView.h"
#import "CMT_MyFLIncomeRecordModel.h"
#import "CMT_MyInvestDetailViewController.h"
#import "CMT_HowGetFuliJInViewController.h"
#import "AppDelegate.h"

@interface CMT_FLJinViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,CMT_ThreeBtnHeadViewDelegate,CMT_FuliJinHeadViewDelegate>
/** 头部视图 */
@property (nonatomic,strong)CMT_FuliJinHeadView *myHeadView;
/** investTable */
@property (nonatomic,strong)UITableView *investTable;
/** incomeTable */
@property (nonatomic,strong)UITableView *incomeTable;
/** 父视图UIScrollView */
@property (nonatomic,strong)UIScrollView *bgScrollView;
/** 顶部三个按钮 */
@property (nonatomic,strong)CMT_ThreeBtnHeadView *topBtnView;
/** 投资记录pageNumb*/
@property (nonatomic,assign)NSInteger investPageNum;
/** 收支记录pageNumb */
@property (nonatomic,assign)NSInteger inComePageNum;
/** 收支记录数据源 */
@property (nonatomic,strong)NSMutableArray *inComeSourceArr;
/** 收益中数据源 */
@property (nonatomic,strong)NSMutableArray *investSourceArr;

@end

@implementation CMT_FLJinViewController

- (NSMutableArray *)inComeSourceArr{
    if (!_inComeSourceArr) {
        _inComeSourceArr = [[NSMutableArray alloc] init];
    }
    return _inComeSourceArr;
}

- (NSMutableArray *)investSourceArr{
    if (!_investSourceArr) {
        _investSourceArr = [[NSMutableArray alloc] init];
    }
    return _investSourceArr;
}

- (CMT_FuliJinHeadView *)myHeadView{
    if (!_myHeadView) {
        _myHeadView = [[CMT_FuliJinHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 204)];
        _myHeadView.delegate = self;
    }
    return _myHeadView;
}

- (CMT_ThreeBtnHeadView *)topBtnView
{
    if (!_topBtnView) {
        _topBtnView = [[CMT_ThreeBtnHeadView alloc] initWithFrame:CGRectMake(0, self.myHeadView.bottom, CMT_ScreenWidth,  39) withTitleArr:@[@"收益中",@"收支记录"]];
        _topBtnView.backgroundColor = [UIColor whiteColor];
        _topBtnView.delegate = self;
    }
    return _topBtnView;
}

- (UITableView *)investTable{
    if (!_investTable) {
        _investTable = [[UITableView alloc] initWithFrame:CGRectMake( 0, 0, CMT_ScreenWidth, CMT_ScreenHeight - self.myHeadView.height - self.topBtnView.height - 64) style:UITableViewStyleGrouped];
        _investTable.delegate = self;
        _investTable.dataSource = self;
        _investTable.tableFooterView.height = 4;
        _investTable.contentInset = UIEdgeInsetsMake(8, 0, 0, 0);
        _investTable.backgroundColor = CommonBgColor;
        self.automaticallyAdjustsScrollViewInsets = NO;
        _investTable.separatorStyle = UITableViewCellSelectionStyleNone;
        _investTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullListData)];
        _investTable.mj_header.automaticallyChangeAlpha = YES;
        _investTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            //加载数据
            [self pushListData];
        }];
    }
    return _investTable;
}
- (UITableView *)incomeTable{
    
    if (!_incomeTable) {
        _incomeTable = [[UITableView alloc] initWithFrame:CGRectMake(CMT_ScreenWidth, 0, CMT_ScreenWidth, CMT_ScreenHeight - self.myHeadView.height - self.topBtnView.height - 64) style:UITableViewStylePlain];
        _incomeTable.delegate = self;
        _incomeTable.dataSource = self;
        _incomeTable.contentInset = UIEdgeInsetsMake(8, 0, 0, 0);
        _incomeTable.backgroundColor = CommonBgColor;
        self.automaticallyAdjustsScrollViewInsets = NO;
        _incomeTable.separatorStyle = UITableViewCellSelectionStyleNone;
        _incomeTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullListData)];
        _incomeTable.mj_header.automaticallyChangeAlpha = YES;
        _incomeTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            //加载数据
            [self pushListData];
        }];
    }
    return _incomeTable;
}

- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.topBtnView.bottom, CMT_ScreenWidth, CMT_ScreenHeight - self.myHeadView.height - self.topBtnView.height - 64)];
        _bgScrollView.backgroundColor = CommonBgColor;
        _bgScrollView.contentSize = CGSizeMake(CMT_ScreenWidth * 2, 0);
        _bgScrollView.delegate = self;
        _bgScrollView.showsVerticalScrollIndicator = NO;
        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.bounces = NO;
        _bgScrollView.pagingEnabled = YES;
    }
    return _bgScrollView;
}

- (void)setSubViews{
    [self.view addSubview:self.myHeadView];
    [self.view addSubview:self.topBtnView];
    [self.bgScrollView addSubview:self.investTable];
    [self.bgScrollView addSubview:self.incomeTable];
    [self.view addSubview:self.bgScrollView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"福利金";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"使用规则" target:self action:@selector(userRuleAction)];
    self.investPageNum = 0;
    self.inComePageNum = 0;
    self.tableType = INVESTRECORD;
    [self loadInvestRecordListData:@"1"];
    [self setSubViews];
}

#pragma mark -- CMT_ThreeBtnHeadViewDelegate 顶部三个按钮的点击事件
- (void)topBtnClick:(NSInteger)btnTags{
    //滚动
    CGPoint offset = self.bgScrollView.contentOffset;
    offset.x = (btnTags - 300) * self.bgScrollView.width;
    [self.bgScrollView setContentOffset:offset animated:YES];
}

#pragma mark -- 监听拖动scrollview的偏移量
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    if (self.bgScrollView == scrollView) {
        
        NSInteger offX  = scrollView.contentOffset.x / scrollView.width + 300;
        UIButton *btn = (UIButton *)[self.view viewWithTag:offX];
        [UIView animateWithDuration:0.3 animations:^{
            [self.topBtnView btnAction:btn];
        }];
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    if (self.bgScrollView == scrollView) {
        
        NSInteger offX  = scrollView.contentOffset.x / scrollView.width + 300;
        if(offX == 300){
            self.tableType = INVESTRECORD;

        }else if (offX == 301){
            self.tableType = INCOMERECORD;
        }
        //load数据
        [self loadMyViewData];
    }
}

//加载数据
- (void)loadMyViewData{
    
    if (self.tableType == INVESTRECORD) {
        if (!(self.investSourceArr.count > 0)) {
            [self loadInvestRecordListData:@"1"];
        }
    }else{
        if (!(self.inComeSourceArr.count > 0)) {
            [self loadInComeRecordListData:@"1"];
        }
    }
}

#pragma mark - 下拉刷新
- (void)pullListData{
    if (self.tableType == INVESTRECORD) {
        self.investPageNum = 0;
        [self loadInvestRecordListData:@"1"];
    }else{
        self.inComePageNum = 0;
        [self loadInComeRecordListData:@"1"];
    }
}

#pragma mark -- 投资记录加载
- (void)loadInvestRecordListData:(NSString *)type{
    
    __weak  typeof(self) weakSelf = self;

    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self showHudInView:appDel.window hint:CMT_LoadDataWaiting];

    NSString *pageStr = [NSString stringWithFormat:@"%ld",(long)self.investPageNum];

    [CMT_ProcessTheDataTool getWelfareInvestRecord:[CMT_AccountTool accountModel].userId start:pageStr size:@"10" WithBlock:^(CMT_MyFuLiInvestRecordModel *myModel, NSError *error) {
        [_investTable.mj_header endRefreshing];
        [_investTable.mj_footer endRefreshing];
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [_myHeadView setFuLiModel:myModel];
                weakSelf.investPageNum += myModel.dataSourceArr.count;
    
                if (myModel.dataSourceArr.count>0) {
                    if ([type isEqualToString:@"1"]) {
                        if (self.investSourceArr.count > 0) {
                            [self.investSourceArr removeAllObjects];
                        }
                    }
                    [weakSelf.investSourceArr addObjectsFromArray:myModel.dataSourceArr];
                    [_investTable reloadData];
                }else{
                    [weakSelf showHint:@"暂无更多数据"];
                }
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

#pragma mark -- 上拉加载
- (void)pushListData{
    if (self.tableType == INVESTRECORD) {
        [self loadInvestRecordListData:@"2"];
    }else{
        [self loadInComeRecordListData:@"2"];
    }
}

#pragma mark -- 收支记录加载
- (void)loadInComeRecordListData:(NSString *)type{
    
    __weak  typeof(self) weakSelf = self;

    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self showHudInView:appDel.window hint:CMT_LoadDataWaiting];    NSString *pageStr = [NSString stringWithFormat:@"%ld",(long)self.inComePageNum];

    [CMT_ProcessTheDataTool getWelfareRecord:[CMT_AccountTool accountModel].userId start:pageStr size:@"10" WithBlock:^(CMT_MyFLIncomeRecordModel *myModel, NSError *error) {
        [_incomeTable.mj_header endRefreshing];
        [_incomeTable.mj_footer endRefreshing];
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                weakSelf.inComePageNum += myModel.dataSource.count;
                if (myModel.dataSource.count > 0) {
                    if ([type isEqualToString:@"1"]) {
                        if (self.inComeSourceArr.count > 0) {
                            [self.inComeSourceArr removeAllObjects];
                        }
                    }
                    [weakSelf.inComeSourceArr addObjectsFromArray:myModel.dataSource];
                    [_incomeTable reloadData];
                }else{
                    [weakSelf showHint:@"暂无更多数据"];
                }
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

- (void)userRuleAction{
    [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(USERREDRULE,@"4.htm") title:@"福利金使用规则"];
}

#pragma mark - -CMT_FuliJinHeadViewDelegate
- (void)howToGetFuLiJInBtnAction{
    CMT_HowGetFuliJInViewController *howToGet = [[CMT_HowGetFuliJInViewController alloc] init];
    [self.navigationController pushViewController:howToGet animated:YES];
}

#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (self.tableType == INVESTRECORD) {
        return self.investSourceArr.count;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.tableType == INVESTRECORD) {
        return 1;
    }
    return self.inComeSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *myCell;
    if (self.tableType == INVESTRECORD) {
        CMT_myInvestRecordTableViewCell *cell = [CMT_myInvestRecordTableViewCell cellWithTablebView:tableView index:indexPath];
        cell.backgroundColor = CommonWhiteColor;
        [cell setFuLiModel:self.investSourceArr[indexPath.section]];
        myCell = cell;
    }else{
        CMT_InRecordTableViewCell *cell = [CMT_InRecordTableViewCell cellWithTablebView:tableView index:indexPath];
        cell.backgroundColor = CommonWhiteColor;
        [cell setMyModel:self.inComeSourceArr[indexPath.row]];
        myCell = cell;
    }
    return myCell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.tableType == INVESTRECORD) {
        return 136;
    }
    return 72 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (self.tableType == INVESTRECORD) {
        return 1;
    }
    return 0;//这里设置其他部分的头视图高度为10
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (self.tableType == INVESTRECORD) {
        CMT_MyInvestDetailViewController *investDetailVC = [[CMT_MyInvestDetailViewController alloc] init];
        if ([[self.investSourceArr[indexPath.section] planType] isEqualToString:@"0"]) {
            investDetailVC.myDiffType = CMT_FULIJINDETAILTYPE;
        }else if([[self.investSourceArr[indexPath.section] planType] isEqualToString:@"1"]){
            investDetailVC.myDiffType = CMT_SUSUDETTAILTYPE;
        }else{
            investDetailVC.myDiffType = CMT_YUEDETAILTYPE;
        }
        investDetailVC.investId = [self.investSourceArr[indexPath.section] investId];
        [self.navigationController pushViewController:investDetailVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
