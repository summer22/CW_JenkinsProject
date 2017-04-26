//
//  CMT_MyHowToGetFLJModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/18.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_MyHowToGetFLJModel : CMT_BaseModel

/**数据源 */
@property (nonatomic,strong)NSArray *dataSourceArr;
+ (CMT_MyHowToGetFLJModel *)myModelWithDic:(NSDictionary *)dic;
@end
