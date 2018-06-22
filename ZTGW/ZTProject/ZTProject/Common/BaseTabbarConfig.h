//
//  BaseTabbarConfig.h
//  TLYL
//
//  Created by mac_zhou on 2018/3/7.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"
@interface BaseTabbarConfig : NSObject
@property (nonatomic, copy) NSString *context;
@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;

@end
