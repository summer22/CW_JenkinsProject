//
//  CMT_AccountSafeViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_AccountSafeViewController.h"
#import "CMT_AccountSafeTableViewCell.H"
#import "CMT_SetDealPassViewController.h"
#import "CMT_AccountSafeModel.h"
#import "CMT_RealNameBindCardViewController.h"
#import "CMT_SetLoginPassViewController.h"
#import "CMT_GestureUnlockViewController.h"
#import "CMT_ChangeLgoinPassViewController.h"
#import "CMT_ChangeDealPwOneStepViewController.h"
#import "CMT_DealPwdMidViewController.h"
#import "CMT_NewMyBankViewController.h"
#import "CMT_VerificationViewController.h"
#import "CMT_FingerManagerViewController.h"

@interface CMT_AccountSafeViewController ()
/** 数据源 */
@property (nonatomic,strong)CMT_AccountSafeModel *model;
@end

@implementation CMT_AccountSafeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self loadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户安全";
    self.mytable.contentInset = UIEdgeInsetsMake(-27, 0, 0, 0);
    self.mytable.sectionHeaderHeight = 7;
    self.mytable.sectionFooterHeight = 1;
    [self.mytable reloadData];
}

#pragma mark - 加载数据
- (void)loadData{
    
    __weak  typeof(self) weakSelf = self;

    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    
    [CMT_ProcessTheDataTool getAccountSafe:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo WithBlock:^(CMT_AccountSafeModel *myModel, NSError *error) {
         [weakSelf hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                weakSelf.model = myModel;
                [weakSelf.mytable reloadData];
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 3;
    }else if(section == 1){
        return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CMT_AccountSafeTableViewCell *cell = [CMT_AccountSafeTableViewCell cellWithTablebView:tableView index:indexPath withModel:self.model];
    cell.backgroundColor = CommonWhiteColor;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50 ;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 1:
            {
                if (![[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
                    CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
                    realName.fromType = CMTEnterRealNameShareResultTypeSafeAccount;
                    [self.navigationController pushViewController:realName animated:YES];
                }
                break;
            }
            case 2:
            {
                if ([[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
                    CMT_NewMyBankViewController *myBankVc = [[CMT_NewMyBankViewController alloc] init];
                    [self.navigationController pushViewController:myBankVc animated:YES];
                }else{
                    CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
                    realName.fromType = CMTEnterRealNameShareResultTypeSafeAccount;
                    [self.navigationController pushViewController:realName animated:YES];
                }
                break;
            }
            default:
                break;
        }
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            {
                if ([self.model.loginpwd isEqualToString:@"设置"]) {
                    CMT_SetLoginPassViewController *setLoginPass = [[CMT_SetLoginPassViewController alloc] init];
                    setLoginPass.diffType = CMT_SetLoginPwd;
                    [self.navigationController pushViewController:setLoginPass animated:YES];
                }else if ([self.model.loginpwd isEqualToString:@"修改"]) {
                    CMT_ChangeLgoinPassViewController *setLoginPass = [[CMT_ChangeLgoinPassViewController alloc] init];
                    [self.navigationController pushViewController:setLoginPass animated:YES];
                }
                break;
            }
            case 1:
            {
                if ([self.model.paypwd isEqualToString:@"修改"]) {
                    CMT_DealPwdMidViewController *dealPwdVc = [[CMT_DealPwdMidViewController alloc] init];
                    [self.navigationController pushViewController:dealPwdVc animated:YES];
                }else if ([self.model.paypwd isEqualToString:@"设置"]){
                    
                    if ([[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
                        CMT_SetDealPassViewController *setDealPassVc = [[CMT_SetDealPassViewController alloc] init];
                        setDealPassVc.diffType = CMT_SetDealPwd;
                        setDealPassVc.comeFromType = CMT_SafeAccountClass;
                        [self.navigationController pushViewController:setDealPassVc animated:YES];
                    }else{
                        CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
                        realName.fromType = CMTEnterRealNameShareResultTypeSafeAccount;
                        [self.navigationController pushViewController:realName animated:YES];
                    }
                }
                break;
            }
            case 2:
            {
                CMT_GestureUnlockViewController *ges = [[CMT_GestureUnlockViewController alloc] init];
                ges.type = GestureViewControllerTypeChange;
                ges.comeFromType = CMT_AccountSafe;
                ges.enterLoginType = CMTEnterLoginTypeDefaut;
                ges.preVc = self;
                [self.navigationController pushViewController:ges animated:YES];
                break;
            }
            case 3:
            {
                CMT_NAV_PUSHTO_VC([[CMT_FingerManagerViewController alloc] init]);
                break;
            }

            default:
                break;
        }

    }else if (indexPath.section == 3){
        if([CMT_Tools LoginOutToDealWithAccountAndGesturePassword]){
            CMT_RootVC.selectedIndex = 0;
            CMT_NAV_BACKTO_ROOT;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
