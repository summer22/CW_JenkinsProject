//
//  CMT_ThreeBtnHeadView.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CMT_ThreeBtnHeadViewDelegate <NSObject>

@optional
//点击事件
- (void)topBtnClick:(NSInteger)btnTags;

@end

@interface CMT_ThreeBtnHeadView : UIView
/** delegate*/
@property (nonatomic,assign)id <CMT_ThreeBtnHeadViewDelegate> delegate;
/** 底部线条 */
@property (nonatomic,strong)UIView *bottomLine;
/** 拿到上一个btn */
@property (nonatomic,strong)UIButton *selectBtn;

- (instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)titleArr;

- (void)btnAction:(UIButton *)sender;
@end
