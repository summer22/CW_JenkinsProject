//
//  CMT_ShareTool.m
//  CongMingTou
//
//  Created by wzh on 16/5/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "CMT_ShareTool.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialWhatsappHandler.h"
#import "UMSocialQQHandler.h"

@implementation CMT_ShareTool

+ (void)weixinWithLinkUrl:(NSString *)linkUrl{
    [UMSocialWechatHandler setWXAppId:CMT_UMWXAPPID appSecret:UMWXAppSecret url:linkUrl];
}
+ (void)qqWithLinkUrl:(NSString *)linkUrl{
    [UMSocialQQHandler setQQWithAppId:CMT_QQ_AppId appKey:CMT_QQ_AppKey url:linkUrl];
}

+ (void)wechatSessionWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage{
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
    [UMSocialData defaultData].extConfig.wechatSessionData.shareText = shareText;
    [UMSocialData defaultData].extConfig.wechatSessionData.shareImage = shareImage;
}
+ (void)wechatTimelineWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage{
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = title;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = url;
    [UMSocialData defaultData].extConfig.wechatTimelineData.shareText = shareText;
    [UMSocialData defaultData].extConfig.wechatTimelineData.shareImage = shareImage;
}
+ (void)wechatSessionWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage linkUrl:(NSString *)linkUrl{
    [self weixinWithLinkUrl:linkUrl];
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
    [UMSocialData defaultData].extConfig.wechatSessionData.shareText = shareText;
    [UMSocialData defaultData].extConfig.wechatSessionData.shareImage = shareImage;
}
+ (void)wechatTimelineWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage linkUrl:(NSString *)linkUrl{
    [self weixinWithLinkUrl:linkUrl];
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = title;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = url;
    [UMSocialData defaultData].extConfig.wechatTimelineData.shareText = shareText;
    [UMSocialData defaultData].extConfig.wechatTimelineData.shareImage = shareImage;
}
+ (void)qqWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage{
    [UMSocialData defaultData].extConfig.qqData.title = title;
    [UMSocialData defaultData].extConfig.qqData.url = url;
    [UMSocialData defaultData].extConfig.qqData.shareText = shareText;
    [UMSocialData defaultData].extConfig.qqData.shareImage = shareImage;
}

+ (void)qqQzoneWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage{
    [UMSocialData defaultData].extConfig.qzoneData.title = title;
    [UMSocialData defaultData].extConfig.qzoneData.url = url;
    [UMSocialData defaultData].extConfig.qzoneData.shareText = shareText;
    [UMSocialData defaultData].extConfig.qzoneData.shareImage = shareImage;
}

+ (void)qqWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage linkUrl:(NSString *)linkUrl{
    [self qqWithLinkUrl:linkUrl];
    [UMSocialData defaultData].extConfig.qqData.title = title;
    [UMSocialData defaultData].extConfig.qqData.url = url;
    [UMSocialData defaultData].extConfig.qqData.shareText = shareText;
    [UMSocialData defaultData].extConfig.qqData.shareImage = shareImage;
}

+ (void)qqQzoneWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage linkUrl:(NSString *)linkUrl{
    [self qqWithLinkUrl:linkUrl];
    [UMSocialData defaultData].extConfig.qzoneData.title = title;
    [UMSocialData defaultData].extConfig.qzoneData.url = url;
    [UMSocialData defaultData].extConfig.qzoneData.shareText = shareText;
    [UMSocialData defaultData].extConfig.qzoneData.shareImage = shareImage;
}
@end
