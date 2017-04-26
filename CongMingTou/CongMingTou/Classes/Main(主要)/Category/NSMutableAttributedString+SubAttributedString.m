//
//  NSMutableAttributedString+SubAttributedString.m
//  Created by summer on 2016/10/24.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "NSMutableAttributedString+SubAttributedString.h"
@implementation NSMutableAttributedString (SubAttributedString)

+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr font:(UIFont *)strFont{
    return [self atttibuteWithStr:str followStr:followStr strColor:nil andFont:strFont];
}

+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr strColor:(UIColor *)strColor{
    return [self atttibuteWithStr:str followStr:followStr strColor:strColor andFont:nil];
}


+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str font:(UIFont *)strFont{
    return [self atttibuteWithStr:str followStr:nil strColor:nil andFont:strFont];
}

+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str  strColor:(UIColor *)strColor{
    return [self atttibuteWithStr:str followStr:nil strColor:strColor andFont:nil];
}


+ (NSMutableAttributedString *)atttibuteWithStr:(NSString *)str followStr:(NSString *)followStr strColor:(UIColor *)strColor andFont:(UIFont *)strFont{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange searchedRange = NSMakeRange(0, [str length]);
    NSString *pattern = @"\\d+";
    NSError *error = nil;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:str options:0 range: searchedRange];
    for (NSTextCheckingResult* match in matches){
        //带元传
        NSString *matchTextYuan = @"";
        NSString *matchText = @"";
        if(followStr){
            matchText =[str substringWithRange:[match range]];
            matchTextYuan = [[str substringWithRange:[match range]]stringByAppendingString:followStr];
        }else{
            
            matchText =[str substringWithRange:[match range]];
            matchTextYuan = [[str substringWithRange:[match range]]stringByAppendingString:@"元"];

        }
        // 设置颜色
        if(strColor){
            [attStr addAttribute:NSForegroundColorAttributeName
                           value:strColor
                           range:[str rangeOfString:matchText]];
            [attStr addAttribute:NSForegroundColorAttributeName
                           value:strColor
                           range:[str rangeOfString:matchTextYuan]];
        }
        if(strFont){
            [attStr addAttribute:NSFontAttributeName
                           value:strFont
                           range:[str rangeOfString:matchText]];
            [attStr addAttribute:NSFontAttributeName
                           value:strFont
                           range:[str rangeOfString:matchTextYuan]];
        }
    }
    return attStr;
}






+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                               andSubStrColor:(UIColor *)subStrColor{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:nil andSubStrColor:subStrColor];
    
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:subStrFont andSubStrColor:nil];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:nil subStrColor:nil tiltSize:wholeTiltSize andWhole:YES];
}
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                  subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:nil subStrColor:subStrColor tiltSize:wholeTiltSize andWhole:YES];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:subStrFont subStrColor:nil tiltSize:wholeTiltSize andWhole:YES];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                   subStrFont:(UIFont *)subStrFont
                               subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:totalStr subStrFont:subStrFont subStrColor:subStrColor tiltSize:wholeTiltSize andWhole:YES];
}





+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                               andSubStrColor:(UIColor *)subStrColor{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil andSubStrColor:subStrColor];
    
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont{
    
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont andSubStrColor:nil];
}



+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrFont:(UIFont *)subStrFont
                                     tiltSize:(float)tiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:nil tiltSize:tiltSize andWhole:NO];

}


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrFont:(UIFont *)subStrFont
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:nil tiltSize:wholeTiltSize andWhole:YES];
}
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:subStrColor tiltSize:tiltSize andWhole:NO];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:subStrColor tiltSize:wholeTiltSize andWhole:YES];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                             andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:nil tiltSize:wholeTiltSize andWhole:YES];
    
}
+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                     andTiltSize:(float)tiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:nil tiltSize:tiltSize andWhole:NO];

}


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:nil tiltSize:tiltSize andWhole:whole];
}


+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                               andSubStrColor:(UIColor *)subStrColor{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:subStrColor andTiltSize:0];
    
    
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                                  andWholeTiltSize:(float)wholeTiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:subStrColor tiltSize:wholeTiltSize andWhole:YES];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                  subStrColor:(UIColor *)subStrColor
                                  andTiltSize:(float)tiltSize{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:subStrColor tiltSize:tiltSize andWhole:NO];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:subStrFont subStrColor:nil tiltSize:tiltSize andWhole:whole];

}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                  subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    return [self attributeWithTotalStr:totalStr subStr:subStr subStrFont:nil subStrColor:subStrColor tiltSize:tiltSize andWhole:whole];
}

+ (NSAttributedString *)attributeWithTotalStr:(NSString *)totalStr
                                       subStr:(NSString *)subStr
                                   subStrFont:(UIFont *)subStrFont
                               subStrColor:(UIColor *)subStrColor
                                     tiltSize:(float)tiltSize
                                     andWhole:(BOOL)whole{
    
    if(!totalStr)return nil;
    if(!subStr) return nil;
    NSMutableAttributedString *attributeStr=  [[NSMutableAttributedString alloc]initWithString:totalStr];
    NSRange setRange = [totalStr rangeOfString:subStr];
    if(subStrFont){
        [attributeStr addAttribute:NSFontAttributeName value:subStrFont range:setRange];
    }
    if(subStrColor){
        [attributeStr addAttribute:NSForegroundColorAttributeName value:subStrColor range:setRange];
    }
    if(tiltSize != 0){
        if(whole){//整体倾斜
            [attributeStr addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:tiltSize] range:NSMakeRange(0, totalStr.length)];
        }else{//小传倾斜
            [attributeStr addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:tiltSize] range:setRange];
        }
    }

    return attributeStr;
}


@end
