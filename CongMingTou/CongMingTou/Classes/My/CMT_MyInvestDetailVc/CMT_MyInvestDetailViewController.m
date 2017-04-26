//
//  CMT_MyInvestDetailViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_MyInvestDetailViewController.h"
#import "CMT_ThreeBtnHeadView.h"
#import "CMT_MySusuInvestDetailView.h"
#import "CMT_MyYueyueInvestDetailBottomView.h"
#import "CMT_MyFuLiJinInvestDetailView.h"
#import "CMT_MyInvestDetailTableViewCell.h"
#import "CMT_GetMoneyPlanViewController.h"
#import "CMT_AssetPortfolioTableViewCell.h"
#import "CMT_AmountCodInfeModel.h"
#import "CMT_DefaultView.h"

@interface CMT_MyInvestDetailViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,CMT_ThreeBtnHeadViewDelegate,CMT_MyYueyueInvestDetailBottomViewDelegate,CMT_MySusuInvestDetailViewDelegate,UIWebViewDelegate>
/** 顶部三个按钮 */
@property (nonatomic,strong)CMT_ThreeBtnHeadView *topBtnView;
/** 父视图UIScrollView */
@property (nonatomic,strong)UIScrollView *bgScrollView;
/** 速速赚投资详情底部视图 */
@property (nonatomic,strong)CMT_MySusuInvestDetailView *susuBottomView;
/** 月月息投资详情底部视图 */
@property (nonatomic,strong)CMT_MyYueyueInvestDetailBottomView *yueBottomView;
/** 福利金投资详情底部视图 */
@property (nonatomic,strong)CMT_MyFuLiJinInvestDetailView *fuLiJinBottomView;
/** 投资详情数据源 */
@property (nonatomic,strong)CMT_MyInvestRecordDetailModel *myModel;
/** 速速赚到期操作id 默认为 1 */
@property (nonatomic,copy)NSString *suSelectId;
/** table */
@property (nonatomic,strong)UITableView *myTable;
/** 资产组合 */
@property (nonatomic,strong)UITableView *producttabView;
/** 投资协议 */
@property (nonatomic,strong)UIWebView *investWebView;
/** 资产数据源 */
@property (nonatomic,strong)NSArray *myAmountGetArr;
/** 可用默认图 */
@property (nonatomic,strong)CMT_DefaultView *userDefaultView;
/** 复投方式 */
@property (nonatomic,copy)NSString *againType;

@end

@implementation CMT_MyInvestDetailViewController

- (CMT_ThreeBtnHeadView *)topBtnView
{
    if (!_topBtnView) {
        _topBtnView = [[CMT_ThreeBtnHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth,  39) withTitleArr:@[@"投资详情",@"资产组合",@"投资协议"]];
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
        _bgScrollView.contentSize = CGSizeMake(CMT_ScreenWidth * 3, 0);
        _bgScrollView.delegate = self;
        _bgScrollView.showsVerticalScrollIndicator = NO;
        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.bounces = NO;
        _bgScrollView.pagingEnabled = YES;
    }
    return _bgScrollView;
}

- (CMT_DefaultView *)userDefaultView{
    if (!_userDefaultView) {
        _userDefaultView = [[CMT_DefaultView alloc] initWithFrame:CGRectMake(0, CMT_NAV_Height*3, CMT_ScreenWidth, 150)];
        [_userDefaultView setImgAndLabelContent:@"3"];
    }
    return _userDefaultView;
}


- (CMT_MySusuInvestDetailView *)susuBottomView{
    if (!_susuBottomView) {
        _susuBottomView = [[CMT_MySusuInvestDetailView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 108)];
        _susuBottomView.delegate = self;
    }
    return _susuBottomView;
}

- (CMT_MyYueyueInvestDetailBottomView *)yueBottomView{
    if (!_yueBottomView) {
        _yueBottomView = [[CMT_MyYueyueInvestDetailBottomView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 108)];
        _yueBottomView.delegate = self;
    }
    return _yueBottomView;
}

- (CMT_MyFuLiJinInvestDetailView *)fuLiJinBottomView{
    if (!_fuLiJinBottomView) {
        _fuLiJinBottomView = [[CMT_MyFuLiJinInvestDetailView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 58)];
    }
    return _fuLiJinBottomView;
}

- (UITableView *)myTable{
    if (!_myTable) {
        _myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - self.topBtnView.height - 64) style:UITableViewStylePlain];
        _myTable.delegate = self;
        _myTable.dataSource = self;
        _myTable.backgroundColor = CommonBgColor;
        _myTable.separatorStyle = UITableViewCellSelectionStyleNone;
        if (self.myDiffType == CMT_FULIJINDETAILTYPE) {
            _myTable.tableFooterView = self.fuLiJinBottomView;
        }else if(self.myDiffType == CMT_SUSUDETTAILTYPE){
            _myTable.tableFooterView = self.susuBottomView;
        }else{
            _myTable.tableFooterView = self.yueBottomView;
        }
    }
    return _myTable;
}

