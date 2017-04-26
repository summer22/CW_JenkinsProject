//
//  CMT_BottomBtnView.h
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CMT_BottomBtnViewDelegate <NSObject>

@optional
- (void)toPayBtnAction;
@end

@interface CMT_BottomBtnView : UIView

/** delegate*/
@property (nonatomic,assign)id <CMT_BottomBtnViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
