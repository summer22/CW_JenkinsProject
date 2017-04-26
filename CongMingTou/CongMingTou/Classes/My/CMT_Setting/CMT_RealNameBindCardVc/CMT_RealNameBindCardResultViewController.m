//
//  CMT_RealNameBindCardResultViewController.m
//  CongMingTou
//
//  Created by summer on 2016/11/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_RealNameBindCardResultViewController.h"
#import "CMT_ShareSuccessfulView.h"
#import "CMT_NewMyViewController.h"
#import "CMT_InvestViewController.h"
#import "CMT_HomeViewController.h"

@interface CMT_RealNameBindCardResultViewController ()<UMSocialUIDelegate>

@end

@implementation CMT_RealNameBindCardResultViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    MySetObjectForKey([NSNumber numberWithInt:0], CMT_Share_key);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名绑卡成功";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"" target:self action:nil];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemFinishWithTitle:@"完成" target:self action:@selector(finish)];
    self.idCardLabel.text = [self idCardShowStr];
    self.nameLabel.text = self.nameStr;
}

- (NSString *)idCardShowStr{
    NSString *cardStr;
    if (self.cardNumStr.length > 10) {
        NSString *forStr = [self.cardNumStr substringToIndex:6];
        NSString *lastFourStr = [self.cardNumStr substringFromIndex:self.cardNumStr.length - 4];
        cardStr = [NSString stringWithFormat:@"%@********%@",forStr,lastFourStr];
    }
    return cardStr;
}
#pragma mark - 分享点击
- (IBAction)shareBtnAction:(id)sender {
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
    
    [CMT_ProcessTheDataTool getRealNameResultShareStatusInfo:[CMT_AccountTool accountModel].userId phone:[CMT_AccountTool accountModel].mobileNo withBlock:^(CMT_BaseModel *myModel, NSError *error) {
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
    if (response.responseCode == UMSResponseCodeSuccess) {
        [self finish];
    }
}

#pragma Mark - 完成
- (void)finish{
    
   if(_fromType == CMTEnterRealNameShareResultTypeHowGetFuLi){//如何获取福利金
       [self.navigationController popToViewController:self.jt_navigationController.jt_viewControllers[2] animated:YES];
   }else {
       CMT_NAV_BACKTO_ROOT;
   }
}

    
- (void)viewDidLayoutSubviews{

    [super viewDidLayoutSubviews];
    self.bottomLine.backgroundColor = CommonLineColor;
    self.bottomLineH.constant = 0.5;
    self.topLine.backgroundColor = CommonLineColor;
    self.topLineH.constant = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
