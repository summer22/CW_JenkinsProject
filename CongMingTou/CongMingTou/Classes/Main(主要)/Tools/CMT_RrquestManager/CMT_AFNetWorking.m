//
//  CMT_AFNetWorking.m
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import "CMT_AFNetWorking.h"
#import "CWUDIDTools.h"
@implementation CMT_AFNetWorking
/** post 有参数请求 */
+(void)postWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure{
    [self requestPostWithBaseURL:url params:params success:success failure:failure ];
}
/** post 无参数请求 */
+(void)postWithBaseURL:(NSString *)url success:(HttpSuccess)success failure:(HttpFailure)failure{
    
    [self requestPostWithBaseURL:url params:nil success:success failure:failure];
}

/** get 有参数请求 */
+(void)getWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure{
    
    [self requestGetWithBaseURL:url params:params success:success failure:failure];
}
/** get 无参数请求 */
+(void)getWithBaseURL:(NSString *)url success:(HttpSuccess)success failure:(HttpFailure)failure{
    [self requestGetWithBaseURL:url params:nil success:success failure:failure];
}

+ (void)requestPostWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    // 2.设置非校验证书模式
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    
    //创建字典
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",@"text/json",@"text/html",@"text/javascript", nil];
//    [manager.operationQueue cancelAllOperations];//取消队列里的请请求
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)requestGetWithBaseURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    
    NSString *secretStr = [CMT_Tools getMd5_16Bit_String:[CMT_Tools urlCompParame:url]];//截取加密生成token
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    
    AFHTTPRequestSerializer *requestSerializer =  [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",@"text/json",@"text/html",@"text/javascript", nil];
    manager.requestSerializer = requestSerializer;
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *headerFieldValueDictionary = @{@"uId":[CWUDIDTools UDID],@"version":[CMT_Tools getShortVersion],@"userId":CMT_SETDEFAULTUSERID([CMT_AccountTool accountModel].userId),@"token":secretStr,@"phoneType":@"0"};
    if (headerFieldValueDictionary != nil) {
        for (NSString *httpHeaderField in headerFieldValueDictionary.allKeys) {
            NSString *value = headerFieldValueDictionary[httpHeaderField];
            [requestSerializer setValue:value forHTTPHeaderField:httpHeaderField];
        }
    }
    [manager GET:url parameters:nil  progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success((NSDictionary *)responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (NSDictionary *)urlWithJson:(NSData *)jsonMutdic{
    NSError *error ;
    //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonMutdic options:NSJSONWritingPrettyPrinted error:&error];
    NSDictionary *content = [NSJSONSerialization JSONObjectWithData:jsonMutdic options:NSJSONReadingMutableContainers error:&error];//转换数据格式
    //    NSString *json =[[NSString alloc] initWithData:jsonMutdic encoding:NSUTF8StringEncoding];
    return content;
}

@end
