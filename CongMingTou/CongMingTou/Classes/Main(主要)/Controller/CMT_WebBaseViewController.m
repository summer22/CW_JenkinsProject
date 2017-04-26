//
//  CMT_WebBaseViewController.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_WebBaseViewController.h"
#import "NJKWebViewProgressView.h"
#import "NJKWebViewProgress.h"
#import "NSURLRequest+NSURLRequestWithIgnoreSSL.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "CMT_LoginViewController.h"
#import "CMT_ShareSuccessfulView.h"
#import "CMT_InvestDetailViewController.h"
#import "CMT_RealNameBindCardViewController.h"
#import "CMT_HowGetFuliJInViewController.h"
#import "CMT_RechargeViewController.h"

@interface CMT_WebBaseViewController ()<UIWebViewDelegate,NJKWebViewProgressDelegate,UMSocialUIDelegate,NSURLConnectionDelegate>
{
    NJKWebViewProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
}
@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, assign) Boolean authenticated;
@property (nonatomic, strong) NSURLRequest *loadRequest;
@property (nonatomic, strong) NSArray *markArray;
@end

@implementation CMT_WebBaseViewController

- (UIWebView *)webView{
    if(!_webView){
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, CMT_ScreenHeight - CMT_NAV_Height)];
        _webView.delegate = self;
        _webView.backgroundColor = [UIColor clearColor];
        _webView.hidden = YES;
        _webView.scrollView.backgroundColor = [UIColor clearColor];
    }
    return _webView;
}

- (UIButton *)noNetWorkbtn{
    if(!_noNetWorkbtn){
        _noNetWorkbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_noNetWorkbtn setBackgroundImage:[UIImage imageNamed:@"noNetWork"] forState:UIControlStateNormal];
        _noNetWorkbtn.size = _noNetWorkbtn.currentBackgroundImage.size;
        [_noNetWorkbtn addTarget:self action:@selector(noNetWorkbtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _noNetWorkbtn.center = CGPointMake(CMT_ScreenWidth / 2, CMT_ScreenHeight / 2 - CMT_NAV_Height);
        _noNetWorkbtn.hidden = YES;
    }
    return _noNetWorkbtn;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [CMT_Tools removeWebCacheAndCookis];
    if ([CMT_AccountTool accountModel]) {
        [self.webView reload];
    }
    [self.navigationController.navigationBar addSubview:_progressView];
    MySetObjectForKey([NSNumber numberWithInt:0], CMT_Share_key);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_progressView removeFromSuperview];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hiddenOrShowUIDidFinishOrFailLoadState:1];
    [self hideHud];
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *navtitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    CMT_Log(@"title = %@",navtitle);
    if (navtitle) {
        self.navigationItem.title  = navtitle;
    }
//    context[@"jumpToLogin"] = ^() {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self toLogin];
//    });
//    };
    context[@"h5JumpToApp"] = ^() {
        NSArray *args = [JSContext currentArguments];
        int type = [args.firstObject toInt32];
        NSString *planId;
        NSString *planType;
        if ([args objectAtIndex:1]) {
            planId = [[args objectAtIndex:1] toString];
        }
        if ([args objectAtIndex:2]) {
            planType = [[args objectAtIndex:2] toString];
        }
        switch (type) {
            //注册页
            case 1: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toRegister];
                });
                break;
            }
            //登录页
            case 2: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toLogin];
                });
                break;
            }
            //理财计划详情页
            case 3: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toInvestDetailWithType:planType planId:planId];
                });
                break;
            }
            //实名绑卡页
            case 4: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toRealNameBindCard];
                });
                break;
            }
            //如何获取福利金页
            case 5: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toHowGetFuLiJin];
                });
                break;
            }
            //充值页
            case 6: {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self toRecharge];
                });
                break;
            }
            default:
                break;
        }
    };
}

- (void)back{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hiddenOrShowUIDidFinishOrFailLoadState:0];
    [self hideHud];
    [self showHint:CMT_Error_NotNetWork];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if ([request.URL.absoluteString isEqual:@"about:blank"]) {
        return NO;
    } else if (!_authenticated) {
        _authenticated = NO;
        _urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        _loadRequest = request;
        [_urlConnection start];
        return NO;
    }
    [CMT_Tools cookiesSendValueParame:request.URL];//设定cookies传参
    NSArray *tempArray = [CMT_Tools parsingUrl:request.URL.query];
    _markArray = tempArray;
    if ([CMT_Tools isAddWithParsingUrl:request.URL.query]) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemFinishWithTitle:@"分享" target:self action:@selector(rightShareBtnClicked:)];
    }else{
        self.navigationItem.rightBarButtonItem = nil;
    }

    return YES;
}

#pragma mark-NURLConnectiondelegate

-(void)connection:(NSURLConnection*)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge*)challenge
{
    if([challenge previousFailureCount]==0)
    {
        _authenticated=YES;
        NSURLCredential*credential=[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
    }else
    {
        [challenge.sender cancelAuthenticationChallenge:challenge];
    }
}

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
    _authenticated=YES;
    [self.webView loadRequest:self.loadRequest];
    [_urlConnection cancel];
}

- (BOOL)connection:(NSURLConnection*)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace*)protectionSpace
{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

//处理连接失败情况
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    CMT_Log(@"==%@",error);
}

