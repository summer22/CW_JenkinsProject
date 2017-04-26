//
//  CMT_DefaultView.h
//  CongMingTou
//
//  Created by summer on 2016/11/16.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMT_DefaultView : UIView
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UIImageView *myImg;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgW;

- (void)setData:(NSString *)myImg labelText:(NSString *)text;

//0：红包 1：加息券 2：速速赚、月月息 3：债权列表
- (void)setImgAndLabelContent:(NSString *)type;

@end
