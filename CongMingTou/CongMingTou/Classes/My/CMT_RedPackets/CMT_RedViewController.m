        
//
//  CMT_RedViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RedViewController.h"
#import "CMT_ThreeBtnHeadView.h"
#import "CMT_RedTableViewCell.h"
#import "CMT_DefaultView.h"

@interface CMT_RedViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,CMT_ThreeBtnHeadViewDelegate>
/** 顶部三个按钮 */
@property (nonatomic,strong)CMT_ThreeBtnHeadView *topBtnView;
/** 父视图UIScrollView */
@property (nonatomic,strong)UIScrollView *bgScrollView;
/** 可用数据源 */
@property (nonatomic,strong)NSArray *dataSoureArr;
/** 已用数据源 */
@property (nonatomic,strong)NSArray *hadUserArr;
/** 过期数据源 */
@property (nonatomic,strong)NSArray *passDateArr;
/** 类型判断 */
@property (nonatomic,copy)NSString *typeId;
/** tableArr */
@property (nonatomic,strong)NSMutableArray *tableArr;
/** myTable */
@property (nonatomic,strong)UITableView *myTableView;
/** 可用默认图 */
@property (nonatomic,strong)CMT_DefaultView *userDefaultView;
@end

@implementation CMT_RedViewController

- (CMT_DefaultView *)userDefaultView{
    if (!_userDefaultView) {
        _userDefaultView = [[CMT_DefaultView alloc] initWithFrame:CGRectMake(0, CMT_NAV_Height*3, CMT_ScreenWidth, 150)];
        if (self.diffType == COUPON) {
            [_userDefaultView setImgAndLabelContent:@"1"];
        }else{
            [_userDefaultView setImgAndLabelContent:@"0"];
        }
    }
    return _userDefaultView;
}

- (CMT_ThreeBtnHeadView *)topBtnView
{
    if (!_topBtnView) {
        NSArray *titleArr;
        if (self.diffType == COUPON) {
            titleArr = @[@"可用",@"已用",@"过期"];
        }else{
            titleArr = @[@"未激活",@"已激活",@"已过期"];
        }
        _topBtnView = [[CMT_ThreeBtnHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth,  39) withTitleArr:titleArr];
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
        [self setThreeTable];
    }
    return _bgScrollView;
}

//下拉刷新
- (void)loadMyListData{
    
    if (self.diffType == COUPON) {
        [self loadData];
    }else{
        [self loadRedTicketsData];
    }
}

- (void)setThreeTable{
    
    _tableArr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 3; i++) {
        UITableView * myTable = [[UITableView alloc] initWithFrame:CGRectMake(CMT_ScreenWidth * i, 0, CMT_ScreenWidth, CMT_ScreenHeight - self.topBtnView.height - 64) style:UITableViewStyleGrouped];
        myTable.delegate = self;
        myTable.dataSource = self;
        myTable.sectionFooterHeight = 7;
        myTable.backgroundColor = [UIColor clearColor];
        if (i == 0) {
            [myTable addSubview:self.userDefaultView];
        }
        myTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMyListData)];
        [_tableArr addObject:myTable];
        [self.bgScrollView addSubview:myTable];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.stateType = TOUSER;
    self.typeId = @"1";
    if (self.diffType == COUPON) {
        [self loadData];
    }else{
       [self loadRedTicketsData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.diffType == COUPON) {
        self.title = @"加息券";
    }else{
        self.title = @"红包";
    }
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"使用规则" target:self action:@selector(toUseRule)];
    [self.view addSubview:self.topBtnView];
    [self.view addSubview:self.bgScrollView];

}

#pragma mark -- 使用规则
- (void)toUseRule{

    if (self.diffType == COUPON) {
        [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(USERREDRULE,@"5.htm") title:@"加息券使用规则"];
    }else{
        [CMT_Tools pushPickdH5:self :UrlOnedNewinesdelist str:CMT_CREATE_URL(USERREDRULE,@"3.htm") title:@"红包使用规则"];
    }
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
        if (offX == 300) {
            self.stateType = TOUSER;
            self.typeId = @"1";
        }else if(offX == 301){
            self.stateType = HADUSER;
            self.typeId = @"2";
        }else{
            self.stateType = PASSDATE;
            self.typeId = @"3";
        }
        [self cachesLoad];
    }
}

