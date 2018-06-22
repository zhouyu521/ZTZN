//
//  BaseModel.h
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "JSONModel.h"

@interface BaseModel : JSONModel
+ (NSArray *)getListByJSONModel:(NSArray *)jsonArray aClass:(Class)aClass;
+ (BaseModel *)getIdentyInfoByJSONModel:(NSDictionary *)jsonDic aClass:(Class)aClass;


@end
