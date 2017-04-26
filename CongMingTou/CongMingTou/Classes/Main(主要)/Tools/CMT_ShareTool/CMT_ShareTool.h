//
//  CMT_ShareTool.h
//  CongMingTou
//
//  Created by wzh on 16/5/31.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMT_ShareTool : NSObject

/**
 *  微信好友分享
 *
 *  @param title     标题
 *  @param url  微信网页消息url
 *  @param shareText  分享文字 ／没有传空字符串
 *  @param shareImage  分享图片 ／没有传空
 */
+ (void)wechatSessionWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage;
/**
 *  微信好友分享
 *
 *  @param title     标题
 *  @param url  微信网页消息url
 *  @param shareText  分享文字 ／没有传空字符串
 *  @param shareImage  分享图片 ／没有传空
 *  @param linkUrl     分享链接
 */
+ (void)wechatSessionWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage linkUrl:(NSString *)linkUrl;

/**
 *  分享到微信朋友圈内容
 *
 *  @param title     标题
 *  @param url  微信网页消息url
 *  @param shareText  分享文字 ／没有传空字符串
 *  @param shareImage  分享图片 ／没有传空
 */
+ (void)wechatTimelineWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage;

/**
 *  分享到微信朋友圈内容
 *
 *  @param title     标题
 *  @param url  微信网页消息url
 *  @param shareText  分享文字 ／没有传空字符串
 *  @param shareImage  分享图片 ／没有传空
 *  @param linkUrl     分享链接
 */
+ (void)wechatTimelineWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage linkUrl:(NSString *)linkUrl;
/**
 *  分享到qq内容
 *
 *  @param title     标题
 *  @param url  qq网页消息url
 *  @param shareText  分享文字 ／没有传空字符串
 *  @param shareImage  分享图片 ／没有传空
 *  @param linkUrl     分享链接
 */
+ (void)qqWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage linkUrl:(NSString *)linkUrl;
/**
 *  分享到qq空间内容
 *
 *  @param title     标题
 *  @param url  qq空间网页消息url
 *  @param shareText  分享文字 ／没有传空字符串
 *  @param shareImage  分享图片 ／没有传空
 *  @param linkUrl     分享链接
 */
+ (void)qqQzoneWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage linkUrl:(NSString *)linkUrl;
+ (void)qqWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage;
+ (void)qqQzoneWithTitle:(NSString *)title url:(NSString *)url shareText:(NSString *)shareText shareImage:(id)shareImage;
@end
