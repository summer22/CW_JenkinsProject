//
//  CMT_ChangeDealPwThreeStepViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_ChangeDealPwThreeStepViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
/** newPassWord */
@property (nonatomic,copy)NSString *myNewPassWord;

@end
