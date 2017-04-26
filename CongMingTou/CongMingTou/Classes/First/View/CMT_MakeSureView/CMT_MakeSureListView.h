//
//  CMT_MakeSureListView.h
//  CongMingTou
//
//  Created by summer on 2016/10/27.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMT_MakeSureListViewDelegate <NSObject>
//轮播图点击事件
- (void)selectBtnClick:(NSString *)nameStr withId:(NSString *)typeId;
@end

@interface CMT_MakeSureListView : UIView
@property (nonatomic,assign)id <CMT_MakeSureListViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UIView *oneLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneLineH;
@property (weak, nonatomic) IBOutlet UIView *twoLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoLineH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topH;

@property (weak, nonatomic) IBOutlet UIButton *topBtn;
/** selectBtn */
@property (nonatomic,strong)UIButton *selectBtn;
@end
