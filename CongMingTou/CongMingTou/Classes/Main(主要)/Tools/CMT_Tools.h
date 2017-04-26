//
//  CMT_Tools.h
//  CongMingTou
//
//  Created by wzh on 16/5/6.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMT_HeadlinesViewController.h"
#import "UIButton+ImageTitleSpacing.h"

//按钮的
@class ZHButton;
typedef void(^MyBlock)(ZHButton *button) ;
@interface ZHButton : UIButton
+ (ZHButton *)buttonWithFrame:(CGRect)frame
                     fontSize:(int)size
                        title:(NSString *)title
                         type:(UIButtonType)type
                          tag:(int)tag
              backgroundImage:(NSString *)backgroundImage
                        image:(NSString *)image
                     andBlock:(MyBlock)myBlock;

+ (ZHButton *)buttonWithFrame:(CGRect)frame font:(UIFont *)font title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor selectTitleColor:(UIColor *)selectTitleColor andBlock:(MyBlock)myBlock;
@end


@interface CMT_Tools : NSObject
/**
 *  快捷打印
 *
 *  @param sourceFile   文件夹名字
 *  @param functionName 类名
 *  @param lineNumber   多少行
 *  @param format       格式
 */
+ (void)file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 *  创建含有大小标题的字符串
 *
 *  @param name          大标题字符串
 *  @param smallName     小标题字符串
 *  @param headColor     大标题字符串颜色
 *  @param backColor     小标题字符串颜色
 *  @param fontSize      大标题字符串字体大小
 *  @param smallFontSize 小标题字符串字体大小
 *
 */
+ (NSMutableAttributedString *)HeadAttributedString:(NSString *)name
                               backAttributedString:(NSString *)smallName
                 NSheadForegroundColorAttributeName:(UIColor *)headColor
                 NSbackForegroundColorAttributeName:(UIColor *)backColor
                            NSheadFontAttributeName:(CGFloat)fontSize
                            NSbackFontAttributeName:(CGFloat)smallFontSize;

/**
 *  返回前面是文字后面是数字（副标题）的富文本
 *
 */
+ (NSMutableAttributedString *)strHeadAttributedString:(NSString *)headName
                                   midAttributedString:(NSString *)midName
                                  backAttributedString:(NSString *)backName
                    NSheadForegroundColorAttributeName:(UIColor *)headColor
                    NSbackForegroundColorAttributeName:(UIColor *)midColor
                    NSbackForegroundColorAttributeName:(UIColor *)backColor
                               NSheadFontAttributeName:(CGFloat)headSize
                               NSbackFontAttributeName:(CGFloat)midFontSize
                               NSbackFontAttributeName:(CGFloat)backFontSize;

/**
 *  创建含有大小标题且倾斜的字符串
 *
 *  @param allStr      所有的字符串
 *  @param subName     小标题字符串
 *  @param cusColor    自定义颜色
 *  @param allFontSize 所有字符串的字体大小
 *  @param subFontSize 小标题的字体大小
 *
 *  @return 含有大小标题且倾斜的字符串
 */
- (NSMutableAttributedString *)LeanString:(NSString *)allStr
                                subString:(NSString *)subName
       NSbackForegroundColorAttributeName:(UIColor *)cusColor
                  NSheadFontAttributeName:(CGFloat)allFontSize
                  NSbackFontAttributeName:(CGFloat)subFontSize;

/**
 *  字符串倾斜
 *
 *  @param allStr      字符串
 *  @param cusColor    颜色
 *  @param allFontSize 字体大小
 *
 *  @return 倾斜字符串
 */
- (NSMutableAttributedString *)LeanFontString:(NSString *)allStr
           NSbackForegroundColorAttributeName:(UIColor *)cusColor
                      NSheadFontAttributeName:(CGFloat)allFontSize;


/**
 *  返回设置好的字符串
 *
 *  @param totalStr   总串
 *  @param subStr     想要设置的字符出串
 *  @param subStrFont 想要设置的字体
 *
 *  @return 返回设置好的字符串
 */
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont;

