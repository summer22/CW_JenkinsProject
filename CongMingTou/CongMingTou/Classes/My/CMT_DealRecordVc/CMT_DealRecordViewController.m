//
//  CMT_DealRecordViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_DealRecordViewController.h"
#import "CMT_ThreeBtnHeadView.h"
#import "CMT_DealRecordTableViewCell.h"
#import "CMT_RecordDetailViewController.h"

@interface CMT_DealRecordViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,CMT_ThreeBtnHeadViewDelegate>
/** 顶部三个按钮 */
@property (nonatomic,strong)CMT_ThreeBtnHeadView *topBtnView;
/** 父视图UIScrollView */
@property (nonatomic,strong)UIScrollView *bgScrollView;
/** 当前table */
@property (nonatomic,strong)UITableView *currentTable;
/** 充值page */
@property (nonatomic,assign)NSInteger rechargePage;
/** 理财page*/
@property (nonatomic,assign)NSInteger investPage;
/** 回款page*/
@property (nonatomic,assign)NSInteger backMoneyPage;
/** 提现page*/
@property (nonatomic,assign)NSInteger reflectPage;
/** 红包*/
@property (nonatomic,assign)NSInteger redPage;
/** 类型type */
@property (nonatomic,copy)NSString *tableType;
/** tableArr */
@property (nonatomic,strong)NSMutableArray *tableArr;
/** 充值数据源数组 */
@property (nonatomic,strong)NSMutableArray *rechargeSourceArr;
/** 理财数据源数组 */
@property (nonatomic,strong)NSMutableArray *investSourceArr;
/** 回款数据源数组 */
@property (nonatomic,strong)NSMutableArray *backMoneySourceArr;
/** 提现数据源数组 */
@property (nonatomic,strong)NSMutableArray *reflectSourceArr;
/** 红包数据源数组 */
@property (nonatomic,strong)NSMutableArray *redSourceArr;
@end

@implementation CMT_DealRecordViewController

