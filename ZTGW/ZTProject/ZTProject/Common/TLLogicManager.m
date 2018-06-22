//
//  TLLogicManager.m
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "TLLogicManager.h"
#import "AESCipher.h"
#import "OpenUDID.h"
//#import "SMSSDKUIZonesViewController.h"
#import "BaseTabbarConfig.h"
#import "ZTLoginPage.h"
@implementation TLLogicManager
+ (TLLogicManager*)shareInstance
{
    static TLLogicManager * instance =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance =[[self alloc]init];
        }
    });
    return instance;
}

#pragma mark 验证码aes解密
- (void)aesDecrypt:(NSString *)decStr completeBlock:(void(^)(id result))block
{
    NSString * totalDes= aesDecryptString(decStr, ENCRYPT_KEY);

    block(totalDes);
}


///判断用户发送的文字中是否包含了Emoji表情
- (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}


//判断获取验证码时输入的参数
- (BOOL)judgeTextCorrectWithTelphone:(NSString *)telphone picCode:(NSString *)picCode
{
    if ([self stringContainsEmoji:telphone]) {
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kInputCorrectTel")];
        return NO;
    }
    if (telphone.length ==0) {
        
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kTelNumNotEmpty")];
        return NO;
    }
    
    //    if (telphone.length != 11) {
    //
    //        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
    //        return NO;
    //    }
    
    //    if (![CommonFunctions validateMobileFirst:telphone]) {
    //        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
    //        return NO;
    //    }
    
    if (!picCode.length) {
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kInputPicCode")];
        return NO;
    }
    
    return YES;
}

- (BOOL)judgeTextCorrectWithTelphone:(NSString *)telphone pwd:(NSString *)pwd
{
    if ([self stringContainsEmoji:telphone]) {
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kInputCorrectTel")];
        return NO;
    }
    if (telphone.length ==0) {
        
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kTelNumNotEmpty")];
        return NO;
    }
    
    //    if (telphone.length != 11) {
    //
    //        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
    //        return NO;
    //    }
    
    //    if (![CommonFunctions validateMobileFirst:telphone]) {
    //        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
    //        return NO;
    //    }
    
    if (!pwd.length) {
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kInputPwd")];
        return NO;
    }
    
    return YES;
    
}

//判断手机号 验证码 有没有输入正确
- (BOOL)judgeTextCorrectWithTelphone:(NSString *)telphone numCode:(NSString *)numCode
{
    if ([self stringContainsEmoji:telphone]) {
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kInputCorrectTel")];
        return NO;
    }
    if (telphone.length ==0) {
        
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kTelNumNotEmpty")];
        return NO;
    }
    
    //    if (telphone.length != 11) {
    //
    //        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
    //        return NO;
    //    }
    
    //    if (![CommonFunctions validateMobileFirst:telphone]) {
    //        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
    //        return NO;
    //    }
    
    if (!numCode.length) {
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kInputTelCode")];
        return NO;
    }
    
    return YES;
    
}



#pragma mark ---v11



- (void)getVerifyCodePictureCompleteBlock:(void(^)(UIImage * imageCode))block
{
    
    //    int index =[self getRandomNumber:10 to:100000];
    //    NSString * random =[NSString stringWithFormat:@"%d",index];
    
    [SVProgressHUD showWithStatus:ZYGLocalString(@"kGetPicCode")];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString * uuid =[OpenUDID value];
    NSString * hasUrl =[NSString stringWithFormat:@"%@/deseappV11",K_ServerUrl];
    NSString * serverUrl =[NSString stringWithFormat:@"%@/sms/imageCaptcha?",hasUrl];
    NSString * url = [serverUrl stringByAppendingString:[NSString stringWithFormat:@"macid=%@",uuid]];
    
    
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * result=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        DLog(@"%@",result);
        if ([result isKindOfClass:[NSDictionary class]]) {
            [SVProgressHUD showErrorWithStatus:result[@"errorMsg"]];
        }else{
            [SVProgressHUD dismiss];
            UIImage * image =[UIImage imageWithData:responseObject];
            block(image);
        }
        
        
        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //
        //            dispatch_async(dispatch_get_main_queue(), ^{
        //
        //            });
        //        });
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:ZYGLocalString(@"kPicCode_GetError")];
    }];
    
}



