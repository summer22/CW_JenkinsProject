//
//  CMT_MakeSureViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/26.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"
#import "CMT_TextField.h"

@interface CMT_MakeSureViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneLineH;
@property (weak, nonatomic) IBOutlet UIView *oneLine;
@property (weak, nonatomic) IBOutlet UIView *threeLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *threeLineH;
@property (strong, nonatomic) IBOutlet UIView *contentBgView;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIButton *chongZ;
@property (nonatomic,assign)CMTBidPlanType bidPlanType;
@property (weak, nonatomic) IBOutlet UIButton *chooseTicket;
@property (weak, nonatomic) IBOutlet UIButton *FuLiJInBtn;
@property (weak, nonatomic) IBOutlet UILabel *chongzLabel;
@property (weak, nonatomic) IBOutlet CMT_TextField *myTF;
@property (weak, nonatomic) IBOutlet UILabel *balance;
@property (weak, nonatomic) IBOutlet UILabel *fuLabel;
@property (weak, nonatomic) IBOutlet UILabel *tickets;
@property (nonatomic,copy)NSString *planId;
@property (nonatomic,copy)NSString *bidId;



@end
