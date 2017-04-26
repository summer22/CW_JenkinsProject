//
//  CMT_Tools.m
//  CongMingTou
//
//  Created by wzh on 16/5/6.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import "CMT_Tools.h"
#import <CoreText/CoreText.h>
#import "JPUSHService.h"
#import "AdvertiseView.h"
#import <CommonCrypto/CommonDigest.h>
#import "CMT_GesturesPwdModel.h"
#import "CMT_FingerprintManagerModel.h"
#import "NSString+calculate.h"
#import "AdvertiseViewController.h"
#import "AdvertiseView.h"
#import "CMT_GestureUnlockViewController.h"

#define mySalt @"2cyxmdvxtdsf"

@interface ZHButton()

@property (nonatomic, copy) MyBlock tempBlock;

@end

@implementation ZHButton
+ (ZHButton *)buttonWithFrame:(CGRect)frame fontSize:(int)size title:(NSString *)title type:(UIButtonType)type tag:(int)tag backgroundImage:(NSString *)backgroundImage image:(NSString *)image andBlock:(MyBlock)myBlock{
    
    ZHButton *button = [ZHButton buttonWithType:type];//按钮类型
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];//设置标题
    [button.titleLabel setFont:[UIFont systemFontOfSize:size]];//字体大小
    [button setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:UIControlStateNormal];//设置背景图片
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];//设置图片
    [button addTarget:button action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];//方法
    button.tag = tag;
    
    button.tempBlock = myBlock;//myBlock给tempBlock
    
    return button;
}


+ (ZHButton *)buttonWithFrame:(CGRect)frame font:(UIFont *)font title:(NSString *)title normalTitleColor:(UIColor *)normalTitleColor selectTitleColor:(UIColor *)selectTitleColor andBlock:(MyBlock)myBlock{
    
    ZHButton *button = [ZHButton buttonWithType:UIButtonTypeCustom];//按钮类型
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];//设置默认标题
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:selectTitleColor forState:UIControlStateSelected];
    [button.titleLabel setFont:font];//字体大小
    [button addTarget:button action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];//方法
    button.tempBlock = myBlock;//myBlock给tempBlock
    return button;
}
- (void)buttonClicked:(ZHButton *)button{
    button.tempBlock(button);//返回button
}

@end

@implementation CMT_Tools
+ (void)file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...
{
    if (kCWNetEnvVar != 4){
        va_list ap;
        NSString *print, *file, *function;
        va_start(ap,format);
        file = [[NSString alloc] initWithBytes: sourceFile length: strlen(sourceFile) encoding: NSUTF8StringEncoding];
            
        function = [NSString stringWithCString:functionName encoding:NSUTF8StringEncoding];
        print = [[NSString alloc] initWithFormat: format arguments: ap];
        va_end(ap);
        NSLog(@"%@:%d %@; %@\n\n", [file lastPathComponent], lineNumber, function, print);
    }
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}
//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

//设置纯数字并且是大小标题的
+ (NSMutableAttributedString *)HeadAttributedString:(NSString *)name backAttributedString:(NSString *)smallName NSheadForegroundColorAttributeName:(UIColor *)headColor NSbackForegroundColorAttributeName:(UIColor *)backColor NSheadFontAttributeName:(CGFloat)fontSize NSbackFontAttributeName:(CGFloat)smallFontSize
{
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:name   attributes:@{NSForegroundColorAttributeName:headColor, NSFontAttributeName:[UIFont fontWithName:@"Aileron-Light" size:fontSize]}];
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:smallName   attributes:@{NSForegroundColorAttributeName:backColor, NSFontAttributeName:[UIFont systemFontOfSize:smallFontSize]}];
    [str appendAttributedString:str1];
    
    return str;
}

