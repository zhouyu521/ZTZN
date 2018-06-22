//
//  TLHttpClient.h
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface TLHttpClient : NSObject

@property (nonatomic,strong) UIAlertView * tokenKillAlertView;

+(TLHttpClient*)shared ;

#pragma mark ---前缀deseappV11
-(void)postWithNewAPI:(NSString *)url Params:(NSDictionary*)params class:(Class)aclass callback:(void (^)(BaseModel* response,NSInteger status,NSString * msg,id result,NSArray * dataList))callback;



@end
