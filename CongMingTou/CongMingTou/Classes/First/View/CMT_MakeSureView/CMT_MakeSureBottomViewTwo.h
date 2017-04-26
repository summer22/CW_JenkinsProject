//
//  CMT_MakeSureBottomViewTwo.h
//  CongMingTou
//
//  Created by summer on 2016/10/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_MakeSureListView.h"

@protocol CMT_MakeSureBottomViewTwoDelegate <NSObject>
//点击事件
- (void)selectBtnClick:(NSString *)typeId;
@end

@interface CMT_MakeSureBottomViewTwo : UIView<CMT_MakeSureListViewDelegate>
@property (nonatomic,assign)id <CMT_MakeSureBottomViewTwoDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *prizeLabel;
@property (weak, nonatomic) IBOutlet UIButton *mybtn;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;

@end
