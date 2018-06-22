//
//  TLLogicManager.h
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLHttpClient.h"
@interface TLLogicManager : NSObject

+ (TLLogicManager*)shareInstance;

#pragma mark 验证码aes解密
- (void)aesDecrypt:(NSString *)decStr completeBlock:(void(^)(id result))block;

//判断手机号 图形验证码  有没有输入正确
- (BOOL)judgeTextCorrectWithTelphone:(NSString *)telphone picCode:(NSString *)picCode;

//判断手机号 密码 有没有输入正确
- (BOOL)judgeTextCorrectWithTelphone:(NSString *)telphone pwd:(NSString *)pwd;

//判断手机号 验证码 有没有输入正确
- (BOOL)judgeTextCorrectWithTelphone:(NSString *)telphone numCode:(NSString *)numCode;


//获取验证码之前验证手机号是否被注册
-(void)getVerifyWithPhoneCode:(NSString *)phoneCode imageCode:(NSString *) imageCode countryCode:(NSString *)countryCode checkUserExist:(NSString *)checkUserExist completeBlock:(void(^)(NSString * phoneCode))block;

//获取图片验证码图片
- (void)getVerifyCodePictureCompleteBlock:(void(^)(UIImage * imageCode))block;

//获取短信验证码
- (void)getVerifyWithPhoneCode:(NSString *)phoneCode imageCode:(NSString *) imageCode countryCode:(NSString *)countryCode completeBlock:(void(^)(NSString * phoneCode))block;


//清空token和userid
- (void)clearTokenAndUserId;

//选完国际区号回调countryCode
- (void)getCountryCodeWithTarget:(id)target sender:(id)sender completeBlock:(void(^)(NSString * countryCode))block;

//跳转到登录页
- (void)jumpToLoginPage;

//跳转到首页
- (void)jumpToHomePage;


@end
