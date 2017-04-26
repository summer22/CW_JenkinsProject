//
//  NSURLRequest+NSURLRequestWithIgnoreSSL.m
//  CongMingTou
//
//  Created by summer on 2016/12/20.
//  Copyright © 2016年 QiYuan. All rights reserved.
//

#import "NSURLRequest+NSURLRequestWithIgnoreSSL.h"

@implementation NSURLRequest (NSURLRequestWithIgnoreSSL)
//最后还需要一个NSURLRequest(NSURLRequestWithIgnoreSSL)的扩展，.m文件中只需要一个函数就好了。

+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host
{
    return YES;
}

@end
