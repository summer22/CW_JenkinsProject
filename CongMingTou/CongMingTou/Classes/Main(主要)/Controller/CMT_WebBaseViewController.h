//
//  CMT_WebBaseViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_WebBaseViewController : CMT_BaseVIewController
@property (nonatomic, strong) UIWebView *webView;
@property (strong, nonatomic) UIButton *noNetWorkbtn;
/**
 *  0 失败 1 成功
 */
- (void)hiddenOrShowUIDidFinishOrFailLoadState:(int)finishOrFailLoadState;
- (void)noNetWorkbtnClicked:(UIButton *)button;

- (void)back;

- (void)toLogin;

- (void)toRegister;

- (void)toInvestDetailWithType:(NSString*)type planId:(NSString*)planId;

- (void)toRealNameBindCard;

- (void)toHowGetFuLiJin;

- (void)toRecharge;

@end
