//
//  TLModelCleanNil.m
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "TLModelCleanNil.h"
#import <objc/runtime.h>
@implementation TLModelCleanNil
+ (id)cleanModel:(id)model
{
    
    //  取得当前类类型
    Class cls = [model class];
    
    unsigned int ivarsCnt = 0;
    //　获取类成员变量列表，ivarsCnt为类成员数量
    Ivar *ivars = class_copyIvarList(cls, &ivarsCnt);
    
    //　遍历成员变量列表，其中每个变量都是Ivar类型的结构体
    for (const Ivar *p = ivars; p < ivars + ivarsCnt; ++p)
    {
        Ivar const ivar = *p;
        
        //　取得变量类型
        // 通过 type[0]可以判断其具体的内置类型
        const char *type = ivar_getTypeEncoding(ivar);
        
        NSString *clsStr = [NSString stringWithFormat:@"%s",type];
        //        yeedoctorLog(@"%@",clsStr);
        
        if ([clsStr isEqualToString:@"@\"NSString\""]) {
            //　获取变量名
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            // 若此变量未在类结构体中声明而只声明为Property，则变量名加前缀 '_'下划线
            // 比如 @property(retain) NSString *abc;则 key == _abc;
            //　获取变量值
            id value = [model valueForKey:key];
            NSString *str = value;
            if (value==nil||[str isEqualToString:@"null"]) {
                [model setValue:@"" forKey:key];
            }
        }
        
    }
    return model;
}
@end
