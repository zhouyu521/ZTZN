//
//  NSBundle+ZYGLocal.h
//  Dese
//
//  Created by apple on 2017/11/29.
//  Copyright © 2017年 hewenjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (ZYGLocal)

+ (NSString *)zyg_localizedStringForKey:(NSString *)key value:(NSString *)value;
+ (NSString *)zyg_localizedStringForKey:(NSString *)key;

@end
