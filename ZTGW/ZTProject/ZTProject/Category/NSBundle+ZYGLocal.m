//
//  NSBundle+ZYGLocal.m
//  Dese
//
//  Created by apple on 2017/11/29.
//  Copyright © 2017年 hewenjie. All rights reserved.
//

#import "NSBundle+ZYGLocal.h"

@implementation NSBundle (ZYGLocal)



+ (NSString *)zyg_localizedStringForKey:(NSString *)key {
    return [self zyg_localizedStringForKey:key value:@""];
}

+ (NSString *)zyg_localizedStringForKey:(NSString *)key value:(NSString *)value {

    NSString *value1 = [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
    return value1;
}

@end
