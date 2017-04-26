//
//  CMT_MyYueyueInvestDetailBottomView.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MyInvestRecordDetailModel.h"

@protocol CMT_MyYueyueInvestDetailBottomViewDelegate <NSObject>
//收款点击事件
- (void)toGetMoneyClick;
@end

@interface CMT_MyYueyueInvestDetailBottomView : UIView
/** delegate*/
@property (nonatomic,assign)id <CMT_MyYueyueInvestDetailBottomViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *numbLabel;
@property (weak, nonatomic) IBOutlet UIButton *getMoneyBtn;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;

- (void)setMyModel:(CMT_MyInvestRecordDetailModel *)myModel;

@end
