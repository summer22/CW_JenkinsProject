//
//  CMT_LoginViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_LoginViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UIButton *bottomAdverBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIView *topBgView;
/** 注册和登录区别*/
@property (nonatomic,assign)CMT_LOGINORREGISTERTYPE diffType;
/** 登录或者注册界面跳转入口*/
@property (nonatomic,assign)CMTEnterLoginType enterLoginType;
/** 进来的界面VC*/
@property (nonatomic, strong) UIViewController *preVc;
/** selectBtn */
@property (nonatomic,strong)UIButton *selectBtn;
@end
