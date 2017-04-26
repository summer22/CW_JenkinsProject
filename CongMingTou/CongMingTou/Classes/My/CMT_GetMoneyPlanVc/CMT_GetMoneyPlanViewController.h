//
//  CMT_GetMoneyPlanViewController.h
//  CongMingTou
//
//  Created by summer on 2016/11/3.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_GetMoneyPlanViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UITableView *myTable;
/** 投资id */
@property (nonatomic,copy)NSString *investId;

@end
