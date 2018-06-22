//
//  TLHttpClient.m
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "TLHttpClient.h"
#import "AESCipher.h"
#define requestDuration 20 //超时时长

@implementation TLHttpClient



+(TLHttpClient*)shared {
    static TLHttpClient * _instance =nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if(_instance == nil) {
            _instance = [[TLHttpClient alloc]init];
        }
    });
    return _instance;
}

#pragma mark ---前缀deseappV11
-(void)postWithNewAPI:(NSString *)url Params:(NSDictionary*)params class:(Class)aclass callback:(void (^)(BaseModel* response,NSInteger status,NSString * msg,id result,NSArray * dataList))callback
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //https 未配置证书
    //    [manager setSecurityPolicy:[self customSecurityPolicy]];
    if (!params) {
        params = [NSMutableDictionary dictionary];
    }
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"application/xml", nil];
    manager.requestSerializer.timeoutInterval = requestDuration;//超时时长
    
    __block BaseModel* response =[[BaseModel alloc]init];
    //    response.afom =manager;
    __block NSString * msg =nil;
    __block NSInteger  status;
    __block id backResult =nil;
    __block NSArray * dataList =nil;
    
    
    //    [params setValue:@"2" forKey:@"use_type"]; //1.android 2.iOS
    
    [params setValue:KAccountModel.token forKey:@"token"];
    [params setValue:KAccountModel.user.userId forKey:@"userId"];
    
    
    
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    DLog(@"UrlString =====================================================================\n %@",
         [K_ServerUrl stringByAppendingString:[NSString stringWithFormat:@"/deseappV11/%@%@",url,jsonString]]);
    
    NSString *encrypt = aesEncryptString(jsonString, ENCRYPT_KEY);
    
    NSMutableDictionary * newParams =[NSMutableDictionary dictionary];
    
    newParams[@"reqParams"]=encrypt;
    [manager POST:[NSString stringWithFormat:@"%@/deseappV11/%@", K_ServerUrl, url] parameters:newParams progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        DLog(@"---------------responseObject---------------\n%@",responseObject)
        if ([[responseObject objectForKey:@"resultCode"]  integerValue] == CODE_SUCCESS){
            
            NSMutableDictionary * responseM =[NSMutableDictionary dictionaryWithDictionary:responseObject];
            NSString * dataStr =responseObject[@"data"];
            [[TLLogicManager shareInstance] aesDecrypt:dataStr completeBlock:^(NSString * result) {
                DLog(@"---------------json---------------\n%@",result)
                if (result.length>0) {
                    NSData *jsonData = [result dataUsingEncoding:NSUTF8StringEncoding];
                    NSError *err;
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:&err];
                    [responseM setObject:dic forKey:@"data"];
                    
                    id  jsonNewData =responseM[@"data"];
                    
                    if (jsonNewData ==(NSString *)[NSNull null]) {
                        return ;
                    }
                    if ([jsonNewData isKindOfClass:[NSDictionary class]]) {
                        response =[BaseModel getIdentyInfoByJSONModel:jsonNewData aClass:aclass];
                    }else if([jsonData isKindOfClass:[NSArray class]]){
                        dataList =[BaseModel getListByJSONModel:jsonNewData aClass:aclass];
                        
                    }
                    status =[responseM[@"resultCode"] integerValue];
                    msg =responseM[@"errorMsg"];
                    backResult =responseM;
                    if(callback != nil)
                        callback(response,status,msg,backResult,dataList);
                }
            }];
        }else{
            
            if ([[responseObject objectForKey:@"resultCode"] integerValue] == 101000 || [[responseObject objectForKey:@"resultCode"] integerValue] == 101003) {
                
//                [ShareInstance shareInstance].stateCode = [responseObject objectForKey:@"resultCode"] ;
//                if(callback != nil)
//                {
//                    callback(response,[[ShareInstance shareInstance].stateCode integerValue],responseObject[@"errorMsg"],backResult,dataList);
//                }


                [SVProgressHUD dismiss];

                if (!self.tokenKillAlertView) {
                    __weak typeof(self) unself =self;
                    self.tokenKillAlertView=[KPAlertView initWithTitle:@"提示" message:responseObject[@"errorMsg"] cancleButtonTitle:@"知道了" otherButtonsArray:nil clickAtIndex:^(NSInteger buttonIndex) {
                        unself.tokenKillAlertView =nil;

                        [[TLLogicManager shareInstance]jumpToLoginPage];

                    }];
                }
                
            }else{
                
                [SVProgressHUD showErrorWithStatus:responseObject[@"errorMsg"]];
                
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self afterExecute:error];
        callback(response,-1,msg,backResult,dataList);
    }];
    
    
    
}

-(void)afterExecute:(NSError *) error {
    
    if (error == nil) {
        return;
    }
    if ([error.userInfo[NSLocalizedDescriptionKey] length]>0) {
        if (error.code == NSURLErrorNotConnectedToInternet) {
            [self alertErrorMessage:error.userInfo[NSLocalizedDescriptionKey]];
        }else{
            [self alertErrorMessage:error.userInfo[NSLocalizedDescriptionKey]];
        }
        return;
    }
    
}

-(void)alertErrorMessage:(NSString *)message
{
    if (message.length>0) {
        [SVProgressHUD showErrorWithStatus:message];
    }
    
}

@end
