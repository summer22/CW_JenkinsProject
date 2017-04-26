//
//  CMT_FingerManagerViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_FingerManagerViewController.h"
#import "CMT_FingerDealPwdConfirmViewController.h"
#import "CMT_RealNameBindCardViewController.h"
#import "CMT_SetDealPassViewController.h"

@interface CMT_FingerManagerViewController ()<UIAlertViewDelegate>

@end

@implementation CMT_FingerManagerViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([[CMT_FingerprintManagerTool fingerprintManagerModel] fingerprintOpenState] == 1) {
        [self.lockSwich setOn:YES animated:YES];
    }else{
        [self.lockSwich setOn:NO animated:YES];
    }
    if([[CMT_FingerprintManagerTool fingerprintManagerModel] fingerPayOpenState] == 1){
        [self.paySwitch setOn:YES animated:YES];
    }else{
        [self.paySwitch setOn:NO animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"指纹管理";
}
//解锁开关
- (IBAction)lockSwitchAction:(id)sender {
    
    if (self.lockSwich.on == YES) {
        [self setFingerPwd:0];
    }else{
        [self alertWithTitle:@"指纹锁提示" message:@"您要关闭指纹解锁吗？" tag:100];
    }
}

//指纹支付开关
- (IBAction)paySwitchAction:(id)sender {
    
    if ([[CMT_AccountTool accountModel].realNameState isEqualToString:@"1"]) {
        if ([[CMT_AccountTool accountModel].payPasswordState isEqualToString:@"1"]) {
            if (self.paySwitch.on == YES) {
                [self setFingerPwd:1];
            }else{
                [self alertWithTitle:@"指纹支付提示" message:@"您要关闭指纹支付吗？" tag:101];
            }
        }else{
            CMT_SetDealPassViewController *setDealVc = [[CMT_SetDealPassViewController alloc] init];
            setDealVc.diffType = CMT_SetDealPwd;
            setDealVc.comeFromType = CMT_SafeAccountClass;
            [self.navigationController pushViewController:setDealVc animated:YES];
        }
    }else{
        CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
        realName.fromType = CMTEnterRealNameShareResultTypeSafeAccount;
        [self.navigationController pushViewController:realName animated:YES];
    }
}

- (void)confirmDealPwd{
    
    __weak  typeof(self) weakSelf = self;

    CMT_FingerDealPwdConfirmViewController *fingerDealPwdConfirmVc = [[CMT_FingerDealPwdConfirmViewController alloc] init];
    fingerDealPwdConfirmVc.backBlock =  ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            CMT_FingerprintManagerModel *fingerprintModel;
            if ([CMT_FingerprintManagerTool fingerprintManagerModel]) {
                fingerprintModel = [CMT_FingerprintManagerTool fingerprintManagerModel];
            }else{
                fingerprintModel = [[CMT_FingerprintManagerModel alloc] init];
            }
            fingerprintModel.fingerPayOpenState = 1;
            [CMT_FingerprintManagerTool save:fingerprintModel];
            [weakSelf.paySwitch setOn:YES animated:YES];
            [weakSelf showHint:@"已开启指纹支付"];
        });
    };
    CMT_NAV_PUSHTO_VC(fingerDealPwdConfirmVc);
}

- (void)setFingerPwd:(NSInteger)diffType{
    [CMT_FingerprintManagerTool  fingerprintValidationWithTitle:@"请输入指纹,验证是否可以指纹验证" Block:^(BOOL success, NSError *error, NSError *deviceError) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //用户选择输入密码，切换主线程处理
            
            if(success == YES && !error && !deviceError){//验证成功
                if (diffType == 0) {
                    CMT_FingerprintManagerModel *fingerprintModel;
                    if ([CMT_FingerprintManagerTool fingerprintManagerModel]) {
                        fingerprintModel = [CMT_FingerprintManagerTool fingerprintManagerModel];
                    }else{
                        fingerprintModel = [[CMT_FingerprintManagerModel alloc] init];
                    }
                    fingerprintModel.fingerprintOpenState = 1;
                    [CMT_FingerprintManagerTool save:fingerprintModel];
                    [self.lockSwich setOn:YES animated:YES];
                    [self showHint:CMT_FingerprintValidationSuccessful];
                }else if(diffType == 1){
                    [self confirmDealPwd];
                }
            }else if (success == NO && error){//指纹验证失败，请重新验证
                [self.lockSwich setOn:NO animated:YES];
                [self.paySwitch setOn:NO animated:YES];
                if(error.code == LAErrorSystemCancel || error.code == LAErrorUserCancel ||error.code == LAErrorUserFallback){
                    [self showHint:CMT_FingerprintValidationCancel];
                }else{
                    [self showHint:CMT_Error_FingerprintValidation];
                }
            }else{
                [self.lockSwich setOn:NO animated:YES];
                [self.paySwitch setOn:NO animated:YES];
                if(deviceError.code == LAErrorTouchIDNotEnrolled){////设备Touch ID不可用，用户未录入
                    [self showHint:CMT_Error_DeviceErrorNOOpenOrNoLogin];
                }else if (deviceError.code == LAErrorTouchIDNotAvailable){ //设备Touch ID不可用，例如未打开
                    [self showHint:CMT_Error_DeviceErrorNOOpenOrNoLogin];
                }else if (deviceError.code == LAErrorPasscodeNotSet){//系统未设置密码
                    [self showHint:CMT_Error_DeviceErrorNOSetFingerprint];
                }else if (deviceError.code == LAErrorAuthenticationFailed){//授权失败
                    [self showHint:CMT_Error_DeviceErrorFingerprintValidation];
                }else{
                    [self showHint:CMT_Error_DeviceErrorFingerprintValidation];//设备不支持
                }
            }
        }];
    }];
}

#pragma mark -- alertDelagate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        if (alertView.tag == 100) {
            CMT_FingerprintManagerModel *fingerprintModel = [CMT_FingerprintManagerTool fingerprintManagerModel];
            fingerprintModel.fingerprintOpenState = 0;
            [CMT_FingerprintManagerTool save:fingerprintModel];
            [self.lockSwich setOn:NO animated:YES];
        }else if(alertView.tag == 101){
            CMT_FingerprintManagerModel *fingerprintModel = [CMT_FingerprintManagerTool fingerprintManagerModel];
            fingerprintModel.fingerPayOpenState = 0;
            [CMT_FingerprintManagerTool save:fingerprintModel];
            [self.paySwitch setOn:NO animated:YES];
        }
    }else{
        if (alertView.tag == 100) {
            [self.lockSwich setOn:YES animated:YES];
        }else if(alertView.tag == 101){
            [self.paySwitch setOn:YES animated:YES];
        }
    }
}

- (void)alertWithTitle:(NSString *)titleStr message:(NSString *)msg tag:(NSInteger)tagValue{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:titleStr message:msg delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    alertView.tag = tagValue;
    [alertView show];
}

@end