//大小标题 但前段不是数字的
+ (NSMutableAttributedString *)strHeadAttributedString:(NSString *)headName midAttributedString:(NSString *)midName  backAttributedString:(NSString *)backName NSheadForegroundColorAttributeName:(UIColor *)headColor NSbackForegroundColorAttributeName:(UIColor *)midColor NSbackForegroundColorAttributeName:(UIColor *)backColor NSheadFontAttributeName:(CGFloat)headSize NSbackFontAttributeName:(CGFloat)midFontSize  NSbackFontAttributeName:(CGFloat)backFontSize
{
    //文字
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:headName   attributes:@{NSForegroundColorAttributeName:headColor, NSFontAttributeName:[UIFont systemFontOfSize:headSize]}];
//数字
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:midName   attributes:@{NSForegroundColorAttributeName:midColor, NSFontAttributeName:[UIFont fontWithName:@"Aileron-Light" size:midFontSize]}];
    //文字
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:backName attributes:@{NSForegroundColorAttributeName:backColor, NSFontAttributeName:[UIFont systemFontOfSize:backFontSize]}];

    [str appendAttributedString:str1];
    [str appendAttributedString:str2];

    return str;
}


//字体倾斜和副标题拼接工具
- (NSMutableAttributedString *)LeanString:(NSString *)allStr subString:(NSString *)subName  NSbackForegroundColorAttributeName:(UIColor *)cusColor NSheadFontAttributeName:(CGFloat)allFontSize NSbackFontAttributeName:(CGFloat)subFontSize
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:allStr];
    UIFont *boldFont = [UIFont boldSystemFontOfSize:allFontSize];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:[allStr rangeOfString:allStr]];//设置字符串的字体为粗体
   
    UIFont *italicFont = GetVariationOfFontWithTrait(boldFont,  //设置倾斜，需要导入coreText
                                                     kCTFontTraitItalic);
    [attrString addAttribute:NSFontAttributeName value:italicFont
                       range:[allStr rangeOfString:allStr]];
    
    [attrString addAttribute:NSForegroundColorAttributeName // 设置颜色
                       value:cusColor
                       range:[allStr rangeOfString:allStr]];
    UIFont *subboldFont = [UIFont boldSystemFontOfSize:subFontSize];
    UIFont *subItalicFont = GetVariationOfFontWithTrait(subboldFont,  //设置倾斜，需要导入coreText
                                                       kCTFontTraitItalic);
    [attrString addAttribute:NSFontAttributeName value:subItalicFont range:[allStr rangeOfString:subName]];
    
    return attrString;
}

//字体倾斜
- (NSMutableAttributedString *)LeanFontString:(NSString *)allStr  NSbackForegroundColorAttributeName:(UIColor *)cusColor NSheadFontAttributeName:(CGFloat)allFontSize
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:allStr];
    UIFont *boldFont = [UIFont boldSystemFontOfSize:allFontSize];
    [attrString addAttribute:NSFontAttributeName value:boldFont range:[allStr rangeOfString:allStr]];//设置字符串的字体为粗体
    UIFont *italicFont = GetVariationOfFontWithTrait(boldFont,  //设置倾斜，需要导入coreText
                                                     kCTFontTraitItalic);
    [attrString addAttribute:NSFontAttributeName value:italicFont
                       range:[allStr rangeOfString:allStr]];
    
    [attrString addAttribute:NSForegroundColorAttributeName // 设置颜色
                       value:cusColor
                       range:[allStr rangeOfString:allStr]];
    return attrString;
}


