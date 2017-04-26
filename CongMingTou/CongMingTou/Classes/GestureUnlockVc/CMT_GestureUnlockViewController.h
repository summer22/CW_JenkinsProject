//
//  CMT_GestureUnlockViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"


@interface CMT_GestureUnlockViewController : CMT_BaseVIewController

// 手势类型
@property (nonatomic, assign) GestureViewControllerType type;
/** 来源*/
@property (nonatomic,assign)CMT_COMEFROMYZVC comeFromType;
/** 登录或者注册界面跳转入口*/
@property (nonatomic,assign)CMTEnterLoginType enterLoginType;
/** 进来的界面VC*/
@property (nonatomic, strong) UIViewController *preVc;
//返回
- (void)jumpBtnClick;
//清空绘制
- (void)againDisplayBtnClick;
@end
