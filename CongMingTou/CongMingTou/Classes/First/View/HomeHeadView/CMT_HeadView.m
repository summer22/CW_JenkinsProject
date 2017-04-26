//
//  CMT_HeadView.m
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_HeadView.h"
#import "SDCycleScrollView.h"
#import "CMT_MyGongGModel.h"
#import "CMT_CycleTitleView.h"
#import "CMT_HeadBottomView.h"

@interface CMT_HeadView()<SDCycleScrollViewDelegate,CMT_CycleTitleViewDelegate,CMT_HeadBottomViewDelegate>{
    SDCycleScrollView *cycleScrollView;
    UIView *Gview;
    CMT_homeModel *homeModel;
    CMT_CycleTitleView *myView;
    UIButton *gongGaoBtnImg;
    CMT_HeadBottomView *headBottomView;
}
@end

@implementation CMT_HeadView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]){
        [self setCycleView];
        [self setGongGaoView];
        [self setBottomView];
        self.backgroundColor = CommonBgColor;
    }
    return self;
}
- (void)setModel:(CMT_homeModel *)model{
    homeModel = model;
    cycleScrollView.imageURLStringsGroup = homeModel.lunBoArr;
    [myView setViewWithUpDownArray:model.gongGaoArr];
    [headBottomView setHadSignDay:[NSString stringWithFormat:@"连续签到%@/7",model.signDays.length > 0 ? model.signDays : @"0"]];
}

- (void)setBottomView{
    headBottomView = [[CMT_HeadBottomView alloc] init];
    headBottomView.delegate = self;
    [self addSubview:headBottomView];
}

- (void)setCycleView{
    cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CMT_ScreenWidth, 200 * CMT_6PERCENTY) delegate:self placeholderImage:[UIImage imageNamed:@"bannerDefault"]];
    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"CMT_BlueD"];
    cycleScrollView.pageDotImage = [UIImage imageNamed:@"CMT_whiteD"];
    [self addSubview:cycleScrollView];
}

- (void)setGongGaoView{
    
    Gview = [[UIView alloc] initWithFrame:CGRectMake(0, cycleScrollView.bottom, CMT_ScreenWidth, 36)];
    Gview.backgroundColor = CommonWhiteColor;

    gongGaoBtnImg = [[UIButton alloc] init];
    [gongGaoBtnImg setImage:[UIImage imageNamed:@"CMT_Gonggao"] forState:UIControlStateNormal];
    [gongGaoBtnImg addTarget:self action:@selector(gongGaoImgClick) forControlEvents:UIControlEventTouchUpInside];
    [Gview addSubview:gongGaoBtnImg];
    
    myView = [[CMT_CycleTitleView alloc] init];
    myView.delegate = self;
    [Gview addSubview:myView];
    [self addSubview:Gview];
}

- (void)layoutSubviews{
    gongGaoBtnImg.frame = CGRectMake(12, 10, 60, 15);
    myView.frame = CGRectMake(gongGaoBtnImg.right + 12, 0, self.frame.size.width - 60 - 24, 36);
    headBottomView.frame = CGRectMake(0, Gview.bottom + 8, CMT_ScreenWidth, 80 * CMT_6PERCENTY);
}

#pragma mark -- 公告轮播点击代理
- (void)cycleTitleScrolSelectBtnClick:(int)index{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cycleTitleScrollSelectClick:)] && homeModel.gongGaoArr.count > 0) {
        [self.delegate cycleTitleScrollSelectClick:homeModel.gongGaoArr[index]];
    }
}

#pragma mark -- gongGaoImgTapClick
- (void)gongGaoImgClick{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(gongGaoImgTapClick)]) {
        [self.delegate gongGaoImgTapClick];
    }
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cycleScrollViewSelectBtnClick:)]) {
        [self.delegate cycleScrollViewSelectBtnClick:homeModel.lunBoArr[index]];
    }
}

#pragma mark - CMT_HeadBottomViewDelegate
- (void)toSignBtnClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(toSignBtnClick)]) {
        [self.delegate toSignBtnClick];
    }
}

- (void)toSafeAgreementBtnClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(toSafeAgreementBtnClick)]) {
        [self.delegate toSafeAgreementBtnClick];
    }
}

@end