// 字体倾斜 需要导入<CoreText/CoreText.h>
UIFont * GetVariationOfFontWithTrait(UIFont *baseFont,
                                     CTFontSymbolicTraits trait) {
    CGFloat fontSize = [baseFont pointSize];
    CFStringRef
    baseFontName = (__bridge CFStringRef)[baseFont fontName];
    CTFontRef baseCTFont = CTFontCreateWithName(baseFontName,
                                                fontSize, NULL);
    CTFontRef ctFont =
    CTFontCreateCopyWithSymbolicTraits(baseCTFont, 0, NULL,
                                       trait, trait);
    NSString *variantFontName =
    CFBridgingRelease(CTFontCopyName(ctFont,
                                     kCTFontPostScriptNameKey));
    
    UIFont *variantFont = [UIFont fontWithName:variantFontName
                                          size:fontSize];
    CFRelease(ctFont);
    CFRelease(baseCTFont);
    return variantFont;
};


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont{

    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont andSubStrColor:nil];
}

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
                               andSubStrColor:(UIColor *)subStrColor{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil andSubStrColor:subStrColor];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                  andSubStrColor:(UIColor *)subStrColor{
    
    
    NSMutableAttributedString *attributeStr=  [[NSMutableAttributedString alloc]initWithString:totalStr];
    NSRange setRange = [totalStr rangeOfString:subStr];
    if(subStrFont){
        [attributeStr addAttribute:NSFontAttributeName value:subStrFont range:setRange];
    }
    if(subStrColor){
        [attributeStr addAttribute:NSForegroundColorAttributeName value:subStrColor range:setRange];
    }
    return attributeStr;
}


+ (CGSize)getStrSize:(NSString *)sizeStr fontSize:(float)fontsize
{
    CGSize noReadSize = [sizeStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]}];
    return noReadSize;
}

+ (UILabel *)getLabel:(NSString *)textStr textFont:(CGFloat)fontSize viewFrame:(CGRect)frame textAlignments:(NSTextAlignment)textAlignmentType textColors:(UIColor *)Textcolor
{
    UILabel *Label = [[UILabel alloc] initWithFrame:frame];
    Label.textAlignment = textAlignmentType;
    Label.text = textStr;
    Label.textColor = Textcolor;
    Label.font = [UIFont systemFontOfSize:fontSize];
    return Label;
}

+ (UIView *)getUiviewWithFrame:(CGRect)range BackGroudColor:(UIColor*)backcolor
{
    UIView *view = [[UIView alloc]initWithFrame:range];
    view.backgroundColor = backcolor;
    return view;
}

+ (UIImageView *)getImageViewWithFrame:(CGRect)range BackGroudColor:(UIColor *)backColor
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:range];
    imageView.backgroundColor = backColor;
    return imageView;
}

+ (UIButton *)getButtonWithFrame:(CGRect)range BackGroudColor:(UIColor*)backcolor Title:(NSString *)title TitleColor:(UIColor*)titleColor textFont:(CGFloat)fontSize
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = backcolor;
    button.frame = range;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    return  button;
}

