//
//  CMT_InvestResultViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/28.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_InvestResultViewController.h"
#import "CMT_InvestResultHeadView.h"
#import "CMT_InvestResultTableViewCell.h"
#import "CMT_ToInvestModel.h"
#import "CMT_ShareSuccessfulView.h"
#import "CMT_ShareBtnView.h"

@interface CMT_InvestResultViewController ()<UITableViewDataSource,UITableViewDelegate,UMSocialUIDelegate,CMT_ShareBtnViewDelegate>
//tableView
@property (nonatomic,strong)UITableView *investResultTable;
/** 数据源 */
@property (nonatomic,strong)NSMutableArray *dataSourceArr;
/** tableViewHead */
@property (nonatomic,strong)CMT_InvestResultHeadView *tableHeadView;
/** CMT_ShareBtnView */
@property (nonatomic,strong)CMT_ShareBtnView *shareBtnView;
@end

@implementation CMT_InvestResultViewController

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [[NSMutableArray alloc] init];
    }
    return  _dataSourceArr;
}

//懒加载 头视图
- (CMT_InvestResultHeadView *)tableHeadView{
    if (!_tableHeadView) {
        _tableHeadView = [[CMT_InvestResultHeadView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth,123)];
        _tableHeadView.backgroundColor = [UIColor clearColor];
    }
    return _tableHeadView;
}

//懒加载 头视图
- (CMT_ShareBtnView *)shareBtnView{
    if (!_shareBtnView) {
        _shareBtnView = [[CMT_ShareBtnView alloc] initWithFrame:CGRectMake(0, CMT_ScreenHeight - 68 - 64, CMT_ScreenWidth,68)];
        _shareBtnView.delegate = self;
    }
    return _shareBtnView;
}

- (UITableView *)investResultTable{
    
    if (!_investResultTable) {
        _investResultTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - 64) style:UITableViewStylePlain];
        _investResultTable.delegate = self;
        _investResultTable.dataSource = self;
        _investResultTable.tableHeaderView = self.tableHeadView;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _investResultTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购买结果";
    [self.view addSubview:self.investResultTable];
    [self.view insertSubview:self.shareBtnView aboveSubview:self.investResultTable];
    [self.tableHeadView setModel:self.myModel];
    if (self.bidPlanType == CMTNewBidPlan) {
        self.shareBtnView.hidden = YES;
    }else{
        self.shareBtnView.hidden = NO;
    }
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"" target:self action:nil];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemFinishWithTitle:@"完成" target:self action:@selector(finish)];
}

- (void)myShareBtnAction{
    [self getShareContentData];
}

#pragma mark - 获取分享内容
- (void)getShareContentData{

    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getShareContentInfo:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo withBlock:^(CMT_GetShareContentModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqualToString:@"1"]){
                [weakSelf setShareContentWithModel:myModel];
            }else if ([myModel.status isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark - -设置分享
- (void)setShareContentWithModel:(CMT_GetShareContentModel *)model{
    __block UIImage *iconImage = nil;
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:model.imgUrl] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize){
        //处理下载进度
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (error) {//加载失败
            iconImage = [UIImage imageNamed:@"default_image"];
        }else{
            iconImage = image;
        }
   
    // 分享到微信朋友圈
    [CMT_ShareTool wechatTimelineWithTitle:model.title url:model.link shareText:model.desc shareImage:iconImage];
    // 分享到微信好友
    [CMT_ShareTool wechatSessionWithTitle:model.title url:model.link shareText:model.desc shareImage:iconImage];
    //qq好友
    [CMT_ShareTool qqWithTitle:model.title url:model.link shareText:model.desc shareImage:iconImage ];
    //qq空间
    [CMT_ShareTool qqQzoneWithTitle:model.title url:model.link shareText:model.desc shareImage:iconImage];
    [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:CMT_UmengAppkey
                                          shareText:model.desc
                                         shareImage:iconImage
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatTimeline,UMShareToWechatSession,UMShareToQQ,UMShareToQzone,nil]
                                           delegate:self];
    }];

}

#pragma mark - 友盟代理方法
-(void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData{
    
    MySetObjectForKey([NSNumber numberWithInt:1], CMT_Share_key);

    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getInvestShareStatusInfo:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo bidId:self.bidId investId:self.myModel.investId amount:[CMT_Tools numberStrWithReplace:self.myModel.investAmount] withBlock:^(CMT_BaseModel *myModel, NSError *error) {
        [weakSelf hideHud];
        if(!error){
            if([myModel.status isEqualToString:@"1"]){
                
            }else if ([myModel.status isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:myModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }

    }];
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    MySetObjectForKey([NSNumber numberWithInt:0], CMT_Share_key);
    [CMT_ShareSuccessfulView shareSuccessfulViewWithResponse:response.responseCode];
}

#pragma mark -- 导航右上角完成按钮点击事件
- (void)finish{
    CMT_NAV_BACKTO_ROOT;
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_InvestResultTableViewCell *cell = [CMT_InvestResultTableViewCell cellWithTablebView:tableView indexPath:indexPath];
    cell.backgroundColor = CommonWhiteColor;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [cell setModel:self.myModel.detailListArr[indexPath.row] index:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120 ;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
