//
//  CMT_BaseTableViewCell.h
//  CongMingTou
//
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_BaseTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIView *view;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomViewX;
@property (strong, nonatomic) IBOutlet UIView *bottomLineView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomViewH;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topViewH;
@property (strong, nonatomic) IBOutlet UIView *topLineView;
@end
