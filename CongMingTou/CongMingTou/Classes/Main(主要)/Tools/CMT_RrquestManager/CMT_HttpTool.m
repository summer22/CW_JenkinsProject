//
//  CMT_HttpTool.m
//  CongMingTou
//
//  Created by wzh on 16/5/9.
//  Copyright © 2016年 QiYuan All rights reserved.
//

#import "CMT_HttpTool.h"
#import <AdSupport/AdSupport.h>

@implementation CMT_HttpTool

+ (NSString *)getFirstListData{
    NSString  *userId = [CMT_Tools userId:[CMT_AccountTool accountModel].userId];
    return [NSString stringWithFormat:@"%@%@",FIRSTlIST,userId];
}

+ (NSString *)getSignData:(NSString *)userID{
    return [NSString stringWithFormat:@"%@%@",SIGNINTERFACE,CMT_SETDEFAULTUSERID(userID)];
}

+ (NSString *)getHadSignData:(NSString *)userID{
    return [NSString stringWithFormat:@"%@%@",HADSIGNINTERFACE,CMT_SETDEFAULTUSERID(userID)];
}

+ (NSString *)getInvestData:(NSString *)type{
    return [NSString stringWithFormat:@"%@%@",INVESTINTERFACE,type];
}

+ (NSString *)getInvestPlanDetailData:(NSString *)userID withBid:(NSString *)bid{
//    CMT_Log(@"投资标的详情===%@",[NSString stringWithFormat:@"%@%@-%@",INVESTDETAILINTERFACE,bid,CMT_SETDEFAULTUSERID(userID)]);
    return [NSString stringWithFormat:@"%@%@-%@",INVESTDETAILINTERFACE,bid,CMT_SETDEFAULTUSERID(userID)];
}

+ (NSString *)getInvestRecordData:(NSString *)planId stNum:(NSString *)startNum pageSize:(NSString *)size{
    return [NSString stringWithFormat:@"%@%@-%@-%@",INVESTRECORDLINTERFACE,planId,startNum,size];
}

+ (NSString *)getInvestMakeSureData:(NSString *)planId uId:(NSString *)userId{
    return [NSString stringWithFormat:@"%@%@-%@",INVESTMAKESUREINTERFACE,planId,CMT_SETDEFAULTUSERID(userId)];
}
//120000福利金投资
+ (NSString *)getFuliInvestMakeSureData:(NSString *)planId uId:(NSString *)userId{
    return [NSString stringWithFormat:@"%@%@-%@",FULIINVESTMAKESUREINTERFACE,planId,CMT_SETDEFAULTUSERID(userId)];
}

+ (NSString *)getMyData:(NSString *)userId{
    return [NSString stringWithFormat:@"%@%@",MYINTERFACE,CMT_SETDEFAULTUSERID(userId)];
}

+ (NSString *)getUserBankCardAndAccountInfo:(NSString *)userId phone:(NSString *)phoneStr{
    return [NSString stringWithFormat:@"%@%@-%@",USERBANKINFOINTERFACE,userId,phoneStr];
}

+ (NSString *)getInvestConfirmPassword:(NSString *)telPhone password:(NSString *)pwd{
    return [NSString stringWithFormat:@"%@%@-%@",INVESTCONFIRMPWDINFOINTERFACE,telPhone,pwd];
}

+ (NSString *)getInvest:(NSString *)bidId uId:(NSString *)userId investAm:(NSString *)investAmount fringeBenefitAm:(NSString *)fringeBenefitAmount jxIdStr:(NSString *)jxId completeOperation:(NSString *)completeOperation investToken:(NSString *)investToken{
    CMT_Log(@"投资url=%@",[NSString stringWithFormat:@"%@%@-%@-%@-%@&%@-%@-%@",INVESTNFOINTERFACE,bidId,CMT_SETDEFAULTUSERID(userId),investAmount,fringeBenefitAmount,jxId,completeOperation,investToken]);
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@&%@-%@-%@",INVESTNFOINTERFACE,bidId,CMT_SETDEFAULTUSERID(userId),investAmount,fringeBenefitAmount,jxId,completeOperation,investToken];
}

+ (NSString *)getRealNameBindCardInfo:(NSString *)uid userIdentify:(NSString *)userIdentifyStr userName:(NSString *)userNameStr cardNo:(NSString *)cardNoStr userMobile:(NSString *)userMobileStr mobileSmsCode:(NSString *)mobileSmsCodeStr bankid:(NSString *)bankIdStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@-%@-%@-%@",REALNAMEINTERFACE,CMT_SETDEFAULTUSERID(uid),userIdentifyStr,userNameStr,cardNoStr,userMobileStr,mobileSmsCodeStr,bankIdStr];
}

+ (NSString *)getYzNumb:(NSString *)tel withType:(NSString *)type{
    return [NSString stringWithFormat:@"%@%@-%@",GETYZNUMBINTERFACE,tel,type];
}

