//
//  CMT_EveryDayOneSayModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_EveryDayOneSayModel : CMT_BaseModel
/** 每日一句 */
@property (nonatomic,copy)NSString *everydaySentence;
/** 日期 */
@property (nonatomic,copy)NSString *nowDate;

@end