+ (UIButton *)itemWithTitle:(NSString *)title WithImageName:(NSString *)imageName buttonContentType:(CMT_ButtonEdgeInsetsStyle )type target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, 0, 40, 50);
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitle:title forState:UIControlStateNormal];
    [button layoutButtonWithEdgeInsetsStyle:type];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (void)showInfoAlert:(NSString*)aInfo{
    UIAlertView *tAlert=[[UIAlertView alloc] initWithTitle:@"提示" message:aInfo delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [tAlert show];
}

//求label高度
+ (CGFloat)boundingRectWithStrH:(NSString*)string labStrW:(CGFloat)labStrW andFont:(UIFont *)font{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize size = CGSizeMake(labStrW,9999);//LableWight标签宽度，固定的
    
    CGSize retSize = [string boundingRectWithSize:size
                                          options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                       attributes:attribute
                                          context:nil].size;
    return retSize.height;
}

+ (CGFloat)boundingRectWithStrW:(NSString*)string labStrH:(CGFloat)labStrH andFont:(UIFont *)font{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize size = CGSizeMake(99999,labStrH);//LableWight标签宽度，固定的
    
    CGSize retSize = [string boundingRectWithSize:size
                                          options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                       attributes:attribute
                                          context:nil].size;
    return retSize.width;
}


//正则判断手机号码地址格式
+(BOOL)isMobileNumber:(NSString *)mobileNum
{
    
    NSString *all = @"^1([3-9][0-9])\\d{8}$";
    NSPredicate *regextestct1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", all];
    
    
    if (([regextestct1 evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(BOOL)isRightPwdStrRule:(NSString *)pwdStr{
    
    NSString *all = @"^[a-zA-Z0-9]{8,16}$";
    
    NSPredicate *regextestct1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", all];
    
    if (([regextestct1 evaluateWithObject:pwdStr] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//计算收益的公式 拼接元
+ (NSString *)apr:(CGFloat)aprNum  addPercent:(CGFloat)percentNum investAmount:(CGFloat)amountNum investDay:(CGFloat)dayNum welfareAmount:(CGFloat)welfareNum
{
    double value =((aprNum + percentNum) * amountNum + aprNum * welfareNum) / 100 /360;
    NSString *strValue = [NSString stringWithFormat:@"%.6f",value];
    double values =  [strValue doubleValue] * dayNum;
    
    if (values <= 0) {
        values = 0.00;
    }    
    NSString * profitStr = [NSString stringWithFormat:@"%.2f",values];
    return profitStr;
}

//计算收益的公式 不拼接元
+ (CGFloat)myApr:(CGFloat)aprNum  addPercent:(CGFloat)percentNum amount:(CGFloat)amountNum investDay:(CGFloat)dayNum
{
    CGFloat value =  (aprNum + percentNum) / 100  / 360 * dayNum * amountNum;
    if (value <= 0) {
        value = 0.00;
    }
    return value;
}
+ (UIViewController *)activityViewController{
    
    UIViewController* activityViewController = nil;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows){
            if(tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    
    
    NSArray *viewsArray = [window subviews];
    if([viewsArray count] > 0){
        UIView *frontView = [viewsArray objectAtIndex:0];
        id nextResponder = [frontView nextResponder];
        if([nextResponder isKindOfClass:[UIViewController class]]){
            activityViewController = nextResponder;
        }else{
            activityViewController = window.rootViewController;
        }
    }
    return activityViewController;
}
#define myDotNumbers     @"0123456789.\n"
#define myNumbers          @"0123456789\n"
+ (BOOL)moneyInputFaultTolerantToDealWithTextField:(UITextField *)textField TotalStr:(NSString *)totalStr range:(NSRange)range andString:(NSString *)string{
        if ([totalStr rangeOfString:@"0"].location==0 &&[totalStr rangeOfString:@"."].length!=1 ) {
            NSUInteger nWetLoc = [textField.text rangeOfString:@"0"].location;
            if (NSNotFound != nWetLoc) {
                NSArray*  aerNum = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
                for (int i = 0;i<aerNum.count;i++) {
                    if ([string isEqualToString:aerNum[i]]) {
                        return NO;
                    }
                }
            }
        }
        if ([totalStr rangeOfString:@"."].location ==0) {
            return NO;
        }
        NSUInteger nqNittLoc = [textField.text rangeOfString:@"."].location;
        if (NSNotFound != nqNittLoc) {
            if ([string isEqualToString:@"."]) {
                return NO;
            }
        }
        
        NSCharacterSet *cs;
        NSUInteger nDotLoc = [textField.text rangeOfString:@"."].location;
        if (NSNotFound == nDotLoc && 0 != range.location) {
            cs = [[NSCharacterSet characterSetWithCharactersInString:myNumbers]invertedSet];
            if ([string isEqualToString:@"."]) {
                return YES;
            }
        }
        else {
            cs = [[NSCharacterSet characterSetWithCharactersInString:myDotNumbers]invertedSet];
        }
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if (!basicTest) {
            return NO;
        }
        if (NSNotFound != nDotLoc && range.location > nDotLoc +2 ) {//小数点后面两位
            return NO;
            
        }
        
    return YES;

}

+ (BOOL)LoginOutToDealWithAccountAndGesturePassword{
    if([CMT_AccountTool removeEmptyAccountData]){
        /**
         *  手势登陆状态设置为未登陆
         */
//        [JPUSHService setAlias:@""
//              callbackSelector:nil
//                        object:self];
      
        return YES;
    }
    return NO;
    
}

+ (void)removeWebCacheAndCookis{
//    //清除cookies
//    NSHTTPCookie *cookie;
//    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    for (cookie in [storage cookies])
//    {
//        [storage deleteCookie:cookie];
//    }
    //清除UIWebView的缓存
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

+ (NSInteger)returnUploadTime:(NSTimeInterval)late
{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    NSString *timeString = @"";
    NSInteger lastime = 0;
    NSTimeInterval cha= now - late;
    
    if (cha/3600<1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha];
        timeString = [timeString substringToIndex:timeString.length-7];
        lastime= 60 - [timeString integerValue];
    }
    return lastime;
}


static NSString *markStr = @"activityId";
+ (BOOL)isAddWithParsingUrl:(NSString *)url{
    if(!url){
        return NO;
    }else{
        //所有参数的数组
        NSArray *parameterArray = [url componentsSeparatedByString:@"&"];
        //参数数组中第一个参数
        NSString *firstParameterStr = [parameterArray firstObject];
        //第一个参数的key value数组 ，数组第一个元素是key 第二个元素是value
        NSArray *firstKeyAndValueArray = [firstParameterStr componentsSeparatedByString:@"="];
        if([[firstKeyAndValueArray firstObject] isEqualToString:markStr] && ![[firstKeyAndValueArray lastObject]isEqual:@""] && ![[firstKeyAndValueArray lastObject]isEqual:[NSNull null]]){
            return YES;
        }else{
            return NO;
        }
    }
}

+ (NSArray *)parsingUrl:(NSString *)url{
    if(!url){
        return nil;
    }
    //所有参数的数组
    NSArray *parameterArray = [url componentsSeparatedByString:@"&"];
    //参数数组中第一个参数
    NSString *firstParameterStr = [parameterArray firstObject];
    //第一个参数的key value数组 ，数组第一个元素是key 第二个元素是value
    NSArray *firstKeyAndValueArray = [firstParameterStr componentsSeparatedByString:@"="];
    if([[firstKeyAndValueArray firstObject] isEqualToString:markStr] && ![[firstKeyAndValueArray lastObject]isEqual:@""] && ![[firstKeyAndValueArray lastObject]isEqual:[NSNull null]]){
        return firstKeyAndValueArray;
    }else{
        return nil;
    }

}

+ (NSString *)urlCompParame:(NSString *)urlStr{
    
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyyMMdd"];
    NSDate  *nowDate = [NSDate date];
    // 当前时间字符串格式
    NSString *nowDateStr = [formater stringFromDate:nowDate];
    
    urlStr = [urlStr  componentsSeparatedByString:@"?"][0];
    NSArray *compOneArr = [urlStr  componentsSeparatedByString:@"/"];
    NSString *str = [compOneArr.lastObject stringByReplacingOccurrencesOfString:@"-" withString:@"c"];
    
    NSString *totalStr = [NSString stringWithFormat:@"%@%@%@",mySalt, str, nowDateStr];
    return totalStr;
}
//16位MD5加密方式
+ (NSString *)getMd5_16Bit_String:(NSString *)srcString{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}


#pragma - mark 设置cookies
+ (void)cookiesSendValueParame:(NSURL *)urlStr
{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    NSURL *cookieHost = urlStr;
    NSString *userId = @"";
    NSString *mobileNo = @"";
    NSString *realNameState = @"";
    if([CMT_AccountTool accountModel]){
        userId = [CMT_AccountTool accountModel].userId;
        mobileNo = [CMT_AccountTool accountModel].mobileNo;
        realNameState = [CMT_AccountTool accountModel].realNameState;
        
    }
    NSDictionary *dic = @{@"userId":userId,@"mobile":mobileNo,@"version":[CMT_Tools getShortVersion],@"realNameState":realNameState};
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        // 设定 cookie
        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:
                                
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 
                                 [cookieHost host], NSHTTPCookieDomain,
                                 
                                 [cookieHost path], NSHTTPCookiePath,
                                 
                                 key,NSHTTPCookieName,
                                 
                                 obj,NSHTTPCookieValue,
                                 
                                 nil]];
        
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        
    }];
    
}

+ (void)showAdvertisingYesOrNo:(CGFloat)adImgHeight
{
    // 1.判断沙盒中是否存在广告图片，如果存在，直接显示
    NSString *filePath = [self getFilePathWithImageName:[kUserDefaults valueForKey:adImageName]];
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    CMT_Log(@"本地广告图片是否存在%ld",isExist);
    if (isExist) {// 图片存在
        CGRect Frame = CGRectMake(0, 0, CMT_ScreenWidth, adImgHeight);
        AdvertiseView *advertiseView = [[AdvertiseView alloc] initWithFrame:Frame];
        advertiseView.filePath = filePath;
        advertiseView.showtime = howtime;
        [advertiseView show];
    }
}

/**
 *  判断文件是否存在
 */
+ (BOOL)isFileExistWithFilePath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = FALSE;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

/**
 *  初始化广告页面
 */
+ (void)getAdvertisingImage
{
    // TODO 请求广告接口
    [CMT_ProcessTheDataTool getAdverDataWithBlock:^(CMT_AdverModel *myModel, NSError *error) {
        if(!error){
            if([[NSString stringWithFormat:@"%@",myModel.status] isEqualToString:@"1"]){
                NSString *imageUrl;
                if ([CMT_Tools getAdImgplatType] == 0) {
                    imageUrl = myModel.startAdvertImg1;
                }else if([CMT_Tools getAdImgplatType] == 1){
                    imageUrl = myModel.startAdvertImg2;
                }else if([CMT_Tools getAdImgplatType] == 2){
                    imageUrl = myModel.startAdvertImg3;
                }else{
                    imageUrl = myModel.startAdvertImg4;
                }
                if (myModel.time) {
                    [kUserDefaults setValue:myModel.time forKey:ADVERTIME];
                }
                if (myModel.linkUrl) {
                    [kUserDefaults setValue:myModel.linkUrl forKey:LINKURL];
                }
                
                NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
                NSString *imageName = stringArr.lastObject;
                // 拼接沙盒路径
                NSString *filePath = [self getFilePathWithImageName:imageName];
                BOOL isExist = [self isFileExistWithFilePath:filePath];
                CMT_Log(@"本地广告图片是否存取成功%ld",isExist);

                if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
                    [self downloadAdImageWithUrl:imageUrl imageName:imageName];
                }
            }
        }
    }];
}


/**
 *  下载新图片
 */
+ (void)downloadAdImageWithUrl:(NSString *)imageUrl imageName:(NSString *)imageName
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage *image = [UIImage imageWithData:data];
        
        NSString *filePath = [self getFilePathWithImageName:imageName]; // 保存文件的名称
        
        if ([UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES]) {// 保存成功
            NSLog(@"广告图片保存成功");
            [self deleteOldImage];
            [kUserDefaults setValue:imageName forKey:adImageName];
            // 如果有广告链接，将广告链接也保存下来
        }else{
            NSLog(@"保存失败");
        }
    });
}

/**
 *  删除旧图片
 */
+ (void)deleteOldImage
{
    NSString *imageName = [kUserDefaults valueForKey:adImageName];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

/**
 *  根据图片名拼接文件路径
 */
+ (NSString *)getFilePathWithImageName:(NSString *)imageName
{
    if (imageName) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        
        return filePath;
    }
    return nil;
}

+ (int)getFilePathTimeValue:(NSString *)timeValue
{
    if (timeValue) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:timeValue];
        
        return [filePath intValue];
    }
    return 0;
}