+ (NSString *)getBankList{
    return [NSString stringWithFormat:@"%@%@",CMT_SERVER_URL,GETBANKLISTINTOINTERF];
}

+ (NSString *)getRecharge:(NSString *)userId{
    return [NSString stringWithFormat:@"%@%@",CMT_SERVER_URL,CMT_SETDEFAULTUSERID(userId)];
}

+ (NSString *)registerConfirm:(NSString *)phone{
    return [NSString stringWithFormat:@"%@%@",REGISTERCONFIRM,phone];
}

+ (NSString *)getRegister:(NSString *)phone captch:(NSString *)codeStr pwd:(NSString *)pwdStr invitationCode:(NSString *)inviteStr channelNumber:(NSString *)channelNumberStr{
    NSString *adid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@&%@",REGISTERINTOINTERF,phone,codeStr,pwdStr,@"00000",adid];
}

+ (NSString *)getPwdLogin:(NSString *)param phone:(NSString *)phoneStr pwd:(NSString *)pwdStr{
    return [NSString stringWithFormat:@"%@%@-%@",PWDLOGININTOINTERF,phoneStr,pwdStr];
}

+ (NSString *)getCodeLogin:(NSString *)param phone:(NSString *)phoneStr captch:(NSString *)captchStr{
    return [NSString stringWithFormat:@"%@%@-%@",CODELOGININTOINTERF,phoneStr,captchStr];
}

+ (NSString *)getRecharge:(NSString *)userId amount:(NSString *)amountStr{
    return [NSString stringWithFormat:@"%@%@-%@",RECHARGRINTERFACE,CMT_SETDEFAULTUSERID(userId),amountStr];
}

+ (NSString *)getRechargeConfirm:(NSString *)userId amount:(NSString *)amountStr orderNoThird:(NSString *)orderNoThirdStr payToken:(NSString *)payTokenStr orderNo:(NSString *)orderNoStr captch:(NSString *)captchStr{
    return [NSString stringWithFormat:@"%@%@&%@&%@&%@&%@&%@",RECHARGRCONFIRMINTERFACE,CMT_SETDEFAULTUSERID(userId),amountStr,orderNoThirdStr,payTokenStr,orderNoStr,captchStr];
}

+ (NSString *)getReflectUserBankCardAndAccountInfo:(NSString *)userId{
    return [NSString stringWithFormat:@"%@%@",REFLECTUSERBANKINFOINTERFACE,CMT_SETDEFAULTUSERID(userId)];
}

+ (NSString *)getReflect:(NSString *)userId amount:(NSString *)amountStr bankId:(NSString *)bankIdStr payPassword:(NSString *)payPasswordStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@-%@",REFLECTINTERFACE,CMT_SETDEFAULTUSERID(userId),amountStr,bankIdStr,payPasswordStr,@"1"];
}

+ (NSString *)getSetDealPwdLogin:(NSString *)userId phone:(NSString *)phoneStr captch:(NSString *)captchStr idNumber:(NSString *)idNumberStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@",SETDEALINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,captchStr,idNumberStr];
}

+ (NSString *)getSetDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr payPwd:(NSString *)payPwd rePayPwd:(NSString *)rePayPwd{
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@",SETDEALPWDTHREEINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,payPwd,rePayPwd];
}

+ (NSString *)getCompareDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr oldPayPwd:(NSString *)payPwd{
    return [NSString stringWithFormat:@"%@%@-%@-%@",COMPAREOLDDEALPWDINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,payPwd];
}

+ (NSString *)getUpDateDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr newPayPwd:(NSString *)payPwd{
    return [NSString stringWithFormat:@"%@%@-%@-%@",CHANGEDEALPWDINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,payPwd];
}


+ (NSString *)getFuliJInInfo:(NSString *)userId investAmount:(NSString *)investAmountStr bidId:(NSString *)bidIdStr{
//    CMT_Log(@"使用福利金===%@",[NSString stringWithFormat:@"%@%@-%@-%@",MyWelfareINTERFACE,userId,investAmountStr,bidIdStr]);

    return [NSString stringWithFormat:@"%@%@-%@-%@",MyWelfareINTERFACE,CMT_SETDEFAULTUSERID(userId),investAmountStr,bidIdStr];
}

+ (NSString *)getCalculatorInfo{
    return CALCULATORINTERFACE;
}

+ (NSString *)getTicket:(NSString *)userId type:(NSString *)typeStr investAmount:(NSString *)investAmountStr period:(NSString *)periodStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@",MYTICKETSINTERFACE,userId,typeStr,investAmountStr,periodStr];
}