- (UITableView *)producttabView{
    if (!_producttabView) {
        _producttabView =[[UITableView alloc] initWithFrame:CGRectMake(CMT_ScreenWidth, 0, CMT_ScreenWidth, CMT_ScreenHeight - self.topBtnView.height - 64) style:UITableViewStylePlain];
        _producttabView.separatorStyle = UITableViewCellSelectionStyleNone;
        _producttabView.delegate = self;
        _producttabView.dataSource = self;
        _producttabView.backgroundColor = CommonBgColor;
        [_producttabView addSubview:self.userDefaultView];
    }
    return _producttabView;
}

- (UIWebView *)investWebView{
    if (!_investWebView) {
        _investWebView = [[UIWebView alloc] initWithFrame:CGRectMake(CMT_ScreenWidth*2, 0, CMT_ScreenWidth, CMT_ScreenHeight - self.topBtnView.height - 64)];
        _investWebView.scrollView.contentInset = UIEdgeInsetsMake(-130, 0, 0, 0);
        _investWebView.delegate = self;
        _investWebView.backgroundColor = CommonBgColor;
    }
    return _investWebView;
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.suSelectId = @"1";
    [self loadMyData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投资详情";
    [self.view addSubview:self.topBtnView];
    [self.bgScrollView addSubview:self.myTable];
    [self.bgScrollView addSubview:self.producttabView];
    [self.bgScrollView addSubview:self.investWebView];
    [self.view addSubview:self.bgScrollView];
    
}

#pragma mark - 加载数据
- (void)loadMyData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getMyInvestRecordDetailInfo:[CMT_AccountTool accountModel].userId investId:self.investId withBlock:^(CMT_MyInvestRecordDetailModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                [weakSelf.fuLiJinBottomView setMyModel:myModel];
                [weakSelf.yueBottomView setMyModel:myModel];
                [weakSelf.susuBottomView setMyModel:myModel];
                weakSelf.againType = myModel.reInvestDes;
                 weakSelf.myModel = myModel;
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

//查看合同
- (void)lookAgrement{
    
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getContractInforWithInvestId:self.investId period:self.myModel.period block:^(id jsonObject, NSError *error) {
        [self hideHud];
        if(jsonObject[@"msg"] && ![jsonObject[@"msg"] isEqual:@""]){
            NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:jsonObject[@"msg"]]];
            [self.investWebView loadRequest:request];
        }
    }];
}
#pragma mark - 加载数据资产组合
- (void)loadAsscodData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool rpcAssetDebtServiceDetailInfoinvestId:self.myModel.bidNo withBlock:^(CMT_AmountCodInfeModel *myModel, NSError *error)
    {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                weakSelf.myAmountGetArr = myModel.dataSource;
                 weakSelf.userDefaultView.hidden = myModel.dataSource.count > 0 ? YES : NO;
                [weakSelf.producttabView reloadData];
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
#pragma mark -- webViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideHud];
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
        
        if(offX == 301){
            if (!(self.myAmountGetArr.count > 0)) {
                [self loadAsscodData];
            }
        }else if (offX == 302){
            
            [self lookAgrement];
        }
    }
}

#pragma mark -- CMT_MySusuInvestDetailViewDelegate
- (void)selectBtnClick:(NSString *)typeId{
    self.suSelectId = typeId;
    [self investOperation];
}

#pragma mark -- 操作类型
- (void)investOperation{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getChangeOperation:[CMT_AccountTool accountModel].userId investId:self.investId operType:self.suSelectId withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if ([self.suSelectId isEqualToString:@"0"]) {
                     weakSelf.againType = @"本金收益转入余额";
                }else if([self.suSelectId isEqualToString:@"1"]){
                    weakSelf.againType = @"本金复投";
                }else if([self.suSelectId isEqualToString:@"2"]){
                    weakSelf.againType = @"本金收益复投";
                }
            }else if ([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.msg];
                [weakSelf.susuBottomView setAgainBtnTitle:self.againType];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
 
    }];
}

#pragma mark - CMT_MyYueyueInvestDetailBottomViewDelegate
- (void)toGetMoneyClick{
//收款计划
    CMT_GetMoneyPlanViewController *getMoneyVc = [[CMT_GetMoneyPlanViewController alloc] init];
    getMoneyVc.investId = self.investId;
    [self.navigationController pushViewController:getMoneyVc animated:YES];
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.myTable == tableView) {
        return 4;
    }else{
        return _myAmountGetArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.myTable == tableView) {
    CMT_MyInvestDetailTableViewCell * cell = [CMT_MyInvestDetailTableViewCell cellWithTablebView:tableView index:indexPath];
    [cell setMyCellModel:self.myModel index:indexPath];
    return cell;
    } else
    {
    CMT_AssetPortfolioTableViewCell * cell = [CMT_AssetPortfolioTableViewCell celldedWithTablebView:tableView index:indexPath];
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [cell setAmounMyCellModel:self.myAmountGetArr[indexPath.row] index:indexPath];
    
    return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.myTable == tableView) {
    return 50 ;
    
    }else{
    
    return 159 ;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.myTable == tableView) {
    if (section == 0) {
        return 8;
    }
        return 1;
    }else{
    
    return 0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