/**
 *  返回设置好的字符串
 *
 *  @param totalStr   总串
 *  @param subStr     想要设置的字符出串
 *  @param subStrFont 想要设置的字体颜色
 *
 *  @return 返回设置好的字符串
 */
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   andSubStrColor:(UIColor *)subStrColor;
/**
 *  返回设置好的字符串
 *
 *  @param totalStr   总串
 *  @param subStr     想要设置的字符出串
 *  @param subStrFont 想要设置的字体
 *  @param subStrColor 想要设置的字体颜色
 *
 *  @return 返回设置好的字符串
 */
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                               andSubStrColor:(UIColor *)subStrColor;


/**
 *  动态获取字符串的size
 *
 *  @param sizeStr 字符串
 *  @param fontsize    字体大小
 *
 *  @return size
 */
+ (CGSize)getStrSize:(NSString *)sizeStr fontSize:(float)fontsize;

/**
 *  创建button
 *
 *  @param range      设置btn的frame
 *  @param backcolor  背景色
 *  @param title      文字
 *  @param titleColor 文字颜色
 *
 */
+ (UIButton *)getButtonWithFrame:(CGRect)range
                  BackGroudColor:(UIColor*)backcolor
                           Title:(NSString *)title
                      TitleColor:(UIColor*)titleColor
                        textFont:(CGFloat)fontSize;



/**
 创建导航条右边的按钮

 @param title 文字内容
 @param imageName 图片名字
 @param type 图文排版类型
 @param target 对象
 @param action 响应时间

 */
+ (UIButton *)itemWithTitle:(NSString *)title
              WithImageName:(NSString *)imageName
          buttonContentType:(CMT_ButtonEdgeInsetsStyle)type
                     target:(id)target action:(SEL)action;

/**
 *  创建label
 *
 *  @param textStr           文字
 *  @param fontSize          字体大小
 *  @param frame             frame
 *  @param textAlignmentType 布局对称类型
 *  @param Textcolor         文字颜色
 *
 */
+ (UILabel *)getLabel:(NSString *)textStr
             textFont:(CGFloat)fontSize
            viewFrame:(CGRect)frame
       textAlignments:(NSTextAlignment)textAlignmentType
           textColors:(UIColor *)Textcolor;


/**
 *  创建一个view
 *
 *  @param range     frame
 *  @param backcolor 背景色
 *
 */
+ (UIView *)getUiviewWithFrame:(CGRect)range BackGroudColor:(UIColor*)backcolor;

/**
 *  创建一个UIImageView
 *
 *  @param range     frame
 *  @param backColor 背景色
 *
 */
+ (UIImageView *)getImageViewWithFrame:(CGRect)range BackGroudColor:(UIColor *)backColor;


+ (void)showInfoAlert:(NSString*)aInfo;

/**
 *  已知字符串的宽度求高度
 *
 *  @param string  字符串
 *  @param labStrW 字符串的宽度
 *  @param font    字体大小
 *
 *  @return 字符串的高度
 */
+ (CGFloat)boundingRectWithStrH:(NSString*)string labStrW:(CGFloat)labStrW andFont:(UIFont *)font;

/**
 *  已知字符串的高度求宽度
 *
 *  @param string  字符串
 *  @param labStrH 字符串的高度
 *  @param font    字体大小
 *
 *  @return 字符串的宽度
 */
+ (CGFloat)boundingRectWithStrW:(NSString*)string labStrH:(CGFloat)labStrH andFont:(UIFont *)font;


/**
 电话号码正则

 @param mobileNum 手机号
 @return 格式正确状态
 */
+(BOOL)isMobileNumber:(NSString *)mobileNum;


/**
 *  收益公式 ＝  利率 ＊ 投资金额 ／ 年天数（360） ＊ 计息天数
 *
 *  @param aprNum     利率
 *  @param percentNum 加息率
 *  @param amountNum  投资金额
 *  @param dayNum     计息天数
 *  @param welfareAmount  福利金
 *
 *  @return 拼接好的字符串
 */
