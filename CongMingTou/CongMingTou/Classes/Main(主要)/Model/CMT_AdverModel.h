//
//  CMT_AdverModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_AdverModel : CMT_BaseModel
/** 显示的时间单位秒 */
@property (nonatomic,copy)NSString *time;
/** 4的使用图 */
@property (nonatomic,copy)NSString *startAdvertImg1;
/** 5的使用图 */
@property (nonatomic,copy)NSString *startAdvertImg2;
/** 6的使用图 */
@property (nonatomic,copy)NSString *startAdvertImg3;
/** 7plus的使用图 */
@property (nonatomic,copy)NSString *startAdvertImg4;
/** linkrl */
@property (nonatomic,copy)NSString *linkUrl;

@end
