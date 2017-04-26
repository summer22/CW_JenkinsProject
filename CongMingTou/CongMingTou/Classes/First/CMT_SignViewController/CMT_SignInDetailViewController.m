//
//  CMT_SignInDetailViewController.m
//  button
//
//  Created by wzh on 16/10/25.
//  Copyright © 2016年 wzh. All rights reserved.
//

#import "CMT_SignInDetailViewController.h"
#import "CMT_SignInDayView.h"
#import "CMT_SignInDayContentView.h"
#import "CMT_SignInDayItemModel.h"
#import "CMT_QiandaoView.h"

#define CMT_ItemNum 7
#define CMT_LeftAndrightMid 10
#define CMT_ItemWeight [UIScreen mainScreen].bounds.size.width / CMT_ItemNum

@interface CMT_SignInDetailViewController ()
@property (weak, nonatomic) IBOutlet CMT_QiandaoView *QianDaoView;
@property (strong, nonatomic) IBOutlet UILabel *desDetailLab;
@property (strong, nonatomic) IBOutlet CMT_SignInDayContentView *signInDayContentView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topView_H;
@property (strong, nonatomic) IBOutlet UIButton *signInBtn;
/** 数据源 */
@property (nonatomic,strong)CMT_SignInDayItemModel *model;
@end

@implementation CMT_SignInDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getSignInfo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSignUiStatus:self.model];
    self.title = @"签到";
    
    _desDetailLab.text = @"\n签到规则：\n\n1、每日签到送福利金100元，连续签到可以获得更多的奖励。\n\n2、签到的周期为7天，断签则重新计算。";
    self.QianDaoView.signBtn.hidden = YES;
}

#pragma mark -- 获取签到信息
- (void)getSignInfo{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];

    [CMT_ProcessTheDataTool getSignData:[CMT_AccountTool accountModel].userId withBlock:^(CMT_SignInDayItemModel *signInDayItemModel, NSError *error) {
        [weakSelf hideHud];

        if(!error){
            if([[NSString stringWithFormat:@"%@",signInDayItemModel.status] isEqualToString:@"1"]){
                weakSelf.model = signInDayItemModel;
                weakSelf.QianDaoView.signDayLabel.text = [NSString stringWithFormat:@"连续签到%@天（%@/7)",signInDayItemModel.CWDays,signInDayItemModel.CWDays];
                [weakSelf signBtnStatus:weakSelf.model.isSign];
                [weakSelf setSignUiStatus:weakSelf.model];
            }else if ([[NSString stringWithFormat:@"%@",signInDayItemModel.status] isEqualToString:CMT_SinglePointCode]){
                                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:signInDayItemModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark -- 去签到信息
- (void)toSign{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];

    [CMT_ProcessTheDataTool getHadSignData:[CMT_AccountTool accountModel].userId withBlock:^(CMT_SignInDayItemModel *signInDayItemModel, NSError *error) {
        [weakSelf hideHud];

        if(!error){
            if([[NSString stringWithFormat:@"%@",signInDayItemModel.status] isEqualToString:@"1"]){
                weakSelf.model = signInDayItemModel;
                weakSelf.QianDaoView.signDayLabel.text = [NSString stringWithFormat:@"连续签到%@天（%@/7)",weakSelf.model.CWDays,weakSelf.model.CWDays];
                [weakSelf setSignUiStatus:weakSelf.model];
                [weakSelf signBtnStatus:@"0"];
                
            }else if ([[NSString stringWithFormat:@"%@",signInDayItemModel.status] isEqualToString:CMT_SinglePointCode]){
                                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:weakSelf];
            }else{
                [weakSelf showHint:signInDayItemModel.msg];
            }
        }else{
            [weakSelf showHint:CMT_Error_NotNetWork];
        }
    }];
}

#pragma mark -- 调整底部签到按钮状态
- (void)signBtnStatus:(NSString *)signStatus{
    if ([signStatus isEqualToString:@"0"]) {
        self.signInBtn.userInteractionEnabled = NO;
        [self.signInBtn setTitle:@"今日已签到" forState:UIControlStateNormal];
        [self.signInBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailNoQiang"] forState:UIControlStateNormal];
    }else{
        self.signInBtn.userInteractionEnabled = YES;
        [self.signInBtn setBackgroundImage:[UIImage imageNamed:@"CMT_DetailQIangG"] forState:UIControlStateNormal];
        if ([self.model.CWDays integerValue] != 6) {
            [self.signInBtn setTitle:@"签到＋100" forState:UIControlStateNormal];
        }else{
            [self.signInBtn setTitle:@"签到＋300" forState:UIControlStateNormal];
        }
    }
}

#pragma mark -- 签到Ui变化
- (void)setSignUiStatus:(CMT_SignInDayItemModel *)model{
    
    NSMutableArray *array = [NSMutableArray array];
    NSArray *desArr = @[@"+100",@"+100",@"+100",@"+100",@"+100",@"+100",@"+300"];
    NSArray *dayArr = @[@"第一天",@"第二天",@"第三天",@"第四天",@"第五天",@"第六天",@"第七天"];
    
    for (int i = 1; i < 8; i++) {
         CMT_SignInDayItemModel *myModel = [[CMT_SignInDayItemModel alloc]init];
            myModel.day = dayArr[i - 1];
            myModel.des = desArr[i - 1];
        if (  i <= [model.CWDays integerValue] && [model.CWDays integerValue] >= 1) {
            myModel.isSignIn = 2;
        }else{
            if ([model.CWDays integerValue] == 0 && i == 1) {
                myModel.isSignIn = 1;
            }else{
                myModel.isSignIn = 3;
            }
        }
        [array addObject:myModel];
    }
    [_signInDayContentView setDataArray:array];
}

#pragma mark -- 签到
- (IBAction)signInBtnClicked:(UIButton *)sender{
    [self toSign];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.topView_H.constant = 96 * CMT_6PERCENTY;
    self.signInBtn.titleEdgeInsets = UIEdgeInsetsMake(-6 * CMT_6PERCENTY, 0, 0, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
