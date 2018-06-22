//
//  TLDataBase.m
//  TLYL
//
//  Created by mac_zhou on 2018/3/6.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "TLDataBase.h"

@implementation TLDataBase

+(TLDataBase *)dataBase
{
    static TLDataBase * instance =nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance =[[TLDataBase alloc]init];
            [instance initDBWithName:@"tlDataBase"];
        }
    });
    return instance;
}

@end