#pragma mark ---v11

//获取验证码之前验证手机号是否被注册
-(void)getVerifyWithPhoneCode:(NSString *)phoneCode imageCode:(NSString *) imageCode countryCode:(NSString *)countryCode checkUserExist:(NSString *)checkUserExist completeBlock:(void(^)(NSString * phoneCode))block
{
    [SVProgressHUD showWithStatus:ZYGLocalString(@"kGetTelCode")];
    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    params[@"verificationCode"]=imageCode;
    params[@"telephone"]=phoneCode;
    params[@"macid"]=[OpenUDID value];
    params[@"checkUserExist"]=checkUserExist;
    params[@"internationalCode"]=countryCode;
    //    NSString * serverUrl =@"http://127.0.0.1:8083/deseappV10/sms/checkMessageCode.do?";
    
    
    [[TLHttpClient shared]postWithNewAPI:@"sms/sendSmsCaptcha" Params:params class:nil callback:^(BaseModel *response, NSInteger status, NSString *msg, id result, NSArray *dataList) {
        if (status == CODE_SUCCESS) {
            
            [SVProgressHUD dismiss];
            block(result[@"data"][@"smsCaptcha"]);
            
        }else{
            [SVProgressHUD showErrorWithStatus:msg];
        }
    }];
}

-(void)getVerifyWithPhoneCode:(NSString *)phoneCode imageCode:(NSString *) imageCode countryCode:(NSString *)countryCode completeBlock:(void(^)(NSString * phoneCode))block;
{
    [SVProgressHUD showWithStatus:ZYGLocalString(@"kGetTelCode")];
    NSMutableDictionary * params =[NSMutableDictionary dictionary];
    params[@"verificationCode"]=imageCode;
    params[@"telephone"]=phoneCode;
    params[@"macid"]=[OpenUDID value];
    params[@"internationalCode"]=countryCode;
    
    //    NSString * serverUrl =@"http://127.0.0.1:8083/deseappV10/sms/checkMessageCode.do?";
    
    
    
    [[TLHttpClient shared]postWithNewAPI:@"sms/sendSmsCaptcha" Params:params class:nil callback:^(BaseModel *response, NSInteger status, NSString *msg, id result, NSArray *dataList) {
        if (status == CODE_SUCCESS) {
            
            [SVProgressHUD dismiss];
            block(result[@"data"][@"smsCaptcha"]);
            
        }else{
            [SVProgressHUD showErrorWithStatus:msg];
        }
    }];
    
}

//清空Token
- (void)clearTokenAndUserId
{
    KAccountModel.user.userId =@"";
    KAccountModel.token=@"";
    
}


- (void)getCountryCodeWithTarget:(id)target sender:(id)sender completeBlock:(void(^)(NSString * countryCode))block{
    
//    SMSSDKUIZonesViewController *vc = [[SMSSDKUIZonesViewController alloc] initWithResult:^(BOOL cancel, NSString *zone, NSString *countryName) {
//
//        if (!cancel && zone && countryName)
//        {
//            if ([sender isKindOfClass:[UIButton class]]) {
//                [(UIButton *)sender setTitle:zone forState:UIControlStateNormal];
//            }
//            if ([sender isKindOfClass:[UILabel class]]) {
//                [(UILabel *)sender setText:zone];
//            }
//
//            block(zone);
//        }
//    }];
//
//    BaseNavController *nav = [[BaseNavController alloc] initWithRootViewController:vc];
//
//    [target presentViewController:nav animated:YES completion:nil];
    
}

//跳转到登录页
- (void)jumpToLoginPage
{
    k_window.rootViewController =[[BaseNavController alloc]initWithRootViewController:[[ZTLoginPage alloc]init]];
}

//跳转到首页
- (void)jumpToHomePage
{
    BaseTabbarConfig *tabBarControllerConfig = [[BaseTabbarConfig alloc] init];
    CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    k_window.rootViewController = tabBarController;
}


@end
