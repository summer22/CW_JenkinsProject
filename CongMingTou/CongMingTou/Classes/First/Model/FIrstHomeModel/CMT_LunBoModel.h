//
//  CMT_LunBoModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/4.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_LunBoModel : CMT_BaseModel
/** 跳转链接 */
@property (nonatomic,copy)NSString *linkUrl;
/** 图片链接 */
@property (nonatomic,copy)NSString *bannerImgUrl;

+ (CMT_LunBoModel *)myLunBoModelWithDic:(NSDictionary *)dic;

@end