+ (NSString *)compareHomeAlertTime:(double)timerInterval{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timerInterval / 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    CMT_Log(@"时间====%@",dateString);
    return dateString;
}


+ (NSString *)getNowTimeWithString:(NSString *)aTimeString{
    
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // 截止时间date格式
    NSDate  *expireDate = [formater dateFromString:aTimeString];
    NSDate  *nowDate = [NSDate date];
    // 当前时间字符串格式
    NSString *nowDateStr = [formater stringFromDate:nowDate];
    // 当前时间date格式
    nowDate = [formater dateFromString:nowDateStr];
    
    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    if (hours<10) {
        hoursStr = [NSString stringWithFormat:@"0%d",hours];
    }else{
        hoursStr = [NSString stringWithFormat:@"%d",hours];
    }
    //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"0%d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"0%d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (hours<=0&&minutes<=0&&seconds<=0) {
        return @" ";
    }
    if (days) {
        return [NSString stringWithFormat:@"%@天 %@时 %@分 %@秒 后更新", dayStr,hoursStr, minutesStr,secondsStr];
    }
    return [NSString stringWithFormat:@"%@时 %@分 %@秒 后更新",hoursStr , minutesStr,secondsStr];
}

+ (NSString *)getShortVersion{
    //当前app版本号
    NSString *versionKey = @"CFBundleShortVersionString";
   return [NSBundle mainBundle].infoDictionary[versionKey];
}