+ (NSString *)getRedTicket:(NSString *)userId type:(NSString *)typeStr{
    return [NSString stringWithFormat:@"%@%@-%@",MYREDTICKETINTERFACE,CMT_SETDEFAULTUSERID(userId),typeStr];
}

+ (NSString *)getWelfareInvestRecord:(NSString *)userId start:(NSString *)start size:(NSString *)size{
    return [NSString stringWithFormat:@"%@%@-%@-%@",WELFAREINVESTINTERFACE,CMT_SETDEFAULTUSERID(userId),start,size];
}

+ (NSString *)getWelfareRecord:(NSString *)userId start:(NSString *)start size:(NSString *)size{
    return [NSString stringWithFormat:@"%@%@-%@-%@",WELFARERECORDINTERFACE,CMT_SETDEFAULTUSERID(userId),start,size];
}

+ (NSString *)getAccountSafe:(NSString *)userId phone:(NSString *)phoneStr{
    return [NSString stringWithFormat:@"%@%@-%@",ACCOUNTSAFEINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr];
}

+ (NSString *)getCodeConfirm:(NSString *)userId phone:(NSString *)phoneStr captch:(NSString *)captchStr{
//    CMT_Log(@"==%@",[NSString stringWithFormat:@"%@%@-%@-%@",CODECONFIRMINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,captchStr]);
    
    return [NSString stringWithFormat:@"%@%@-%@-%@",CODECONFIRMINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,captchStr];
}

+ (NSString *)getSetLoginPwd:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@",SETLOGININTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,pwdStr];
}

+ (NSString *)getForgotLoginPwd:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@",FORGOTLOGININTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,pwdStr];
}

+ (NSString *)getUpdateLoginPwddate:(NSString *)userId phone:(NSString *)phoneStr newPwd:(NSString *)pwdStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@",RESETLOGININTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,pwdStr];
}

+ (NSString *)getConfirmOldLoginPwd:(NSString *)userId phone:(NSString *)phoneStr oldPwd:(NSString *)pwdStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@",CONFIRMOLDLOGINPWD,CMT_SETDEFAULTUSERID(userId),phoneStr,pwdStr];
}

+ (NSString *)getForgotDealPwdThreeStep:(NSString *)userId phone:(NSString *)phoneStr payPwd:(NSString *)payPwd rePayPwd:(NSString *)rePayPwd{
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@",FORGOTDEALPWDTHREEINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,payPwd,rePayPwd];
}

+ (NSString *)getRealNameBankInfo:(NSString *)userId phone:(NSString *)phoneStr{
    return [NSString stringWithFormat:@"%@%@-%@",FORGOTDEALPWDTHREEINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr];
}

+ (NSString *)getMySusuOrYueYueInfo:(NSString *)userId start:(NSString *)startStr size:(NSString *)sizeStr status:(NSString *)statuStr type:(NSString *)type{
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@-%@",MYYUEYUEANDSUSUINTERFACE,CMT_SETDEFAULTUSERID(userId),startStr,sizeStr,type,statuStr];
}

+ (NSString *)getMyInvestRecordDetailInfo:(NSString *)userId investId:(NSString *)investIdStr{
    
//    CMT_Log(@"==%@",[NSString stringWithFormat:@"%@%@-%@",MYINVESTRECORDDETAILINTERFACE,userId,investIdStr]);
    
    return [NSString stringWithFormat:@"%@%@-%@",MYINVESTRECORDDETAILINTERFACE,CMT_SETDEFAULTUSERID(userId),investIdStr];
}

+ (NSString *)getMoneyPlanInfo:(NSString *)userId investId:(NSString *)investIdStr{
    return [NSString stringWithFormat:@"%@%@-%@",GETMONEYPLANINTERFACE,CMT_SETDEFAULTUSERID(userId),investIdStr];
}

+ (NSString *)getInvestShareStatusInfo:(NSString *)userId phone:(NSString *)phoneStr bidId:(NSString *)bidIdStr investId:(NSString *)investIdStr amount:(NSString *)amountStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@-%@",INVESTSHAREADDRATEINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr,bidIdStr,investIdStr,amountStr];
}

+ (NSString *)getShareContentInfo:(NSString *)userId phone:(NSString *)phoneStr{
    return [NSString stringWithFormat:@"%@%@-%@",GETSHAREINFOINTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr];
}


+ (NSString *)getDealRecordInfo:(NSString *)userId phone:(NSString *)phoneStr start:(NSString *)startStr size:(NSString *)sizeStr withType:(NSString *)diffType{
    NSString *urlStr;
    if ([diffType isEqualToString:@"1"]) {
        urlStr = RECHARGRDEALRECORDINTERFACE;
    }else if([diffType isEqualToString:@"2"]){
        urlStr = INVESTDEALRECORDINTERFACE;
    }else if([diffType isEqualToString:@"3"]){
        urlStr = BACKMONEYDEALRECORDINTERFACE;
    }else if([diffType isEqualToString:@"4"]){
        urlStr = REFLECTDEALRECORDINTERFACE;
    }else{
        urlStr = REDDEALRECORDINTERFACE;
    }
    return [NSString stringWithFormat:@"%@%@-%@-%@-%@",urlStr,CMT_SETDEFAULTUSERID(userId),phoneStr,startStr,sizeStr];
}

