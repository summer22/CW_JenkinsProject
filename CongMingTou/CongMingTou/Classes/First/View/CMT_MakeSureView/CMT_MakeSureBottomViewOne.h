//
//  CMT_MakeSureBottomViewOne.h
//  CongMingTou
//
//  Created by summer on 2016/10/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_MakeSureBottomViewOne : UIView
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (strong, nonatomic) IBOutlet UIView *MyView;

- (void)setExpectMoney:(NSString *)expectStr;

@end
