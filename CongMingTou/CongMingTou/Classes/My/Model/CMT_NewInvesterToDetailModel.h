//
//  CMT_NewInvesterToDetailModel.h
//  CongMingTou
//
//  Created by summer on 2016/11/21.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_BaseModel.h"

@interface CMT_NewInvesterToDetailModel : CMT_BaseModel
/** planid */
@property (nonatomic,copy)NSString *financialPlanId;
/** bidId */
@property (nonatomic,copy)NSString *bidId;
/** bidType */
@property (nonatomic,copy)NSString *bidType;

@end
