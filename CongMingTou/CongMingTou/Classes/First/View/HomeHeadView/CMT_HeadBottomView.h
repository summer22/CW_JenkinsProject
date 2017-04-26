//
//  CMT_HeadBottomView.h
//  CongMingTou
//
//  Created by summer on 2016/12/13.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CMT_HeadBottomViewDelegate <NSObject>
//去签到点击事件
- (void)toSignBtnClick;
//安全保障计划点击事件
- (void)toSafeAgreementBtnClick;
@end

@interface CMT_HeadBottomView : UIView
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *hadSignDays;
@property (nonatomic,assign)id <CMT_HeadBottomViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *leftRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightBottomLabel;

- (void)setHadSignDay:(NSString *)dataStr;
@end
