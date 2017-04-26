//
//  CMT_AccountModel.m
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import "CMT_AccountModel.h"
#import "ZHSandBoxPath.h"
#import "CMT_AccountModel.h"
@implementation CMT_AccountModel

+ (CMT_AccountModel *)accountModelWithDict:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];

}

/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.userId = [decoder decodeObjectForKey:@"userId"];
        self.mobileNo = [decoder decodeObjectForKey:@"mobileNo"];
        self.realNameState = [decoder decodeObjectForKey:@"realNameState"];
        self.inviteCode = [decoder decodeObjectForKey:@"inviteCode"];
        self.realName = [decoder decodeObjectForKey:@"realName"];
        self.idCardNumber = [decoder decodeObjectForKey:@"idCardNumber"];
        self.bankCardName = [decoder decodeObjectForKey:@"bankCardName"];
        self.bankCardIcon = [decoder decodeObjectForKey:@"bankCardIcon"];
        self.bankCardType = [decoder decodeObjectForKey:@"bankCardType"];
        self.bankReservedPhoneNum = [decoder decodeObjectForKey:@"bankReservedPhoneNum"];
        self.payPasswordState = [decoder decodeObjectForKey:@"payPasswordState"];
        self.bankMobile = [decoder decodeObjectForKey:@"bankMobile"];

    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.userId forKey:@"userId"];
    [encoder encodeObject:self.mobileNo forKey:@"mobileNo"];
    [encoder encodeObject:self.realNameState forKey:@"realNameState"];
    [encoder encodeObject:self.inviteCode forKey:@"inviteCode"];
    [encoder encodeObject:self.realName forKey:@"realName"];
    [encoder encodeObject:self.idCardNumber forKey:@"idCardNumber"];
    [encoder encodeObject:self.bankCardName forKey:@"bankCardName"];
    [encoder encodeObject:self.bankCardIcon forKey:@"bankCardIcon"];
    [encoder encodeObject:self.bankCardType forKey:@"bankCardType"];
    [encoder encodeObject:self.bankReservedPhoneNum forKey:@"bankReservedPhoneNum"];
    [encoder encodeObject:self.payPasswordState forKey:@"payPasswordState"];
    [encoder encodeObject:self.bankMobile forKey:@"bankMobile"];

}


//- (NSString *)userId{
//
//    if (_userId.length == 0 || [_userId isKindOfClass:[NSNull class]] || _userId == nil) {
//        return @"000000";
//    }
//    return _userId;
//}



@end
