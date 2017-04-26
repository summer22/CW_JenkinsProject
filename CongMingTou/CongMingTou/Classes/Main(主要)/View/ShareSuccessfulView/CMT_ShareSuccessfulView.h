//
//  CMT_ShareSuccessfulView.h
//  CongMingTou
//
//  Created by wzh on 16/7/1.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMT_Singleton.h"

@interface CMT_ShareSuccessfulView : UIView

CMT_Singleton_h(ManageerWithShareSuccessfulView);

+ (void)shareSuccessfulViewWithPromptStr:(NSString *)promptStr;
+ (void)shareSuccessfulViewWithResponse:(UMSResponseCode)responseCode;
@end
