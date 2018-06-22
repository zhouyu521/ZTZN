//
//  TLAccountTool.m
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "TLAccountTool.h"
#import "TLDataBase.h"
@implementation TLAccountTool

+ (TLAccountModel *)getAccountMod
{
    NSDictionary * accountDic=[[TLDataBase dataBase] getObjectById:K_LoginUserID fromTable:K_LoginTable];
    TLAccountModel * accountModel =[[TLAccountModel alloc]initWithDictionary:accountDic error:nil];
    return accountModel;
}

@end
