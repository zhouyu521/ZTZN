//
//  BaseModel.m
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "BaseModel.h"
#import "TLModelCleanNil.h"
@implementation BaseModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

+ (NSArray *)getListByJSONModel:(NSArray *)jsonArray aClass:(Class)aClass
{
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:jsonArray.count];
    
    for(int i=0; i<jsonArray.count; i++){
        BaseModel *obj = [[aClass alloc] initWithDictionary:[jsonArray objectAtIndex:i] error:nil];
        if(obj){
            obj = [TLModelCleanNil cleanModel:obj];
            [list addObject:obj];
            
        }
        
        
    }
    
    return list;
    
}


+ (BaseModel *)getIdentyInfoByJSONModel:(NSDictionary *)jsonDic aClass:(Class)aClass
{
    BaseModel *obj = [[aClass alloc] initWithDictionary:jsonDic error:nil];
    obj = [TLModelCleanNil cleanModel:obj];
    return obj;
}

@end