- (void)cachesLoad{
    
    if ([self.typeId isEqualToString:@"1"] && self.dataSoureArr.count>0) {
        return;
    }else if([self.typeId isEqualToString:@"2"] && self.hadUserArr.count>0){
        return;
    }else if([self.typeId isEqualToString:@"3"] && self.passDateArr.count >0){
        return;
    }else{
        if (self.diffType == COUPON) {
            [self loadData];
        }else{
            [self loadRedTicketsData];
        }
    }

}
#pragma mark = 加息券加载数据源
- (void)loadData{
    __weak  typeof(self) weakSelf = self;
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    _myTableView = _tableArr[[self.typeId integerValue] - 1];
    if (!(self.period.length > 0)) {
        self.period = @"null";
    }
    
    [CMT_ProcessTheDataTool getTicket:[CMT_AccountTool accountModel].userId type:self.typeId investAmount:@"no" period:self.period WithBlock:^(CMT_MyRedOrCouponModel *myModel, NSError *error) {
        [weakSelf hideHud];
        [_myTableView.mj_header endRefreshing];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if ([weakSelf.typeId isEqualToString:@"1"]) {
                    weakSelf.userDefaultView.hidden = myModel.dataSourceArr.count > 0 ? YES : NO;
                    self.dataSoureArr = myModel.dataSourceArr;
                }else if([weakSelf.typeId isEqualToString:@"2"]){
                    weakSelf.hadUserArr = myModel.dataSourceArr;
                }else if([weakSelf.typeId isEqualToString:@"3"]){
                    weakSelf.passDateArr = myModel.dataSourceArr;
                }
                [_myTableView reloadData];
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

#pragma mark = 红包加载数据源
- (void)loadRedTicketsData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    _myTableView = _tableArr[[self.typeId integerValue] - 1];
    CMT_Log(@"====%ld",[self.typeId integerValue] - 1);
    
    [CMT_ProcessTheDataTool getRedTicket:[CMT_AccountTool accountModel].userId type:self.typeId WithBlock:^(CMT_MyRedOrCouponModel *myModel, NSError *error) {
        [weakSelf hideHud];
        [_myTableView.mj_header endRefreshing];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                if ([weakSelf.typeId isEqualToString:@"1"]) {
                    if (myModel.dataSourceArr.count>0) {
                        weakSelf.userDefaultView.hidden = YES;
                    }else{
                        weakSelf.userDefaultView.hidden = NO;
                    }
                    weakSelf.dataSoureArr = myModel.dataSourceArr;
                }else if([weakSelf.typeId isEqualToString:@"2"]){
                    self.hadUserArr = myModel.dataSourceArr;
                }else if([weakSelf.typeId isEqualToString:@"3"]){
                    weakSelf.passDateArr = myModel.dataSourceArr;
                }
                [_myTableView reloadData];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.typeId isEqualToString:@"1"]) {
       return  self.dataSoureArr.count;
    }else if([self.typeId isEqualToString:@"2"]){
        return self.hadUserArr.count;
    }else{
         return  self.passDateArr.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_RedTableViewCell*cell = [CMT_RedTableViewCell cellWithTablebView:tableView index:indexPath];
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    if ([self.typeId isEqualToString:@"1"]) {
        [cell setDataModel:self.dataSoureArr[indexPath.section] withType:self.diffType ticketStatusType:self.stateType] ;
    }else if([self.typeId isEqualToString:@"2"]){
        [cell setDataModel:self.hadUserArr[indexPath.section] withType:self.diffType ticketStatusType:self.stateType];
    }else{
        [cell setDataModel:self.passDateArr[indexPath.section] withType:self.diffType ticketStatusType:self.stateType];
    }
   
    if (  self.stateType == TOUSER) {
        cell.userInteractionEnabled = YES;
    }else{
        cell.userInteractionEnabled = NO;;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110*CMT_6PERCENTY;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 16;
    }
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.comeFromType == MAKESUREINVESTVC){
        self.backBlock(self.dataSoureArr[indexPath.section]);
        CMT_NAV_BACK;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