+ (NSString *)getRechargeDealDetail:(NSString *)userId rechargeId:(NSString *)rechargeIdStr{
    
//    CMT_Log(@"充值记录详情%@",[NSString stringWithFormat:@"%@%@-%@",RECHAGEDEALDETAILINTERFACE,CMT_SETDEFAULTUSERID(userId),rechargeIdStr]);

    return [NSString stringWithFormat:@"%@%@-%@",RECHAGEDEALDETAILINTERFACE,CMT_SETDEFAULTUSERID(userId),rechargeIdStr];
}

+ (NSString *)getInvestDealDetail:(NSString *)userId investId:(NSString *)investIdStr{
    return [NSString stringWithFormat:@"%@%@-%@",INVESTDEALLDETAILINTERFACE,CMT_SETDEFAULTUSERID(userId),investIdStr];
}

+ (NSString *)getReflectDealDetail:(NSString *)userId withdrawalId:(NSString *)withdrawalIdStr{
//    CMT_Log(@"提现记录详情%@",[NSString stringWithFormat:@"%@%@-%@",REFLECTDEALLDETAILINTERFACE,CMT_SETDEFAULTUSERID(userId),withdrawalIdStr]);

    return [NSString stringWithFormat:@"%@%@-%@",REFLECTDEALLDETAILINTERFACE,CMT_SETDEFAULTUSERID(userId),withdrawalIdStr];
}

+ (NSString *)getChangeOperation:(NSString *)userId investId:(NSString *)investIdStr operType:(NSString *)operTypeStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@",CHANGEOPERATIONINTERFACE,CMT_SETDEFAULTUSERID(userId),investIdStr,operTypeStr];
}

+ (NSString *)getRealNameResultShare:(NSString *)userId phone:(NSString *)phoneStr{
    return [NSString stringWithFormat:@"%@%@-%@",SHAREREALNAME,CMT_SETDEFAULTUSERID(userId),phoneStr];
}

+ (NSString *)getHowtoFulijin:(NSString *)userId phone:(NSString *)phoneStr{
    return [NSString stringWithFormat:@"%@%@-%@",HOWTOGETFULIJININTERFACE,CMT_SETDEFAULTUSERID(userId),phoneStr];
}

+ (NSString *)getEveryOneSay:(NSString *)userId{
    return [NSString stringWithFormat:@"%@%@",EVERYDAYONESAY,CMT_SETDEFAULTUSERID(userId)];
}

+ (NSString *)getNewInvesterToInvestDetail:(NSString *)userId tel:(NSString *)mobileStr period:(NSString *)periodStr{
    return [NSString stringWithFormat:@"%@%@-%@-%@",NEWINVESTERPLANSTATUS,CMT_SETDEFAULTUSERID(userId),mobileStr,periodStr];
}

+ (NSString *)advertisingOpenState{
    return [NSString stringWithFormat:@"%@%@",CMT_SERVER_URL,CMT_AdvertisingOpenState];
}

+ (NSString *)getContractInforWithInvestId:(NSString *)investId period:(NSString *)period{
    return [NSString stringWithFormat:@"%@%@-%@.htm",USERAGRELECTPURCHCODE,investId,period];
}

+ (NSString *)getActivityShareContentWithActivityId:(NSString *)activityId userId:(NSString *)userId{
//    CMT_Log(@"获取活动分享的分享内容 ＝＝%@",[NSString stringWithFormat:@"%@%@-%@",CMT_ActivityShareContent,activityId,userId]);
    return [NSString stringWithFormat:@"%@%@-%@",CMT_ActivityShareContent,activityId,userId];
}

+ (NSString *)liveModelIdfi
{
    NSString *adid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return [NSString stringWithFormat:@"%@%@%@/%@",CMT_SERVER_URL,CMT_LiveMobileIdfi,@"0",adid];
}

+ (NSString *)getUpDateVersion{
    return [NSString stringWithFormat:@"%@%@&%@",CMT_UpdateVersion,[CMT_Tools getShortVersion],@"2"];
}
+ (NSString *)rpcAssetDebtServiceDetailInfoinvestId:(NSString *)creditId{
    return [NSString stringWithFormat:@"%@%@",RPCASSSEDAEJDSGS,creditId];
}

+ (NSString *)loginBottomAdverSwitch{
//    CMT_Log(@"登录底部广告显示开关%@",LOGINADVERSWITCH);
    return LOGINADVERSWITCH;
}

@end