+ (NSString *)replaceNameWithStar:(NSString *)name
{
    if (name.length > 0) {
        NSString *OneStr =[name substringToIndex:1];
        NSString *newStr = [[NSString alloc] init];
        NSString *xinStr = @"*";
        for (int i = 1; i < name.length; i++)
        {
            newStr =  [newStr stringByAppendingString:xinStr];
        }
        newStr = [OneStr stringByAppendingString:newStr];
        return newStr;
    }else{
        return @"";
    }
}

+ (NSString *)replacePhonewithStar:(NSString *)phone{
    if (phone.length >= CMT_PhoneNumLenght) {
        NSString *threeNumbStr = [phone substringToIndex:3];
        NSString *lastFourNumbStr = [phone substringFromIndex:7];
        NSString *fourStar = @"****";
        return [NSString stringWithFormat:@"%@%@%@",threeNumbStr,fourStar,lastFourNumbStr];
    }
    return @"";
}

//跳转H5
+ (void)pushPickdH5:(UIViewController*)vc :(UrlCondePioncd)urlCondePioncd str:(NSString*)str title:(NSString*)title{
    CMT_HeadlinesViewController *headeltVc = [[CMT_HeadlinesViewController alloc] initWithNibName:@"CMT_HeadlinesViewController" bundle:nil];
    headeltVc.urlCondePioncd = urlCondePioncd;
    headeltVc.requestUrlstr =  str;
    headeltVc.navigationItem.title =  title;
    [vc.navigationController pushViewController:headeltVc animated:YES];
}

