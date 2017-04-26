//
//  CMT_PayMaskView.h
//  CongMingTou
//
//  Created by summer on 16/5/17.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMT_PayMaskViewDelegate <NSObject>

////使用指纹点击事件
//- (void)payMaskViewFingerPrintBtnClick;
//忘记密码点击事件
- (void)payMaskViewForgetPassBtnClick;
////返回点击事件
- (void)payMaskViewBackClick;
//密码输入框监听事件
- (void)payMaskViewPassTextField:(NSString *)passNum;

@end

@interface CMT_PayMaskView : UIView

- (instancetype)initWithFrame:(CGRect)frame;

//delegate
@property (nonatomic,strong)id<CMT_PayMaskViewDelegate>delegate;

- (void)show;

#pragma mark -- 更新显示方法
+ (void)showWithDelegateOwer:(id) target;

//删除
- (void)removeSelf;
+ (void)removeSelf;
@end
