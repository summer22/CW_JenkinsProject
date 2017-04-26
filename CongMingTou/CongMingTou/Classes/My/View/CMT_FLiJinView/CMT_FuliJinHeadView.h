//
//  CMT_FuliJinHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MyFuLiInvestRecordModel.h"

@protocol CMT_FuliJinHeadViewDelegate <NSObject>
//轮播图点击事件
- (void)howToGetFuLiJInBtnAction;
@end

@interface CMT_FuliJinHeadView : UIView

/** delegate*/
@property (nonatomic,assign)id <CMT_FuliJinHeadViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *MyView;

@property (weak, nonatomic) IBOutlet UILabel *fuLMoney;
//在投收益
@property (weak, nonatomic) IBOutlet UILabel *atTimeIncome;
//待获收益
@property (weak, nonatomic) IBOutlet UILabel *willGetIncome;
//累计收益
@property (weak, nonatomic) IBOutlet UILabel *totalIncome;

- (void)setFuLiModel:(CMT_MyFuLiInvestRecordModel *)myModel;

@end