//判断是否需要弹出手势或者指纹验证登录
+ (BOOL)isPresentGestOrFingerToConfirm{

    if ([CMT_AccountTool accountModel]) {
        if ([CMT_GesturesPasswordTool gesturesPwdModel].openState == 1 || [CMT_FingerprintManagerTool fingerprintManagerModel].fingerprintOpenState == 1) {
            return YES;
        }
    }
    return NO;
}

//判断是弹出手势还是指纹
+ (BOOL)presentFingerOrGest{
    
    if ([CMT_FingerprintManagerTool fingerprintManagerModel].fingerprintOpenState == 1) {
        return YES;
    }
    return NO;
}

//启动广告第几页
+ (NSInteger)getAdImgplatType{
    
    if (CMT_ScreenHeight == 480) {
        return 0;
    }else if(CMT_ScreenHeight == 568){
        return 1;
    }else if(CMT_ScreenHeight == 667){
        return 2;
    }else{
        return 3;
    }
}
//引导页
+ (NSArray *)getNewFeatureImgSourece{
    if (CMT_ScreenHeight == 480) {
        return @[@"960_0",@"960_1",@"960_2",@"960_3",@"960_4"];
    }else if(CMT_ScreenHeight == 568){
        return @[@"1136_0",@"1136_1",@"1136_2",@"1136_3",@"1136_4"];
    }else if(CMT_ScreenHeight == 667){
        return @[@"1334_0",@"1334_1",@"1334_2",@"1334_3",@"1334_4"];
    }else{
        return @[@"1242_0",@"1242_1",@"1242_2",@"1242_3",@"1242_4"];
    }
}
//广告默认页面
- (NSString *)getAdverImgName{
    if (CMT_ScreenHeight == 480) {
        return @"AdverDefault_960";
    }else if(CMT_ScreenHeight == 568){
        return @"AdverDefault_1136";
    }else if(CMT_ScreenHeight == 667){
        return @"AdverDefault_1334";
    }else{
        return @"AdverDefault_1242";
    }
}

