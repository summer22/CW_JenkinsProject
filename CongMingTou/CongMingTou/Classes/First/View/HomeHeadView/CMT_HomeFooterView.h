//
//  CMT_HomeFooterView.h
//  CongMingTou
//
//  Created by summer on 2016/12/13.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_HomeFooterView : UIView
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UILabel *investUserNumb;
- (void)setStrData:(NSString *)dataStr;
@end
