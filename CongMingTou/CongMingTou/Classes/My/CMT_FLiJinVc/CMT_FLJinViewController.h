//
//  CMT_FLJinViewController.h
//  CongMingTou
//
//  Created by summer on 2016/10/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseVIewController.h"

typedef NS_ENUM(NSInteger, MYFULIJINCELL_TYPE) {
    //以下是枚举成员
    //投资记录类型
    INVESTRECORD = 0,
    //收支记录
    INCOMERECORD = 1,
};

@interface CMT_FLJinViewController : CMT_BaseVIewController
/** 枚举类型判断table*/
@property (nonatomic,assign)MYFULIJINCELL_TYPE tableType;
@end