//不同机型字体适配
+ (CGFloat)fontDeviceFit:(CGFloat)fontValue{
    if(CMT_6plusPERCENTY)
    {
        return fontValue;
    }else if(CMT_6PERCENTY)
    {
        return fontValue * 0.9;
    }
     return fontValue * 0.8;
}

+ (NSString *)userId:(NSString *)userIdStr{
    if (!userIdStr || userIdStr.length == 0 || [userIdStr isKindOfClass:[NSNull class]] || userIdStr == nil ){
        userIdStr = @"000000";
    }
    return userIdStr;
}

+(NSString *)numberStrWithReplace:(NSString *)numb{

    return [numb stringByReplacingOccurrencesOfString:@"," withString:@""];
}

#pragma mark - 富文本部分字体飘灰
+ (NSMutableArray *)highlightText:(NSString *)str {
    NSMutableArray *arrs = [[NSMutableArray alloc] init];
    NSArray *arr = [str componentsSeparatedByString:@"\n"];
    NSRange oneRange;
    NSRange twoRange;
    NSRange threeRange;
    if (arr.count>1) {
         oneRange = [arr[0] rangeOfString:@"("];
        twoRange = [arr[0] rangeOfString:@")"];
    }
    NSInteger aLength = twoRange.location - oneRange.location;
    threeRange.location = oneRange.location;
    threeRange.length = aLength + 1;
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:arr[0]];
    if (threeRange.length > 1) {
        [attributeStr addAttribute:NSForegroundColorAttributeName
                             value:CommonRedColor
                             range:threeRange];
        [attributeStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12.0f] range:threeRange];
        [arrs addObject: attributeStr];
    }else{
        NSMutableAttributedString *originStrOne = [[NSMutableAttributedString alloc] initWithString:arr[0]  attributes:@{NSForegroundColorAttributeName:CommonGrayColor, NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
        [arrs addObject: originStrOne];
    }
    NSRange aRange;
    NSRange bRange;
    NSRange cRange;
    if (arr.count>1) {
        aRange = [arr[1] rangeOfString:@"("];
        bRange = [arr[1] rangeOfString:@")"];
    }
    NSInteger myLength = bRange.location - aRange.location;
    cRange.location = aRange.location;
    cRange.length = myLength + 1;
    
    NSMutableAttributedString *attributeStrs = [[NSMutableAttributedString alloc] initWithString:arr[1]];

    if (cRange.length > 1) {
        [attributeStrs addAttribute:NSForegroundColorAttributeName
                             value:CommonRedColor
                             range:cRange];
        [attributeStrs addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12.0f] range:cRange];
        [arrs addObject: attributeStrs];
    }else{
        NSMutableAttributedString *originStrTwo = [[NSMutableAttributedString alloc] initWithString:arr[1]  attributes:@{NSForegroundColorAttributeName:CommonGrayColor, NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
        [arrs addObject: originStrTwo];
    }
    return arrs;
}

+ (BOOL)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]){
        result = nextResponder;
    }else{
        result = window.rootViewController;
    }
    
    if ([result isKindOfClass:[AdvertiseViewController class]] || [result isKindOfClass:[CMT_GestureUnlockViewController class]]) {
        return NO;
    }
    return YES;
}

+ (BOOL)getCurrentView
{
    NSArray* windows = [UIApplication sharedApplication].windows;
    
    UIWindow *_window = [windows objectAtIndex:0];
    
    UIView *_parentView;
    
    if(_window.subviews.count > 0){
        _parentView = _window.subviews.lastObject;
    }
    if ([_parentView isKindOfClass:[AdvertiseView class]]) {
        CMT_Log(@"*********");
        return NO;
    }
    return YES;
}
@end
