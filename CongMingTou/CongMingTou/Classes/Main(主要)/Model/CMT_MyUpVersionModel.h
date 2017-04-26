//
//  CMT_MyUpVersionModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/22.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"
#import "CMT_UpVersionModel.h"

@interface CMT_MyUpVersionModel : CMT_BaseModel
/** 发现栏目地址配置 */
@property (nonatomic,copy)NSString *discoveryUrl;
/** 数据源 */
@property (nonatomic,strong)CMT_UpVersionModel *versionDataModel;

+ (CMT_MyUpVersionModel *)getUpdateVersionContentModelWithDic:(NSDictionary *)dic;

@end
