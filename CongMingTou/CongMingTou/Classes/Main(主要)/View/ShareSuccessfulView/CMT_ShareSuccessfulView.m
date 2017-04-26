//
//  CMT_ShareSuccessfulView.m
//  CongMingTou
//
//  Created by wzh on 16/7/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ShareSuccessfulView.h"
#define ShareBtnX 20
#define ShareBtnY 32
#define ShareBtnW 80
#define ShareBtnH 20

static UIButton *_shareBtn;
@implementation CMT_ShareSuccessfulView

#define CMT_AppearTime 1.5
#define CMT_DisappearTime 0.8

#define CMT_DelayTime 1.0
CMT_Singleton_m(ManageerWithShareSuccessfulView)

+ (void)shareSuccessfulViewWithPromptStr:(NSString *)promptStr{
    [CMT_ShareSuccessfulView sharedManageerWithShareSuccessfulView].frame = CGRectMake(0, -CMT_NAV_Height, CMT_ScreenWidth, CMT_NAV_Height);
    [_shareBtn setTitle:promptStr forState:UIControlStateNormal];

    [UIView animateWithDuration:CMT_AppearTime animations:^{
        [CMT_ShareSuccessfulView sharedManageerWithShareSuccessfulView].frame = CGRectMake(0, 0, CMT_ScreenWidth, CMT_NAV_Height);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:CMT_DisappearTime delay:CMT_DelayTime options:UIViewAnimationOptionLayoutSubviews animations:^{
            [CMT_ShareSuccessfulView sharedManageerWithShareSuccessfulView].frame = CGRectMake(0, -CMT_NAV_Height, CMT_ScreenWidth, CMT_NAV_Height);
        } completion:^(BOOL finished) {
            [CMT_ShareSuccessfulView sharedManageerWithShareSuccessfulView].frame = CGRectMake(0, -CMT_NAV_Height, CMT_ScreenWidth, CMT_NAV_Height);
        }];
       
    }];

}

/*
 UMSResponseCodeSuccess            = 200,        //成功
 UMSREsponseCodeTokenInvalid       = 400,        //授权用户token错误
 UMSResponseCodeBaned              = 505,        //用户被封禁
 UMSResponseCodeFaild              = 510,        //发送失败（由于内容不符合要求或者其他原因）
 UMSResponseCodeArgumentsError     = 522,        //参数错误,提供的参数不符合要求
 UMSResponseCodeEmptyContent       = 5007,       //发送内容为空
 UMSResponseCodeShareRepeated      = 5016,       //分享内容重复
 UMSResponseCodeGetNoUidFromOauth  = 5020,       //授权之后没有得到用户uid
 UMSResponseCodeAccessTokenExpired = 5027,       //token过期
 UMSResponseCodeNetworkError       = 5050,       //网络错误
 UMSResponseCodeGetProfileFailed   = 5051,       //获取账户失败
 UMSResponseCodeCancel             = 5052,        //用户取消授权
 UMSResponseCodeNotLogin           = 5053,       //用户没有登录
 UMSResponseCodeNoApiAuthority     = 100031      //QQ空间应用没有在QQ互联平台上申请上传图片到相册的权限
 */
+ (void)shareSuccessfulViewWithResponse:(UMSResponseCode)responseCode{
    [CMT_ShareSuccessfulView sharedManageerWithShareSuccessfulView].frame = CGRectMake(0, -CMT_NAV_Height, CMT_ScreenWidth, CMT_NAV_Height);
    if(responseCode == UMSResponseCodeSuccess){
        [_shareBtn setTitle:CMT_LoadDataShareSuccessful forState:UIControlStateNormal];
    }else if (responseCode == UMSResponseCodeFaild){
        [_shareBtn setTitle:CMT_LoadDataShareFaild forState:UIControlStateNormal];

    }else if (responseCode == UMSResponseCodeCancel){
        [_shareBtn setTitle:CMT_LoadDataShareCancel forState:UIControlStateNormal];
    }
    
    [UIView animateWithDuration:CMT_AppearTime animations:^{
        [CMT_ShareSuccessfulView sharedManageerWithShareSuccessfulView].frame = CGRectMake(0, 0, CMT_ScreenWidth, CMT_NAV_Height);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:CMT_DisappearTime delay:CMT_DelayTime options:UIViewAnimationOptionLayoutSubviews animations:^{
            [CMT_ShareSuccessfulView sharedManageerWithShareSuccessfulView].frame = CGRectMake(0, -CMT_NAV_Height, CMT_ScreenWidth, CMT_NAV_Height);
        } completion:^(BOOL finished) {
            [CMT_ShareSuccessfulView sharedManageerWithShareSuccessfulView].frame = CGRectMake(0, -CMT_NAV_Height, CMT_ScreenWidth, CMT_NAV_Height);
        }];
        
    }];
}

- (instancetype)init{
    if(self = [super init]){
        
        CMT_ShareSuccessfulView *shareSuccessFulView  = (CMT_ShareSuccessfulView *)_instance;
        shareSuccessFulView.backgroundColor = ThemeBackgroundColor;
        shareSuccessFulView.frame = CGRectMake(0, -CMT_NAV_Height, CMT_ScreenWidth, CMT_NAV_Height);
        
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = UIFont30;
        [_shareBtn setFrame:CGRectMake(0, ShareBtnY, CMT_ScreenWidth, ShareBtnH)];
        _shareBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [shareSuccessFulView addSubview:_shareBtn];
        
        [[UIApplication sharedApplication].keyWindow addSubview: shareSuccessFulView];
        
    }
    return self;
}

@end