- (void)toLogin{
    CMT_LoginViewController *loginVc = [[CMT_LoginViewController alloc]init];
    loginVc.diffType = CMT_LOGINTYPE;
    loginVc.enterLoginType = CMTEnterLoginTypeDefaut;
    loginVc.preVc = self;
    [self.navigationController pushViewController:loginVc animated:YES];
}

- (void)toRegister {
    CMT_LoginViewController *registerVc = [[CMT_LoginViewController alloc]init];
    registerVc.diffType = CMT_REGISTERTYPE;
    registerVc.enterLoginType = CMTEnterLoginTypeDefaut;
    registerVc.preVc = self;
    [self.navigationController pushViewController:registerVc animated:YES];
}

- (void)toInvestDetailWithType:(NSString*)type planId:(NSString*)planId {
    CMT_InvestDetailViewController *vc = [[CMT_InvestDetailViewController alloc] init];
    if ([type isEqualToString:@"2"]) {
        vc.bidPlanType = CMTYyBidPlan;
    }else if ([type isEqualToString:@"1"]) {
        vc.bidPlanType = CMTSusuBidPlan;
    } else {
        vc.bidPlanType = CMTNewBidPlan;
    }
    vc.planId = planId;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toRealNameBindCard {
    CMT_RealNameBindCardViewController *realName = [[CMT_RealNameBindCardViewController alloc] init];
//    realName.fromType = CMTEnterRealNameShareResultTypeSafeAccount;
    [self.navigationController pushViewController:realName animated:YES];
}

- (void)toHowGetFuLiJin {
    CMT_HowGetFuliJInViewController *howToGet = [[CMT_HowGetFuliJInViewController alloc] init];
    [self.navigationController pushViewController:howToGet animated:YES];
}

- (void)toRecharge {
    CMT_RechargeViewController *rechargeVc = [[CMT_RechargeViewController alloc] initWithNibName:@"CMT_RechargeViewController" bundle:nil];
    rechargeVc.fromClassType = CMT_EnterFromOtherClass;
    [self.navigationController pushViewController:rechargeVc animated:YES];
}

#pragma mark - -设置分享
- (void)setShareContentWithModel:(CMT_ActivityShareContentModel *)model{
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
        [CMT_ShareTool wechatTimelineWithTitle:model.title url:model.linkUrl shareText:model.shareInfo shareImage:iconImage];
        // 分享到微信好友
        [CMT_ShareTool wechatSessionWithTitle:model.title url:model.linkUrl shareText:model.shareInfo shareImage:iconImage];
        //qq好友
        [CMT_ShareTool qqWithTitle:model.title url:model.linkUrl shareText:model.shareInfo shareImage:iconImage ];
        //qq空间
        [CMT_ShareTool qqQzoneWithTitle:model.title url:model.linkUrl shareText:model.shareInfo shareImage:iconImage];
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:CMT_UmengAppkey
                                          shareText:model.shareInfo
                                         shareImage:iconImage
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatTimeline,UMShareToWechatSession,UMShareToQQ,UMShareToQzone,nil]
                                           delegate:self];
        
    }];
}

- (void)rightShareBtnClicked:(UIButton *)button{
    NSString *userId = [CMT_AccountTool accountModel] ? [CMT_AccountTool accountModel].userId : @"0";
    [self getActivityShareContentWithActivityId:[_markArray lastObject] userId:userId];
}

- (void)getActivityShareContentWithActivityId:(NSString *)activity userId:(NSString *)userId{
    [self showHudInView:self.view hint:CMT_LoadDataWaiting];
    [CMT_ProcessTheDataTool getActivityShareContentWithActivityId:activity userId:userId andBlock:^(CMT_ActivityShareContentModel *model, NSError *error) {
        [self hideHud];
        if(!error){
            if([[NSString stringWithFormat:@"%@",model.status] isEqualToString:@"1"]){
                
                if ([model.forceLogin isEqualToString:@"0"]) {
                    [self setShareContentWithModel:model];
                }if ([model.forceLogin isEqualToString:@"1"]) {
                    [self toLogin];
                }else{
                    return ;
                }
                
            }else if ([[NSString stringWithFormat:@"%@",model.status] isEqualToString:CMT_SinglePointCode]){
                [CMT_SinglePointLoginTool addSinglePointLoginWithSelfVC:self];
            }else{
                [self showHint:model.msg];
            }
        }else{
            [self showHint:CMT_Error_NotNetWork];
        }
    }];
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    MySetObjectForKey([NSNumber numberWithInt:0], CMT_Share_key);
    [CMT_ShareSuccessfulView shareSuccessfulViewWithResponse:response.responseCode];
}

-(void)didSelectSocialPlatform:(NSString *)platformName withSocialData:(UMSocialData *)socialData{
    MySetObjectForKey([NSNumber numberWithInt:1], CMT_Share_key);
}


/**
 *  0 失败 1 成功
 */
- (void)hiddenOrShowUIDidFinishOrFailLoadState:(int)finishOrFailLoadState{
    if(finishOrFailLoadState == 0){
        self.noNetWorkbtn.hidden = NO;
    }else{
        self.noNetWorkbtn.hidden = YES;
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.webView.hidden = !self.noNetWorkbtn.hidden;
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.noNetWorkbtn];
    [self.view addSubview:self.webView];
    
    _progressProxy = [[NJKWebViewProgress alloc] init];
    self.webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;

}
#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
}


- (void)noNetWorkbtnClicked:(UIButton *)button{
    
}

@end
