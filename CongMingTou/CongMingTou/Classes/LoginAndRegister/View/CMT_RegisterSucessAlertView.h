//
//  CMT_RegisterSucessAlertView.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CMT_RegisterSucessAlertViewDelegate <NSObject>
//立即开启按钮点击事件
- (void)toOpenBtnClick;
@end

@interface CMT_RegisterSucessAlertView : UIView
@property (weak, nonatomic) IBOutlet UILabel *getPrizeLabel;
@property (strong, nonatomic) IBOutlet UIView *MyView;

//delegate
@property (nonatomic,assign)id<CMT_RegisterSucessAlertViewDelegate>delegate;

//显示
+ (void)showWithDelegateOwer:(id) target;
//删除
- (void)removeSelf;

@end
