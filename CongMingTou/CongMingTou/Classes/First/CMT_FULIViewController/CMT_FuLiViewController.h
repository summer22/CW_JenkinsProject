//
//  CMT_FuLiViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/27.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_TextField.h"

@interface CMT_FuLiViewController : CMT_BaseVIewController
@property (strong, nonatomic) IBOutlet UIView *MyView;
@property (weak, nonatomic) IBOutlet UIView *flCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *avaliableCountLabel;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *totalUserAccount;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineH;
@property (weak, nonatomic) IBOutlet CMT_TextField *myTF;
@property (nonatomic, copy) void(^backBlock)(NSString *userFuLiJinAccount);
/** investAmount */
@property (nonatomic,copy)NSString *investAmount;
/** bid */
@property (nonatomic,copy)NSString *bidId;

@end
