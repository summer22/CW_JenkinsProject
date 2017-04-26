//
//  CMT_InvestRecordListViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/25.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

@interface CMT_InvestRecordListViewController : CMT_BaseVIewController
@property (weak, nonatomic) IBOutlet UITableView *myTable;
/** planId */
@property (nonatomic,copy)NSString *palnId;

@end