+ (NSString *)apr:(CGFloat)aprNum  addPercent:(CGFloat)percentNum investAmount:(CGFloat)amountNum investDay:(CGFloat)dayNum welfareAmount:(CGFloat)welfareNum;

//收益公式二 返回结果数字
+ (CGFloat)myApr:(CGFloat)aprNum  addPercent:(CGFloat)percentNum amount:(CGFloat)amountNum investDay:(CGFloat)dayNum;
/**
 *  获得当前屏幕显示的vc
 *
 *  @return
 */
+ (UIViewController *)activityViewController;

+ (BOOL)moneyInputFaultTolerantToDealWithTextField:(UITextField *)textField TotalStr:(NSString *)totalStr range:(NSRange)range andString:(NSString *)string;
/**
 *  退出登录数据处理
 *
 *  @return
 */
+ (BOOL)LoginOutToDealWithAccountAndGesturePassword;
/**
 *  清楚webView缓存集cookis
 */
+ (void)removeWebCacheAndCookis;
/**
 *  倒计时计算时间
 *
 *  @param late 开始倒计时的时间戳
 *
 *  @return 倒计时读秒数
 */
+ (NSInteger)returnUploadTime:(NSTimeInterval)late;

/**
 *  解析url
 *
 *  @param url 请求url
 *
 *  @return 是否需要添加分享按钮  No 不添加  yes 添加
 */
+ (BOOL)isAddWithParsingUrl:(NSString *)url;

+ (NSArray *)parsingUrl:(NSString *)url;

/**
 加密时的参数切割拼接
 @param urlStr 拼接的参数
 */
+ (NSString *)urlCompParame:(NSString *)urlStr;

//MD5 16位加密算法
+ (NSString *)getMd5_16Bit_String:(NSString *)srcString;

//设置cookies
+ (void)cookiesSendValueParame:(NSURL *)urlStr;

//判断沙盒中是否存在广告图片，如果存在，直接显示
+ (void)showAdvertisingYesOrNo:(CGFloat)adImgHeight;

/**
 *  初始化广告页面
 */
+ (void)getAdvertisingImage;

//倒计时
+(NSString *)getNowTimeWithString:(NSString *)aTimeString;

//获取版本号
+ (NSString *)getShortVersion;

//姓名隐藏 ***
+ (NSString *)replaceNameWithStar:(NSString *)name;

//手机号中间四位 ****
+ (NSString *)replacePhonewithStar:(NSString *)phone;

//跳转H5
+ (void)pushPickdH5:(UIViewController*)vc :(UrlCondePioncd)urlCondePioncd str:(NSString*)str title:(NSString*)title;

//判断是否需要弹出手势或者指纹验证登录
+ (BOOL)isPresentGestOrFingerToConfirm;

//判断是弹出手势还是指纹
+ (BOOL)presentFingerOrGest;

//判断当前机型
+ (NSInteger)getAdImgplatType;

//字体适配
+ (CGFloat)fontDeviceFit:(CGFloat)fontValue;

//userId  设置默认值
+ (NSString *)userId:(NSString *)userIdStr;

//数字千位符去除处理
+(NSString *)numberStrWithReplace:(NSString *)numb;

//登录密码未对密码内容进行验证 登录密码应为8-16位 数字字母字母区分大小写  也可为纯数字纯字母密码
+(BOOL)isRightPwdStrRule:(NSString *)pwdStr;

//引导页的设备匹配数据源
+ (NSArray *)getNewFeatureImgSourece;

//广告默认页面
- (NSString *)getAdverImgName;

//购买结果第一条处理显示
+ (NSMutableArray *)highlightText:(NSString *)str;

//时间戳处理成date字符串
+ (NSString *)compareHomeAlertTime:(double)timerInterval;

+ (BOOL)getCurrentVC;

+ (BOOL)getCurrentView;

@end