- (NSMutableArray *)rechargeSourceArr{
    if (!_rechargeSourceArr) {
        _rechargeSourceArr = [[NSMutableArray alloc] init];
    }
    return _rechargeSourceArr;
}
- (NSMutableArray *)investSourceArr{
    if (!_investSourceArr) {
        _investSourceArr = [[NSMutableArray alloc] init];
    }
    return _investSourceArr;
}
- (NSMutableArray *)backMoneySourceArr{
    if (!_backMoneySourceArr) {
        _backMoneySourceArr = [[NSMutableArray alloc] init];
    }
    return _backMoneySourceArr;
}
- (NSMutableArray *)reflectSourceArr{
    if (!_reflectSourceArr) {
        _reflectSourceArr = [[NSMutableArray alloc] init];
    }
    return _reflectSourceArr;
}
- (NSMutableArray *)redSourceArr{
    if (!_redSourceArr) {
        _redSourceArr = [[NSMutableArray alloc] init];
    }
    return _redSourceArr;
}
- (CMT_ThreeBtnHeadView *)topBtnView
{
    if (!_topBtnView) {
        _topBtnView = [[CMT_ThreeBtnHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth,  39) withTitleArr:@[@"充值",@"理财",@"回款",@"提现",@"红包"]];
        _topBtnView.backgroundColor = [UIColor whiteColor];
        _topBtnView.delegate = self;
    }
    return _topBtnView;
}
- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.topBtnView.bottom, CMT_ScreenWidth, CMT_ScreenHeight - self.topBtnView.height - 64)];
        _bgScrollView.backgroundColor = CommonBgColor;
        _bgScrollView.contentSize = CGSizeMake(CMT_ScreenWidth * 5, 0);
        _bgScrollView.delegate = self;
        _bgScrollView.showsVerticalScrollIndicator = NO;
        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.bounces = NO;
        _bgScrollView.pagingEnabled = YES;
        [self setThreeTable];
    }
    return _bgScrollView;
}
#pragma mark -- 处理上拉刷新加载page问题
- (NSString *)pageDealPushLoad{

    NSString *startStr;
    if ([self.tableType isEqualToString:@"1"]) {
        startStr = [NSString stringWithFormat:@"%ld",(long)self.rechargePage];
    }else if([self.tableType isEqualToString:@"2"]){
        startStr = [NSString stringWithFormat:@"%ld",(long)self.investPage];

    }else if([self.tableType isEqualToString:@"3"]){
        startStr = [NSString stringWithFormat:@"%ld",(long)self.backMoneyPage];

    }else if([self.tableType isEqualToString:@"4"]){
        startStr = [NSString stringWithFormat:@"%ld",(long)self.reflectPage];

    }else if([self.tableType isEqualToString:@"5"]){
        startStr = [NSString stringWithFormat:@"%ld",(long)self.redPage];
    }
    return startStr;
}
#pragma mark - 处理下拉刷新page问题
- (NSString *)pageDealPullLoad{

    NSString *startStr;
    if ([self.tableType isEqualToString:@"1"]) {
        self.rechargePage = 0;
        startStr = [NSString stringWithFormat:@"%ld",(long)(long)self.rechargePage];
    }else if([self.tableType isEqualToString:@"2"]){
        self.investPage = 0;
        startStr = [NSString stringWithFormat:@"%ld",(long)(long)self.investPage];
        
    }else if([self.tableType isEqualToString:@"3"]){
        self.backMoneyPage = 0;
        startStr = [NSString stringWithFormat:@"%ld",(long)(long)self.backMoneyPage];
        
    }else if([self.tableType isEqualToString:@"4"]){
        self.reflectPage = 0;
        startStr = [NSString stringWithFormat:@"%ld",(long)(long)self.reflectPage];
        
    }else if([self.tableType isEqualToString:@"5"]){
        self.redPage = 0;
        startStr = [NSString stringWithFormat:@"%ld",(long)(long)self.redPage];
    }
    return startStr;
}
#pragma mark - 加载数据
- (void)loadData:(NSString *)startStr withType:(NSString *)type{

    __weak  typeof(self) weakSelf = self;

    self.currentTable = _tableArr[[self.tableType integerValue] - 1];
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    NSString *myType = self.tableType;
    [CMT_ProcessTheDataTool getDealRecordInfo:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo start:startStr size:@"10" withType:self.tableType withBlock:^(CMT_MyDealRecordModel *myModel, NSError *error) {
        [weakSelf.currentTable.mj_header endRefreshing];
        [weakSelf.currentTable.mj_footer endRefreshing];
        [weakSelf hideHud];
        if (myType != weakSelf.tableType) return;
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf dealDataSource:myModel.dataSourceArr withType:type];
                if (!(myModel.dataSourceArr.count > 0)){
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
#pragma mark - 初始化table
- (void)setThreeTable{
    _tableArr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 5; i++) {
        UITableView *myTable = [[UITableView alloc] initWithFrame:CGRectMake(CMT_ScreenWidth * i, 0, CMT_ScreenWidth, CMT_ScreenHeight - self.topBtnView.height - 64) style:UITableViewStylePlain];
        myTable.tag = 300 + i;
        myTable.delegate = self;
        myTable.dataSource = self;
        myTable.contentInset = UIEdgeInsetsMake(8, 0, 0, 0);
        myTable.backgroundColor = CommonBgColor;
        myTable.separatorStyle = UITableViewCellSelectionStyleNone;
        myTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullLoadData)];
        myTable.mj_header.automaticallyChangeAlpha = YES;
        myTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            //加载数据
            [self pushLoadData];
        }];
        [_tableArr addObject:myTable];

        [self.bgScrollView addSubview:myTable];
    }
}
#pragma mark -- 处理数据源
- (void)dealDataSource:(NSArray *)dataArr withType:(NSString *)type{
    self.currentTable = _tableArr[[self.tableType integerValue] - 1];

    if ([self.tableType isEqualToString:@"1"]) {
        
        self.rechargePage += dataArr.count;
        if (dataArr.count > 0) {
            if ([type isEqualToString:@"1"]) {
                if (self.rechargeSourceArr.count > 0) {
                    [self.rechargeSourceArr removeAllObjects];
                }
            }
            [self.rechargeSourceArr addObjectsFromArray:dataArr];
            [self.currentTable reloadData];
        }
    }else if([self.tableType isEqualToString:@"2"]){
        
        self.investPage += dataArr.count;
        if (dataArr.count > 0) {
            if ([type isEqualToString:@"1"]) {
                if (self.investSourceArr.count > 0) {
                    [self.investSourceArr removeAllObjects];
                }
            }
            [self.investSourceArr addObjectsFromArray:dataArr];
            [self.currentTable reloadData];
        }

    }else if([self.tableType isEqualToString:@"3"]){
        self.backMoneyPage += dataArr.count;
        if (dataArr.count > 0) {
            if ([type isEqualToString:@"1"]) {
                if (self.backMoneySourceArr.count > 0) {
                    [self.backMoneySourceArr removeAllObjects];
                }
            }
            [self.backMoneySourceArr addObjectsFromArray:dataArr];
            [self.currentTable reloadData];
        }
    }else if([self.tableType isEqualToString:@"4"]){
        self.reflectPage += dataArr.count;
        if (dataArr.count > 0) {
            if ([type isEqualToString:@"1"]) {
                if (self.reflectSourceArr.count > 0) {
                    [self.reflectSourceArr removeAllObjects];
                }
            }
            [self.reflectSourceArr addObjectsFromArray:dataArr];
            [self.currentTable reloadData];
        }
    }else if([self.tableType isEqualToString:@"5"]){
        self.redPage += dataArr.count;
        if (dataArr.count > 0) {
            if ([type isEqualToString:@"1"]) {
                if (self.redSourceArr.count > 0) {
                    [self.redSourceArr removeAllObjects];
                }
            }
            [self.redSourceArr addObjectsFromArray:dataArr];
            [self.currentTable reloadData];
        }
    }
}
#pragma mark -- 处理切换是判断是否需要加载
- (void)dealChangeLoadOrCachesData{
    if ([self.tableType isEqualToString:@"1"]) {
        
        if (!(self.rechargeSourceArr.count > 0)) {
            [self pullLoadData];
        }
    }else if([self.tableType isEqualToString:@"2"]){
        
        if (!(self.investSourceArr.count > 0)) {
            [self pullLoadData];
        }
        
    }else if([self.tableType isEqualToString:@"3"]){
        if (!(self.backMoneySourceArr.count > 0)) {
            [self pullLoadData];
        }
    }else if([self.tableType isEqualToString:@"4"]){
        if (!(self.reflectSourceArr.count > 0)) {
            [self pullLoadData];
        }
    }else if([self.tableType isEqualToString:@"5"]){
        
        if (!(self.redSourceArr.count > 0)) {
            [self pullLoadData];
        }
    }
}
#pragma MARK -- 下拉刷新
- (void)pullLoadData{
    [self loadData:[self pageDealPullLoad] withType:@"1"];
}
#pragma mark -- 上拉加载
- (void)pushLoadData{
    [self loadData:[self pageDealPushLoad] withType:@"2"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易记录";
    [self.view addSubview:self.topBtnView];
    [self.view addSubview:self.bgScrollView];
    self.rechargePage = 0;
    self.investPage = 0;
    self.backMoneyPage = 0;
    self.reflectPage = 0;
    self.redPage = 0;
    self.tableType = @"1";
    [self loadData:[self pageDealPullLoad] withType:@"1"];
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
    if (self.bgScrollView == scrollView) {
        
        [self scrollViewDidEndScrollingAnimation:scrollView];

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
        self.tableType = [NSString stringWithFormat:@"%ld",offX-300+1];
        self.currentTable = (UITableView *)[self.view viewWithTag:offX];
        [self dealChangeLoadOrCachesData];
    }
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([self.tableType isEqualToString:@"1"]) {
        return self.rechargeSourceArr.count;
    }else if([self.tableType isEqualToString:@"2"]){
        return self.investSourceArr.count;
    }else if([self.tableType isEqualToString:@"3"]){
        return self.backMoneySourceArr.count;
    }else if([self.tableType isEqualToString:@"4"]){
        return self.reflectSourceArr.count;
    }else if([self.tableType isEqualToString:@"5"]){
        return self.redSourceArr.count;
    }else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_DealRecordTableViewCell*cell = [CMT_DealRecordTableViewCell cellWithTablebView:tableView index:indexPath];
    if ([self.tableType isEqualToString:@"1"]) {
        [cell setMyModel:self.rechargeSourceArr[indexPath.row] withType:self.tableType];
    }else if([self.tableType isEqualToString:@"2"]){
        [cell setMyModel:self.investSourceArr[indexPath.row] withType:self.tableType];
    }else if([self.tableType isEqualToString:@"3"]){
        [cell setMyModel:self.backMoneySourceArr[indexPath.row] withType:self.tableType];
    }else if([self.tableType isEqualToString:@"4"]){
        [cell setMyModel:self.reflectSourceArr[indexPath.row] withType:self.tableType];
    }else if([self.tableType isEqualToString:@"5"]){
        [cell setMyModel:self.redSourceArr[indexPath.row] withType:self.tableType];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72 ;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    if ([self.tableType isEqualToString:@"1"]) {
        CMT_RecordDetailViewController *vc = [[CMT_RecordDetailViewController alloc] init];
        vc.myDiffType = RECHARGETYPE;
        vc.sendModel = self.rechargeSourceArr[indexPath.row];
        CMT_NAV_PUSHTO_VC(vc);

    }else if([self.tableType isEqualToString:@"2"]){
        CMT_RecordDetailViewController *vc = [[CMT_RecordDetailViewController alloc] init];
        vc.myDiffType = INVESTTYPE;
        vc.sendModel = self.investSourceArr[indexPath.row];
        CMT_NAV_PUSHTO_VC(vc);

    }else if([self.tableType isEqualToString:@"4"]){
        CMT_RecordDetailViewController *vc = [[CMT_RecordDetailViewController alloc] init];
        vc.myDiffType = REFLECTTYPE;
        vc.sendModel = self.reflectSourceArr[indexPath.row];
        CMT_NAV_PUSHTO_VC(vc);
    }
}

@end
