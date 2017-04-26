//
//  CMT_ReflectViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_ReflectViewController : CMT_BaseVIewController
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImgUrl;
@property (weak, nonatomic) IBOutlet UILabel *thirdPayName;
@property (weak, nonatomic) IBOutlet UILabel *balance;
@property (weak, nonatomic) IBOutlet UILabel *bankName;
@property (weak, nonatomic) IBOutlet UILabel *bankLastNumb;

@end
