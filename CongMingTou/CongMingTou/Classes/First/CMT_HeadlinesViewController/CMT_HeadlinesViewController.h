//
//  CMT_HeadlinesViewController.h
//  CongMingTou
//
//  Created by kk on 16/11/14.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_WebBaseViewController.h"
typedef enum {
UrlHeadlineslisht,          //公告列表
UrlHeadlinesdetails,        //公告详情
UrlNewinesdelist,           //轮播列表
UrlOnedNewinesdelist,       //消息列表
UrlFinancialAgreeMent,      //理财协议
UrlRegistrationAgreeMent,   //注册协议
UrlInvestMentContrAct,      //投资后查看易保全合同
UrlPortfolioPage            //资产组合页面
}UrlCondePioncd;            //如有交互需求时判断依据
@interface CMT_HeadlinesViewController : CMT_WebBaseViewController
@property(nonatomic,assign)UrlCondePioncd   urlCondePioncd;
@property(nonatomic,strong)NSString         *requestUrlstr;//url
@end
