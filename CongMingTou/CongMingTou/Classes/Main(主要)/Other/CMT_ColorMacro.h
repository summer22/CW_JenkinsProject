//
//  CMT_ColorMacro.h
//  CongMingTou
//
//  Created by wzh on 16/5/10.
//  Copyright © 2016年 wzh. All rights reserved.
//

#ifndef CMT_ColorMacro_h
#define CMT_ColorMacro_h

//统一蓝色
#define ThemeBlueColor [CMT_Tools colorWithHexString:@"#009eff"]

//统一的线条颜色
#define CommonLineColor [CMT_Tools colorWithHexString:@"#e0e0e0"]

//统一的背景色
#define CommonBgColor [CMT_Tools colorWithHexString:@"#f5f5f5"]

//统一的红色
#define CommonRedColor [CMT_Tools colorWithHexString:@"#ff5262"]

//统一的字体黑色 - 重要
#define CommonBlackColor [CMT_Tools colorWithHexString:@"#333333"]

//统一的字体灰色 - 次要
#define CommonGrayColor [CMT_Tools colorWithHexString:@"#666666"]

//输入框的文字
#define CommonThreeBlackColor [CMT_Tools colorWithHexString:@"#333333"]

//统一的背景的白色 ／ 统一的字体白色
#define CommonWhiteColor [UIColor whiteColor]

//首页红包的文字红
#define CommonHomeRedColor [CMT_Tools colorWithHexString:@"#f84628"]


//-----


#define ThemeBackgroundColor [CMT_Tools colorWithHexString:@"#009eff"]

#define ThemeHighLightedBackgroundColor [CMT_Tools colorWithHexString:@"#3fb6e4"]



//文字颜色
#define CommonGrayTextColor [CMT_Tools colorWithHexString:@"#8EA1B4"]

//统一橘黄色
#define CommonYellowTextColor [CMT_Tools colorWithHexString:@"#FF603E"]

//重要文字信息 黑色
#define CommonImpTextColor [CMT_Tools colorWithHexString:@"#34495e"]

//辅助次要文字
#define CommonHelpTextColor [CMT_Tools colorWithHexString:@"#c9d6df"]

//整体按钮背景橘色
#define CommonBtnBackColor [CMT_Tools colorWithHexString:@"#FF603E"]
#define CommonBtnHighLightedBackColor [CMT_Tools colorWithHexString:@"#e55638"]

//整体按钮背景橘色点击后的颜色
#define CommonLoginBtnTouchDownBackColor [CMT_Tools colorWithHexString:@"#e55638"]

//验证码按钮背景蓝色点击后的颜色
#define CommonRegisterBtnTouchDownBackColor [CMT_Tools colorWithHexString:@"#3fb6e4"]

/**
 *  @param p 输入16进制的字符串 例如：@"#f5fbff"
 */
#define customColor(p) [CMT_Tools colorWithHexString:p]

#define ColorWithRGB(r,g,b,p) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:p]


/**
 *  阴影统一的偏移量 透明度 半径大小
 */
#define CMT_ShadowOffset CGSizeMake(0, 5)
#define CMT_ShadowOpacity 0.5
#define CMT_ShadowRadius 6



#endif /* CMT_ColorMacro_h */
