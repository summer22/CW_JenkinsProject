//
//  CMT_GuideScrollView.m
//  CongMingTou
//
//  Created by summer on 16/6/21.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_GuideScrollView.h"
#import "CMT_TabBarController.h"

@implementation CMT_GuideScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = CMT_RGBACOLOR(0.2392, 0.1333, 0.1294, 0.5);
        self.contentSize=CGSizeMake(self.bounds.size.width*5, self.bounds.size.height);
        self.pagingEnabled=YES;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        [self getImg];
    }
    return self;
}

- (void)getImg
{
    NSArray *imgArr = [CMT_Tools getNewFeatureImgSourece];
    
    for (int i = 0; i < imgArr.count; i++) {
        
        UIImageView * imageV=[[UIImageView alloc] init];
        imageV.frame=CGRectMake(self.bounds.size.width*i, 0, self.bounds.size.width, self.bounds.size.height);
        imageV.image=[UIImage imageNamed:imgArr[i]];
        [self addSubview:imageV];
    }
    
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor=[UIColor clearColor];
    button.frame=CGRectMake(self.bounds.size.width * (imgArr.count-1), 0, self.bounds.size.width, self.bounds.size.height);
    [button addTarget:self action:@selector(entermainVC) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)entermainVC
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 当前版本号 == 上次使用的版本：显示TabBarViewController
    [UIApplication sharedApplication].statusBarHidden = NO;
    window.rootViewController = [[CMT_TabBarController alloc] init];
    
    // 如何知道第一次使用这个版本？比较上次的使用情况
    NSString *versionKey = @"CFBundleShortVersionString";
    // 获得当前打开软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    MySetObjectForKey(currentVersion, versionKey);

    if (self.myDelegate && [self.myDelegate respondsToSelector:@selector(enterToHome)]) {
        [self.myDelegate enterToHome];
    }
}



@end
