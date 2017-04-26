//
//  CMT_UpVersionModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/22.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_UpVersionModel : NSObject
/** 版本日期 */
@property (nonatomic,copy)NSString *versionDate;
/** 版本描述 */
@property (nonatomic,copy)NSString *versionDesc;
/** 版本名称 */
@property (nonatomic,copy)NSString *versionName;
/** 版本状态（ 1:不需要更新 2：建议更新 3：强制更新） */
@property (nonatomic,copy)NSString *versionStatus;
/** 下载链接 */
@property (nonatomic,copy)NSString *url;
/** 版本号 */
@property (nonatomic,copy)NSString *versionNum;

+ (CMT_UpVersionModel *)getUpdateVersionContentModelWithDic:(NSDictionary *)dic;

@end
