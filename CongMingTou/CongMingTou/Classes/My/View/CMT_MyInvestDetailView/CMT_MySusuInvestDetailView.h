//
//  CMT_MySusuInvestDetailView.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MyInvestRecordDetailModel.h"
#import "CMT_MakeSureListView.h"

@protocol CMT_MySusuInvestDetailViewDelegate <NSObject>
//点击事件
- (void)selectBtnClick:(NSString *)typeId;
@end

@interface CMT_MySusuInvestDetailView : UIView<CMT_MakeSureListViewDelegate>

@property (nonatomic,assign)id <CMT_MySusuInvestDetailViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *numbLabel;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;

- (void)setMyModel:(CMT_MyInvestRecordDetailModel *)myModel;

- (void)setAgainBtnTitle:(NSString *)titleStr;//复投方式如果请求失败，显示选择之前的样式

@end
