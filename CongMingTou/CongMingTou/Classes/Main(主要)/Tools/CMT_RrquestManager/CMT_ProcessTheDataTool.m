//
//  CMT_ProcessTheDataTool.m
//  OongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import "CMT_ProcessTheDataTool.h"
#import "MJExtension.h"

@implementation CMT_ProcessTheDataTool

+ (void)getFirstDateBlock:(void(^)(CMT_homeModel *homeModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getFirstListData] success:^(id json) {
        CMT_Log(@"首页数据json－%@",json);
        if (block) {
            CMT_homeModel *model = [[CMT_homeModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"首页数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getSignData:(NSString *)userId withBlock:(void(^)(CMT_SignInDayItemModel *signInDayItemModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getSignData:userId] success:^(id json) {
        CMT_Log(@"获取签到信息数据json－%@",json);
        if (block) {
            CMT_SignInDayItemModel *model = [[CMT_SignInDayItemModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"获取签到信息数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getHadSignData:(NSString *)userId withBlock:(void(^)(CMT_SignInDayItemModel *signInDayItemModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getHadSignData:userId] success:^(id json) {
        CMT_Log(@"去签到数据json－%@",json);
        if (block) {
            CMT_SignInDayItemModel *model = [[CMT_SignInDayItemModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"去签到数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getInvestData:(NSString *)type withBlock:(void(^)(CMT_InvestModel *investModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getInvestData:type] success:^(id json) {
        CMT_Log(@"投资计划列表数据json－%@",json);
        if (block) {
            CMT_InvestModel *model = [[CMT_InvestModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"投资计划列表数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getInvestDetailData:(NSString *)userID withBid:(NSString *)bid withBlock:(void(^)(CMT_InvestDetailModel *investDetailModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getInvestPlanDetailData:userID withBid:bid] success:^(id json) {
        CMT_Log(@"投资计划详情数据json－%@",json);
        if (block) {
            CMT_InvestDetailModel *model = [[CMT_InvestDetailModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"投资计划详情数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];

}

+ (void)getInvestMakeSureData:(NSString *)planId uId:(NSString *)userId withBlock:(void(^)(CMT_MakeSureModel *makeSureModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getInvestMakeSureData:planId uId:userId] success:^(id json) {
        CMT_Log(@"投资确认数据json－%@",json);
        if (block) {
            CMT_MakeSureModel *model = [[CMT_MakeSureModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"投资确认数据数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getFuliInvestMakeSureData:(NSString *)planId uId:(NSString *)userId withBlock:(void(^)(CMT_MakeSureModel *makeSureModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getFuliInvestMakeSureData:planId uId:userId] success:^(id json) {
                CMT_Log(@"福利金120000投资确认数据json－%@",json);
        if (block) {
            CMT_MakeSureModel *model = [[CMT_MakeSureModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
                CMT_Log(@"福利金120000投资确认数据数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}


+ (void)getInvestRecordData:(NSString *)planId withStartNum:(NSString *)startNum pageSize:(NSString *)size withBlock:(void(^)(CMT_InvestRecordModel *investRecordModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getInvestRecordData:planId stNum:startNum pageSize:size] success:^(id json) {
        CMT_Log(@"投资记录数据json－%@",json);
        if (block) {
            CMT_InvestRecordModel *model = [[CMT_InvestRecordModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"投资记录数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];

}

+ (void)getMyDataUid:(NSString *)userId withBlock:(void(^)(CMT_MyModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getMyData:userId] success:^(id json) {
        CMT_Log(@"我的主页数据json－%@",json);
        if (block) {
            CMT_MyModel *model = [[CMT_MyModel alloc]initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"我的主页数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];

}

+ (void)getUserBankCardAndAccountInfo:(NSString *)userId phone:(NSString *)phoneStr withBlock:(void(^)(CMT_BankCardAndAccountModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getUserBankCardAndAccountInfo:userId phone:phoneStr] success:^(id json) {
        CMT_Log(@"用户卡和账户数据json－%@",json);
        if (block) {
            CMT_BankCardAndAccountModel *model = [[CMT_BankCardAndAccountModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"用户卡和账户数据error－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getInvestConfirmPassword:(NSString *)telPhone password:(NSString *)pwd withBlock:(void(^)(CMT_InvestConfirmPwdModel *myModel, NSError *error))block{

    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getInvestConfirmPassword:telPhone password:pwd] success:^(id json) {
        CMT_Log(@"投资支付密码验证数据json－%@",json);
        if (block) {
            CMT_InvestConfirmPwdModel *model = [[CMT_InvestConfirmPwdModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"投资支付密码验证数据json－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getInvest:(NSString *)bidId uId:(NSString *)userId investAm:(NSString *)investAmount fringeBenefitAm:(NSString *)fringeBenefitAmount jxIdStr:(NSString *)jxId completeOperation:(NSString *)completeOperation investToken:(NSString *)investToken withBlock:(void(^)(CMT_ToInvestModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getInvest:bidId uId:userId investAm:investAmount fringeBenefitAm:fringeBenefitAmount jxIdStr:jxId completeOperation:completeOperation investToken:investToken] success:^(id json) {
        CMT_Log(@"投资数据json－%@",json);
        if (block) {
            CMT_ToInvestModel *model = [[CMT_ToInvestModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"投资数据json－%@",error);
        if (block) {
            block(nil, error);
        }
    }];

}

+ (void)getRealNameBindCardInfo:(NSString *)uid userIdentify:(NSString *)userIdentifyStr userName:(NSString *)userNameStr cardNo:(NSString *)cardNoStr userMobile:(NSString *)userMobileStr mobileSmsCode:(NSString *)mobileSmsCodeStr bankid:(NSString *)bankIdStr withBlock:(void(^)(CMT_RealNameModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getRealNameBindCardInfo:uid userIdentify:userIdentifyStr userName:userNameStr cardNo:cardNoStr userMobile:userMobileStr mobileSmsCode:mobileSmsCodeStr bankid:bankIdStr] success:^(id json) {
        CMT_Log(@"实名认证数据json－%@",json);
        if (block) {
            CMT_RealNameModel *model = [[CMT_RealNameModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"实名认证数据json－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getYzNumb:(NSString *)tel withType:(NSString *)type withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getYzNumb:tel withType:type] success:^(id json) {
        CMT_Log(@"获取验证码数据json－%@",json);
        if (block) {
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"获取验证码数据json－%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)getBanklistBlock:(void(^)(CMT_InvestmentPreBankModel *model, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getBankList] success:^(id json) {
        CMT_Log(@"银行卡列表信息json－%@",json);
        if(block){
            CMT_InvestmentPreBankModel *model = [CMT_InvestmentPreBankModel investmentPreBankModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"银行卡列表error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)registerConfirm:(NSString *)phone withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{

    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool registerConfirm:phone] success:^(id json) {
        CMT_Log(@"验证注册手机号信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"验证注册手机号信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}


+ (void)getRegister:(NSString *)phone captch:(NSString *)codeStr pwd:(NSString *)pwdStr invitationCode:(NSString *)inviteStr channelNumber:(NSString *)channelNumberStr  withBlock:(void(^)(CMT_AccountModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getRegister:phone captch:codeStr pwd:pwdStr invitationCode:inviteStr channelNumber:channelNumberStr] success:^(id json) {
        CMT_Log(@"注册信息json－%@",json);
        if(block){
            CMT_AccountModel *model = [CMT_AccountModel accountModelWithDict:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"注册信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getPwdLogin:(NSString *)param phone:(NSString *)phoneStr pwd:(NSString *)pwdStr withBlock:(void(^)(CMT_AccountModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getPwdLogin:param phone:phoneStr pwd:pwdStr] success:^(id json) {
        CMT_Log(@"密码登录信息json－%@",json);
        if(block){
            CMT_AccountModel *model = [CMT_AccountModel accountModelWithDict:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"密码登录信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}


+ (void)getCodeLogin:(NSString *)param phone:(NSString *)phoneStr captch:(NSString *)captchStr withBlock:(void(^)(CMT_AccountModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getCodeLogin:param phone:phoneStr captch:captchStr] success:^(id json) {
        CMT_Log(@"验证码登录信息json－%@",json);
        if(block){
            CMT_AccountModel *model = [CMT_AccountModel accountModelWithDict:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"验证码登录信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getRecharge:(NSString *)userId amount:(NSString *)amountStr withBlock:(void(^)(CMT_MyRechargeModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getRecharge:userId amount:amountStr] success:^(id json) {
        CMT_Log(@"充值申请信息json－%@",json);
        if(block){
            CMT_MyRechargeModel *model = [CMT_MyRechargeModel myRechargeModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"充值申请信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getRechargeConfirm:(NSString *)userId amount:(NSString *)amountStr orderNoThird:(NSString *)orderNoThirdStr payToken:(NSString *)payTokenStr orderNo:(NSString *)orderNoStr captch:(NSString *)captchStr withBlock:(void(^)(CMT_MyRechargrResultModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getRechargeConfirm:userId amount:amountStr orderNoThird:orderNoThirdStr payToken:payTokenStr orderNo:orderNoStr captch:captchStr] success:^(id json) {
        CMT_Log(@"充值申请验证信息json－%@",json);
        if(block){
            CMT_MyRechargrResultModel *model = [CMT_MyRechargrResultModel myRechargeResultModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"充值申请验证信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getReflectUserBankCardAndAccountInfo:(NSString *)userId  withBlock:(void(^)(CMT_ReflectBankAndAccountInfoModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getReflectUserBankCardAndAccountInfo:userId] success:^(id json) {
        CMT_Log(@"提现查询银行卡和账户信息json－%@",json);
        if(block){
            CMT_ReflectBankAndAccountInfoModel *model = [CMT_ReflectBankAndAccountInfoModel myModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"提现查询银行卡和账户信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getReflectRequest:(NSString *)userId amount:(NSString *)amountStr bankId:(NSString *)bankIdStr payPassword:(NSString *)payPasswordStr withBlock:(void(^)(CMT_MyRechargrResultModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getReflect:userId amount:amountStr bankId:bankIdStr payPassword:payPasswordStr] success:^(id json) {
        CMT_Log(@"提现申请信息json－%@",json);
        if(block){
            CMT_MyRechargrResultModel *model = [CMT_MyRechargrResultModel myRechargeResultModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"提现申请信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}

+ (void)getSetDealPwdLogin:(NSString *)userId phone:(NSString *)phoneStr captch:(NSString *)captchStr idNumber:(NSString *)idNumberStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getSetDealPwdLogin:userId phone:phoneStr captch:captchStr idNumber:idNumberStr] success:^(id json) {
        CMT_Log(@"设置交易密码第一步信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];;
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"设置交易密码第一步信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getSetDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr payPwd:(NSString *)payPwd rePayPwd:(NSString *)rePayPwd withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getSetDealPwdThreeStep:userId phone:phoneStr payPwd:payPwd rePayPwd:rePayPwd] success:^(id json) {
        CMT_Log(@"设置交易密码第三步信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];;
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"设置交易密码第三步信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getForgotDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr payPwd:(NSString *)payPwd rePayPwd:(NSString *)rePayPwd withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getForgotDealPwdThreeStep:userId phone:phoneStr payPwd:payPwd rePayPwd:rePayPwd] success:^(id json) {
        CMT_Log(@"忘记交易密码第三步信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];;
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"忘记交易密码第三步信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}

+ (void)getCompareDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr oldPayPwd:(NSString *)payPwd withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getCompareDealPwdThreeStep:userId phone:phoneStr oldPayPwd:payPwd] success:^(id json) {
        CMT_Log(@"对比原交易密码信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];;
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"对比原交易密码信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}

+ (void)getContractInforWithInvestId:(NSString *)investId period:(NSString *)period block:(void(^)(id jsonObject, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getContractInforWithInvestId:investId period:period] success:^(id json) {
        if(block){
            return block(json,nil);
        }
    } failure:^(NSError *error) {
        if(block){
            return block(nil,error);
        }
    }];
}


+ (void)getUpDateDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr newPayPwd:(NSString *)payPwd withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getUpDateDealPwdThreeStep:userId phone:phoneStr newPayPwd:payPwd] success:^(id json) {
        CMT_Log(@"修改交易密码信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];;
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"修改交易密码信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}


+ (void)getFuliJInInfo:(NSString *)userId investAmount:(NSString *)investAmountStr bidId:(NSString *)bidIdStr withBlock:(void(^)(CMT_UserFuLiJInModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getFuliJInInfo:userId investAmount:investAmountStr bidId:bidIdStr] success:^(id json) {
        CMT_Log(@"使用福利金信息json－%@",json);
        if(block){
            CMT_UserFuLiJInModel *model = [CMT_UserFuLiJInModel  myUserFuLiJInModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"使用福利金信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}

+ (void)getCalculatorInfoWithBlock:(void(^)(CMT_homeModel *myModel, NSError *error))block{
   
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getCalculatorInfo] success:^(id json) {
        CMT_Log(@"收益计算器信息json－%@",json);
        if(block){
            CMT_homeModel *model = [CMT_homeModel  myHomeModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"收益计算器信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}

+ (void)getTicket:(NSString *)userId type:(NSString *)typeStr investAmount:(NSString *)investAmountStr period:(NSString *)period WithBlock:(void(^)(CMT_MyRedOrCouponModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getTicket:userId type:typeStr investAmount:investAmountStr period:period] success:^(id json) {
        CMT_Log(@"我的加息券信息json－%@",json);
        if(block){
            CMT_MyRedOrCouponModel *model = [CMT_MyRedOrCouponModel  myRedOrCouponModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"我的加息券信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getRedTicket:(NSString *)userId type:(NSString *)typeStr WithBlock:(void(^)(CMT_MyRedOrCouponModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getRedTicket:userId type:typeStr] success:^(id json) {
        CMT_Log(@"我的红包信息json－%@",json);
        if(block){
            CMT_MyRedOrCouponModel *model = [CMT_MyRedOrCouponModel  myRedOrCouponModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"我的红包信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}

+ (void)getWelfareInvestRecord:(NSString *)userId start:(NSString *)start size:(NSString *)size WithBlock:(void(^)(CMT_MyFuLiInvestRecordModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getWelfareInvestRecord:userId start:start size:size] success:^(id json) {
        CMT_Log(@"福利金投资记录信息json－%@",json);
        if(block){
            CMT_MyFuLiInvestRecordModel *model = [CMT_MyFuLiInvestRecordModel  myModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"福利金投资记录信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}

+ (void)getWelfareRecord:(NSString *)userId start:(NSString *)start size:(NSString *)size WithBlock:(void(^)(CMT_MyFLIncomeRecordModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getWelfareRecord:userId start:start size:size] success:^(id json) {
        CMT_Log(@"福利金收支记录信息json－%@",json);
        if(block){
            CMT_MyFLIncomeRecordModel *model = [CMT_MyFLIncomeRecordModel  myModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"福利金收支记录信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}


+ (void)getAccountSafe:(NSString *)userId phone:(NSString *)phoneStr WithBlock:(void(^)(CMT_AccountSafeModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getAccountSafe:userId phone:phoneStr] success:^(id json) {
        CMT_Log(@"账户安全信息json－%@",json);
        if(block){
            CMT_AccountSafeModel *model = [[CMT_AccountSafeModel  alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"账户安全信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getCodeConfirm:(NSString *)userId phone:(NSString *)phoneStr captch:(NSString *)captchStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
   
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getCodeConfirm:userId phone:phoneStr captch:captchStr] success:^(id json) {
        CMT_Log(@"验证码验证信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"验证码验证信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}


+ (void)getSetLoginPwd:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getSetLoginPwd:userId phone:phoneStr newPwd:pwdStr] success:^(id json) {
        CMT_Log(@"设置登录信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"设置登录信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getConfirmOldLoginPwd:(NSString *)userId phone:(NSString *)phoneStr oldPwd:(NSString *)pwdStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getConfirmOldLoginPwd:userId phone:phoneStr oldPwd:pwdStr] success:^(id json) {
        CMT_Log(@"验证原登录密码是否正确信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"验证原登录密码是否正确信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getForgotLoginPwd:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getForgotLoginPwd:userId phone:phoneStr newPwd:pwdStr] success:^(id json) {
        CMT_Log(@"忘记登录信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"忘记登录信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getUpdateLoginPwddate:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getUpdateLoginPwddate:userId phone:phoneStr newPwd:pwdStr] success:^(id json) {
        CMT_Log(@"修改登录信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"修改登录信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getMySusuOrYueYueInfo:(NSString *)userId start:(NSString *)startStr size:(NSString *)sizeStr status:(NSString *)statuStr type:(NSString *)type withBlock:(void(^)(CMT_MySuOrYueModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getMySusuOrYueYueInfo:userId start:startStr size:sizeStr status:statuStr type:type] success:^(id json) {
        CMT_Log(@"速速赚或者月月息信息json－%@",json);
        if(block){
            CMT_MySuOrYueModel *model = [CMT_MySuOrYueModel myModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"速速赚或者月月息信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getMyInvestRecordDetailInfo:(NSString *)userId investId:(NSString *)investIdStr withBlock:(void(^)(CMT_MyInvestRecordDetailModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getMyInvestRecordDetailInfo:userId investId:investIdStr] success:^(id json) {
        CMT_Log(@"投资详情信息json－%@",json);
        if(block){
            CMT_MyInvestRecordDetailModel *model = [[CMT_MyInvestRecordDetailModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"投资详情信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}

+ (void)rpcAssetDebtServiceDetailInfoinvestId:(NSString *)creditId withBlock:(void(^)(CMT_AmountCodInfeModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool rpcAssetDebtServiceDetailInfoinvestId:creditId] success:^(id json) {
        CMT_Log(@"资产组合信息json－%@",json);
        if(block){
            CMT_AmountCodInfeModel *model = [[CMT_AmountCodInfeModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"资产组合信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
    
}


+ (void)getMoneyPlanInfo:(NSString *)userId investId:(NSString *)investIdStr withBlock:(void(^)(CMT_GetMyMoneyPlanModel *myModel, NSError *error))block{

    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getMoneyPlanInfo:userId investId:investIdStr] success:^(id json) {
        CMT_Log(@"收款计划信息json－%@",json);
        if(block){
            CMT_GetMyMoneyPlanModel *model = [CMT_GetMyMoneyPlanModel myModelWithDic:json];;
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"收款计划信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}


+ (void)getInvestShareStatusInfo:(NSString *)userId phone:(NSString *)phoneStr bidId:(NSString *)bidIdStr investId:(NSString *)investIdStr amount:(NSString *)amountStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
   
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getInvestShareStatusInfo:userId phone:phoneStr bidId:bidIdStr investId:investIdStr amount:amountStr] success:^(id json) {
        CMT_Log(@"投资后分享状态信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"投资后分享状态信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getShareContentInfo:(NSString *)userId phone:(NSString *)phoneStr withBlock:(void(^)(CMT_GetShareContentModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getShareContentInfo:userId phone:phoneStr] success:^(id json) {
        CMT_Log(@"获取分享内容信息json－%@",json);
        if(block){
            CMT_GetShareContentModel *model = [CMT_GetShareContentModel getShareContentModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"获取分享内容信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}


+ (void)getDealRecordInfo:(NSString *)userId phone:(NSString *)phoneStr start:(NSString *)startStr size:(NSString *)sizeStr withType:(NSString *)diffType withBlock:(void(^)(CMT_MyDealRecordModel *myModel, NSError *error))block{

    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getDealRecordInfo:userId phone:phoneStr start:startStr size:sizeStr withType:diffType] success:^(id json) {
        CMT_Log(@"交易记录信息json－%@",json);
        if(block){
            CMT_MyDealRecordModel *model = [CMT_MyDealRecordModel myModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"交易记录信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}


+ (void)getRechargeDealDetail:(NSString *)userId rechargeId:(NSString *)rechargeIdStr withBlock:(void(^)(CMT_DealRecordDetailModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getRechargeDealDetail:userId rechargeId:rechargeIdStr] success:^(id json) {
        CMT_Log(@"充值交易记录详情信息json－%@",json);
        if(block){
            CMT_DealRecordDetailModel *model = [[CMT_DealRecordDetailModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"充值交易记录详情信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}



+ (void)getInvestDealDetail:(NSString *)userId investId:(NSString *)investIdStr withBlock:(void(^)(CMT_DealRecordDetailModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getInvestDealDetail:userId investId:investIdStr] success:^(id json) {
        CMT_Log(@"理财交易记录详情信息json－%@",json);
        if(block){
            CMT_DealRecordDetailModel *model = [[CMT_DealRecordDetailModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"理财交易记录详情信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}



+ (void)getReflectDealDetail:(NSString *)userId withdrawalId:(NSString *)withdrawalIdStr withBlock:(void(^)(CMT_DealRecordDetailModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getReflectDealDetail:userId withdrawalId:withdrawalIdStr] success:^(id json) {
        CMT_Log(@"提现交易记录详情信息json－%@",json);
        if(block){
            CMT_DealRecordDetailModel *model = [[CMT_DealRecordDetailModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"提现交易记录详情信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getChangeOperation:(NSString *)userId investId:(NSString *)investIdStr operType:(NSString *)operTypeStr withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getChangeOperation:userId investId:investIdStr operType:operTypeStr] success:^(id json) {
        CMT_Log(@"复投信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"复投信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getAdverDataWithBlock:(void(^)(CMT_AdverModel *myModel, NSError *error))block{

    [CMT_AFNetWorking getWithBaseURL:ADVERINTERFACE success:^(id json) {
        CMT_Log(@"启动广告信息json－%@",json);
        if(block){
            CMT_AdverModel *model = [[CMT_AdverModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"启动广告信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getRealNameResultShareStatusInfo:(NSString *)userId phone:(NSString *)phoneStr  withBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getRealNameResultShare:userId phone:phoneStr] success:^(id json) {
        CMT_Log(@"实名认证分享状态信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"实名认证状态信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}


+ (void)getHowtoFulijin:(NSString *)userId phone:(NSString *)phoneStr withBlock:(void(^)(CMT_MyHowToGetFLJModel *myModel, NSError *error))block{
   
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getHowtoFulijin:userId phone:phoneStr] success:^(id json) {
        CMT_Log(@"如何获取福利金信息json－%@",json);
        if(block){
            CMT_MyHowToGetFLJModel *model = [CMT_MyHowToGetFLJModel myModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"如何获取福利金信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)getEveryOneSay:(NSString *)userId withBlock:(void(^)(CMT_EveryDayOneSayModel *myModel, NSError *error))block{

    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getEveryOneSay:userId] success:^(id json) {
        CMT_Log(@"每日一句信息json－%@",json);
        if(block){
            CMT_EveryDayOneSayModel *model = [[CMT_EveryDayOneSayModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"每日一句信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];

}


+ (void)getNewInvesterToInvestDetail:(NSString *)userId tel:(NSString *)mobileStr period:(NSString *)periodStr withBlock:(void(^)(CMT_NewInvesterToDetailModel *myModel, NSError *error))block{
 
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getNewInvesterToInvestDetail:userId tel:mobileStr period:periodStr] success:^(id json) {
        CMT_Log(@"新手任务去投资查询信息json－%@",json);
        if(block){
            CMT_NewInvesterToDetailModel *model = [[CMT_NewInvesterToDetailModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"新手任务去投资查询信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
    
}

//版本更新
+ (void)getUpdateVersion:(void(^)(CMT_MyUpVersionModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getUpDateVersion] success:^(id json) {
       CMT_Log(@"版本更新查询信息json－%@",json);
        if(block){
            CMT_MyUpVersionModel *model = [CMT_MyUpVersionModel getUpdateVersionContentModelWithDic:json];
            return block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"版本更新查询信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}
//应用雷达
+ (void)liveModelIdfiAndBlock:(void(^)(id jsonObject, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool liveModelIdfi] success:^(id json) {
        if(block){
            return block(json,nil);
        }
    } failure:^(NSError *error) {
        if(block){
            return block(nil,error);
        }
        
    }];
}

+ (void)getActivityShareContentWithActivityId:(NSString *)activityId userId:(NSString *)userId andBlock:(void(^)(CMT_ActivityShareContentModel *model, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool getActivityShareContentWithActivityId:activityId userId:userId] success:^(id json) {
        CMT_Log(@"获取活动分享内容json－%@",json);
        if(block){
            CMT_ActivityShareContentModel *model = [CMT_ActivityShareContentModel activityShareContentModelWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"获取活动分享内容error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)loginBottomAdverSwitchWithBlock:(void(^)(CMT_BaseModel *myModel, NSError *error))block{
    
    [CMT_AFNetWorking getWithBaseURL:[CMT_HttpTool loginBottomAdverSwitch] success:^(id json) {
        CMT_Log(@"登录底部显示广告的开关信息json－%@",json);
        if(block){
            CMT_BaseModel *model = [[CMT_BaseModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"登录底部显示广告的开关信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}

+ (void)showActivity:(NSString *)url withBlock:(void(^)(CMT_HomeAlertModel *myModel, NSError *error))block{
    [CMT_AFNetWorking getWithBaseURL:url success:^(id json) {
        CMT_Log(@"首页广告的信息json－%@",json);
        if(block){
            CMT_HomeAlertModel *model = [[CMT_HomeAlertModel alloc] initWithDic:json];
            block(model,nil);
        }
    } failure:^(NSError *error) {
        CMT_Log(@"首页广告的信息error－%@",error);
        if(block){
            return block(nil,error);
        }
    }];
}


@end
