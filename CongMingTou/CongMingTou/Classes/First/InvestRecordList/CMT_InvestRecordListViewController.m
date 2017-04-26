//
//  CMT_InvestRecordListViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestRecordListViewController.h"
#import "CMT_InvestRecordTableViewCell.h"
#import "CMT_InvestRecordModel.h"

@interface CMT_InvestRecordListViewController ()
/** pageNumb*/
@property (nonatomic,assign)NSInteger pageNum;
/** 数据源数组 */
@property (nonatomic,strong)NSMutableArray *sourceArr;
@end

@implementation CMT_InvestRecordListViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.pageNum = 0;
    
    [self getInvestRecordData:@"1"];
}

- (NSMutableArray *)sourceArr{
    if (!_sourceArr) {
        _sourceArr = [[NSMutableArray alloc] init];
    }
    return _sourceArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"投资记录";
    
    [self.myTable registerNib:[UINib nibWithNibName:@"CMT_InvestRecordTableViewCell" bundle:nil] forCellReuseIdentifier:@"CMT_InvestRecordTableViewCell"];
    self.myTable.backgroundColor = CommonBgColor;
    self.myTable.contentInset = UIEdgeInsetsMake(8, 0, 0, 0);
    self.myTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownLoadData)];
    self.myTable.mj_header.automaticallyChangeAlpha = YES;
    self.myTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //加载数据
        [self pushLoadData];
    }];

}

- (void)pullDownLoadData{
    
    self.pageNum = 0;
    [self getInvestRecordData:@"1"];
}

- (void)pushLoadData{
    [self getInvestRecordData:@"2"];
}

//获取页面数据
- (void)getInvestRecordData:(NSString *)type{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    NSString *pageStr = [NSString stringWithFormat:@"%ld",(long)self.pageNum];
    
    [CMT_ProcessTheDataTool getInvestRecordData:self.palnId withStartNum:pageStr pageSize:@"10" withBlock:^(CMT_InvestRecordModel *investRecordModel, NSError *error) {
        [weakSelf hideHud];
        [weakSelf.myTable.mj_header endRefreshing];
        [weakSelf.myTable.mj_footer endRefreshing];
        if(!error){
            if([[NSString stringWithFormat:@"%@",investRecordModel.status] isEqualToString:@"1"]){
               
                weakSelf.pageNum += investRecordModel.recordArr.count;
                if (investRecordModel.recordArr.count > 0) {
                    if ([type isEqualToString:@"1"]) {
                        if (weakSelf.sourceArr.count>0) {
                            [weakSelf.sourceArr removeAllObjects];
                        }
                    }
                    [weakSelf.sourceArr addObjectsFromArray:investRecordModel.recordArr];
                    [weakSelf.myTable reloadData];
                }else{
                    [weakSelf showHint:@"暂无更多数据"];
                }
            }else if ([[NSString stringWithFormat:@"%@",investRecordModel.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:investRecordModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}


#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_InvestRecordTableViewCell *cell = [CMT_InvestRecordTableViewCell cellWithTablebView:tableView];
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [cell setModel:self.sourceArr[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 72 ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
