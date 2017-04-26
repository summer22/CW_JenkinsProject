//
//  CMT_MySettingHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MyModel.h"


@protocol CMT_MySettingHeadViewDelegate <NSObject>
//充值点击事件
- (void)toRechargeClick;
//提现点击事件
- (void)toReflectClick;
//资产
- (void)toLookZC;

@end

@interface CMT_MySettingHeadView : UIView
/** delegate*/
@property (nonatomic,assign)id <CMT_MySettingHeadViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *totalNumb;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *avilableNumb;
/** 数据源 */
@property (nonatomic,strong)CMT_MyModel *myModel;
- (void)setMyDataModel:(CMT_MyModel *)model;

@end
