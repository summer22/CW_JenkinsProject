//
//  AdvertiseView.h
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define ADVERTIME @"ADVERTIMES"
#define LINKURL @"LINEKURL"
#define howtime [[kUserDefaults valueForKey:ADVERTIME] intValue]
static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";
@interface AdvertiseView : UIView

/** 显示广告页面方法*/
- (void)show;

/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;
/** 显示时间 */
@property (nonatomic,assign)int showtime;


@end
