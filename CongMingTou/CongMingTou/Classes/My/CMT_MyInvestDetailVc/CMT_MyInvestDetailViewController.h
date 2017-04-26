//
//  CMT_MyInvestDetailViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/2.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_MyInvestDetailViewController : CMT_BaseVIewController
/** 枚举类型*/
@property (nonatomic,assign)CMT_YUEANDSUSUANDFULIJINTYPE myDiffType;
/** 投资id */
@property (nonatomic,copy)NSString *investId;;

@end
