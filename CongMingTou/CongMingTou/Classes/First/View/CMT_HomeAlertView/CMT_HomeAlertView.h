//
//  CMT_HomeAlertView.h
//  CongMingTou
//
//  Created by summer on 17/1/12.
//  Copyright © 2017年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMT_HomeAlertViewDelegate <NSObject>
- (void)clickAlertAction;
@end

@interface CMT_HomeAlertView : UIView
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (nonatomic,assign)id<CMT_HomeAlertViewDelegate>delegate;
/** 判断弹窗的类型 */
@property (nonatomic,copy)NSString *flagStr;
//显示 type:1 第一种弹窗  2 第二种弹窗
+ (void)showWithDelegateOwer:(id)target typy:(NSString *)typeStr imageType:(NSString *)imageTypeStr amountMoney:(NSString *)amount;
+ (void)removeSelf;
@end
